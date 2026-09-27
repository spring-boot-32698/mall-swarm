package com.macro.mall.portal.config;

import lombok.Getter;
import lombok.Setter;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * @auther macrozheng
 * @description Alipay payment related configuration
 * @date 2023/9/8
 * @github https://github.com/macrozheng
 */
@Getter
@Setter
@Component
@ConfigurationProperties(prefix = "alipay")
public class AlipayConfig {
    /**
     * Alipay gateway
     */
    private String gatewayUrl;
    /**
     * Application ID
     */
    private String appId;
    /**
     * Application private key
     */
    private String appPrivateKey;
    /**
     * Alipay public key
     */
    private String alipayPublicKey;
    /**
     * Page return path invoked by Alipay after the user confirms payment
     * The development environment is:http://localhost:8060/#/pages/money/paySuccess
     */
    private String returnUrl;
    /**
     * After successful payment, Alipay’s server actively sends an asynchronous notification callback to the merchant server (must be reachable from the public internet)
     * The development environment is:http://localhost:8085/alipay/notify
     */
    private String notifyUrl;
    /**
     * Parameter return format, only supports JSON
     */
    private String format = "JSON";
    /**
     * Encoding format used by the request
     */
    private String charset = "UTF-8";
    /**
     * Signature algorithm type used to generate the signature string
     */
    private String signType = "RSA2";
}
