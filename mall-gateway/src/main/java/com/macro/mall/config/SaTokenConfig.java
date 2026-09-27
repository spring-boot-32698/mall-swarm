package com.macro.mall.config;

import cn.dev33.satoken.context.SaHolder;
import cn.dev33.satoken.exception.NotLoginException;
import cn.dev33.satoken.exception.NotPermissionException;
import cn.dev33.satoken.reactor.filter.SaReactorFilter;
import cn.dev33.satoken.router.SaHttpMethod;
import cn.dev33.satoken.router.SaRouter;
import cn.dev33.satoken.stp.StpUtil;
import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.convert.Convert;
import com.macro.mall.common.api.CommonResult;
import com.macro.mall.common.constant.AuthConstant;
import com.macro.mall.util.StpMemberUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.util.AntPathMatcher;
import org.springframework.util.PathMatcher;

import java.util.*;

/**
 * @auther macrozheng
 * @description Sa-Token Related configuration
 * @date 2023/11/28
 * @github https://github.com/macrozheng
 */
@Configuration
public class SaTokenConfig {

    @Autowired
    private RedisTemplate<String, Object> redisTemplate;

    /**
     * Register the Sa-Token global filter
     */
    @Bean
    public SaReactorFilter getSaReactorFilter(IgnoreUrlsConfig ignoreUrlsConfig) {
        return new SaReactorFilter()
                // Intercepted URLs
                .addInclude("/**")
                // Configure whitelist paths
                .setExcludeList(ignoreUrlsConfig.getUrls())
                // Authentication method: on every access entering
                .setAuth(obj -> {
                    // Let OPTIONS preflight requests pass directly
                    SaRouter.match(SaHttpMethod.OPTIONS).stop();
                    // Login authentication: storefront mall member authentication
                    SaRouter.match("/mall-portal/**", r -> StpMemberUtil.checkLogin()).stop();
                    // Login authentication: admin backend user authentication
                    SaRouter.match("/mall-admin/**", r -> StpUtil.checkLogin());
                    // Permission authentication: admin backend user permission checks
                    // Get the permission rules required by each API path cached in Redis
                    Map<Object, Object> pathResourceMap = redisTemplate.opsForHash().entries(AuthConstant.PATH_RESOURCE_MAP);
                    // Get the permissions required to access the current API (when a path maps to multiple resources, holding any one of them grants access)
                    List<String> needPermissionList = new ArrayList<>();
                    // Get the current request path
                    String requestPath = SaHolder.getRequest().getRequestPath();
                    // Create path matcher
                    PathMatcher pathMatcher = new AntPathMatcher();
                    Set<Map.Entry<Object, Object>> entrySet = pathResourceMap.entrySet();
                    for (Map.Entry<Object, Object> entry : entrySet) {
                        String pattern = (String) entry.getKey();
                        if (pathMatcher.match(pattern, requestPath)) {
                            needPermissionList.add((String) entry.getValue());
                        }
                    }
                    // Authenticate when the API requires permission
                    if(CollUtil.isNotEmpty(needPermissionList)){
                        SaRouter.match(requestPath, r -> StpUtil.checkPermissionOr(Convert.toStrArray(needPermissionList)));
                    }
                })
                // setAuth Method exception handling
                .setError(this::handleException);
    }

    /**
     * Custom exception handling
     */
    private CommonResult handleException(Throwable e) {
        //Set the error return format to JSON
        SaHolder.getResponse()
                .setHeader("Content-Type", "application/json; charset=utf-8")
                .setHeader("Access-Control-Allow-Origin", "*")
                .setHeader("Cache-Control", "no-cache");
        CommonResult result = null;
        if(e instanceof NotLoginException){
            result = CommonResult.unauthorized(null);
        }else if(e instanceof NotPermissionException){
            result = CommonResult.forbidden(null);
        }else{
            result = CommonResult.failed(e.getMessage());
        }
        return result;
    }
}

