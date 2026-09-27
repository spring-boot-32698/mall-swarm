package com.macro.mall.portal.service;


import com.macro.mall.portal.domain.AliPayParam;

import java.util.Map;

/**
 * @auther macrozheng
 * @description Alipay payment Service
 * @date 2023/9/8
 * @github https://github.com/macrozheng
 */
public interface AlipayService {
    /**
     * Generate desktop payment page from submitted parameters
     */
    String pay(AliPayParam aliPayParam);

    /**
     * Alipay asynchronous callback handling
     */
    String notify(Map<String, String> params);

    /**
     * Query Alipay transaction status
     * @param outTradeNo Merchant order ID
     * @param tradeNo Alipay transaction number
     * @return Alipay transaction status
     */
    String query(String outTradeNo, String tradeNo);

    /**
     * Generate mobile payment page from submitted parameters
     */
    String webPay(AliPayParam aliPayParam);
}
