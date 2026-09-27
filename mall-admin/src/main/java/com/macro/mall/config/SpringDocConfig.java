package com.macro.mall.config;

import io.swagger.v3.oas.models.Components;
import io.swagger.v3.oas.models.ExternalDocumentation;
import io.swagger.v3.oas.models.OpenAPI;
import io.swagger.v3.oas.models.info.Info;
import io.swagger.v3.oas.models.info.License;
import io.swagger.v3.oas.models.security.SecurityRequirement;
import io.swagger.v3.oas.models.security.SecurityScheme;
import org.springdoc.core.customizers.GlobalOpenApiCustomizer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * SpringDoc Related configuration
 * Created by macro on 2024/3/5.
 */
@Configuration
public class SpringDocConfig implements WebMvcConfigurer {

    private static final String SECURITY_SCHEME_NAME = "Authorization";

    @Bean
    public OpenAPI mallAdminOpenAPI() {
        return new OpenAPI()
                .info(new Info().title("mall Admin system")
                        .description("mall Admin related API documentation")
                        .version("v1.0.0")
                        .license(new License().name("Apache 2.0")
                                .url("https://github.com/macrozheng/mall-learning")))
                .externalDocs(new ExternalDocumentation()
                        .description("SpringBoot Full documentation for the e-commerce project mall (60K+ Stars)")
                        .url("http://www.macrozheng.com"))
                .addSecurityItem(new SecurityRequirement().addList(SECURITY_SCHEME_NAME))
                .components(new Components()
                        .addSecuritySchemes(SECURITY_SCHEME_NAME,
                                new SecurityScheme()
                                        .name(SECURITY_SCHEME_NAME)
                                        .type(SecurityScheme.Type.HTTP)
                                        .scheme("bearer")
                                        .bearerFormat("JWT")));
    }

    @Override
    public void addViewControllers(ViewControllerRegistry registry) {
        //Configure access`/swagger-ui/`When using this path you can jump directly to`/swagger-ui/index.html`
        registry.addViewController("/swagger-ui/").setViewName("redirect:/swagger-ui/index.html");
    }

    @Bean
    public GlobalOpenApiCustomizer orderGlobalOpenApiCustomizer() {
        //Fix the issue where Knife4j cannot automatically add the auth header after authentication is configured
        return openApi -> {
            //Add authentication parameters globally
            if (openApi.getPaths() != null) {
                openApi.getPaths().forEach((s, pathItem) -> {
                    pathItem.readOperations().forEach(operation -> {
                        operation.addSecurityItem(new SecurityRequirement().addList(SECURITY_SCHEME_NAME));
                    });
                });
            }
        };
    }

}

