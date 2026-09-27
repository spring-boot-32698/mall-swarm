package com.macro.mall.portal.domain;

import lombok.Data;

import java.math.BigDecimal;

/**
 * @auther macrozheng
 * @description Alipay payment request parameters
 * @date 2023/9/8
 * @github https://github.com/macrozheng
 */
@Data
public class AliPayParam {
    /**
     * Merchant order number, customized by the merchant, must be unique
     */
    private String outTradeNo;
    /**
     * Product title / transaction title / order title / order keywords, etc.
     */
    private String subject;
    /**
     * Total order amount, in yuan, accurate to two decimal places
     */
    private BigDecimal totalAmount;
}
