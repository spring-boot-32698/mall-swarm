package com.macro.mall.config;

import cn.dev33.satoken.jwt.StpLogicJwtForSimple;
import cn.dev33.satoken.stp.StpLogic;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * @auther macrozheng
 * @description Sa-Token Related configuration
 * @date 2023/11/28
 * @github https://github.com/macrozheng
 */
@Configuration
public class SaTokenConfigure {
    // Sa-Token Integrate jwt (Simple Simple mode)
    @Bean
    public StpLogic getStpLogicJwt() {
        return new StpLogicJwtForSimple();
    }
}

