package com.macro.mall.demo.component;

import feign.RequestInterceptor;
import feign.RequestTemplate;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import java.util.Enumeration;

/**
 * Interceptor used by Feign to pass request headers
 * Created by macro on 2019/10/18.
 */
public class FeignRequestInterceptor implements RequestInterceptor {
    @Override
    public void apply(RequestTemplate requestTemplate) {
        ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder
                .getRequestAttributes();
        if (attributes != null) {
            HttpServletRequest request = attributes.getRequest();
            Enumeration<String> headerNames = request.getHeaderNames();
            //When calling internal APIs that require authentication, obtain the original auth header and set it on requestTemplate
            if (headerNames != null) {
                while (headerNames.hasMoreElements()) {
                    String name = headerNames.nextElement();
                    //Passing the content-length header causes java.io.IOException: Incomplete output stream
                    if ("content-length".equalsIgnoreCase(name)) {
                        continue;
                    }
                    String values = request.getHeader(name);
                    requestTemplate.header(name, values);
                }
            }
        }
    }
}
