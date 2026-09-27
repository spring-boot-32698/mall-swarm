package com.macro.mall.portal.service.impl;

import cn.hutool.core.util.StrUtil;
import com.alibaba.fastjson.JSONObject;
import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.internal.util.AlipaySignature;
import com.alipay.api.request.AlipayTradePagePayRequest;
import com.alipay.api.request.AlipayTradeQueryRequest;
import com.alipay.api.request.AlipayTradeWapPayRequest;
import com.alipay.api.response.AlipayTradeQueryResponse;
import com.macro.mall.mapper.OmsOrderMapper;
import com.macro.mall.portal.config.AlipayConfig;
import com.macro.mall.portal.domain.AliPayParam;
import com.macro.mall.portal.service.AlipayService;
import com.macro.mall.portal.service.OmsPortalOrderService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Map;

/**
 * @auther macrozheng
 * @description Alipay payment Service implementation class
 * @date 2023/9/8
 * @github https://github.com/macrozheng
 */
@Slf4j
@Service
public class AlipayServiceImpl implements AlipayService {
    @Autowired
    private AlipayConfig alipayConfig;
    @Autowired
    private AlipayClient alipayClient;
    @Autowired
    private OmsOrderMapper orderMapper;
    @Autowired
    private OmsPortalOrderService portalOrderService;
    @Override
    public String pay(AliPayParam aliPayParam) {
        AlipayTradePagePayRequest request = new AlipayTradePagePayRequest();
        if(StrUtil.isNotEmpty(alipayConfig.getNotifyUrl())){
            //Asynchronous receiving URL, publicly accessible
            request.setNotifyUrl(alipayConfig.getNotifyUrl());
        }
        if(StrUtil.isNotEmpty(alipayConfig.getReturnUrl())){
            //Synchronous redirect URL
            request.setReturnUrl(alipayConfig.getReturnUrl());
        }
        //******Required parameter******
        JSONObject bizContent = new JSONObject();
        //Merchant order number, customized by the merchant, must be unique
        bizContent.put("out_trade_no", aliPayParam.getOutTradeNo());
        //Payment amount, minimum 0.01 yuan
        bizContent.put("total_amount", aliPayParam.getTotalAmount());
        //Order title, special symbols not allowed
        bizContent.put("subject", aliPayParam.getSubject());
        //Fixed values for the desktop website payment scenario FAST_INSTANT_TRADE_PAY
        bizContent.put("product_code", "FAST_INSTANT_TRADE_PAY");
        request.setBizContent(bizContent.toString());
        String formHtml = null;
        try {
            formHtml = alipayClient.pageExecute(request).getBody();
        } catch (AlipayApiException e) {
            e.printStackTrace();
        }
        return formHtml;
    }

    @Override
    public String notify(Map<String, String> params) {
        String result = "failure";
        boolean signVerified = false;
        try {
            //Call the SDK to verify the signature
            signVerified = AlipaySignature.rsaCheckV1(params, alipayConfig.getAlipayPublicKey(), alipayConfig.getCharset(), alipayConfig.getSignType());
        } catch (AlipayApiException e) {
            log.error("Payment callback signature verification error!",e);
            e.printStackTrace();
        }
        if (signVerified) {
            String tradeStatus = params.get("trade_status");
            if("TRADE_SUCCESS".equals(tradeStatus)){
                result = "success";
                log.info("notify Method was called,tradeStatus:{}",tradeStatus);
                String outTradeNo = params.get("out_trade_no");
                portalOrderService.paySuccessByOrderSn(outTradeNo,1);
            }else{
                log.warn("Order payment not successful,trade_status:{}",tradeStatus);
            }
        } else {
            log.warn("Payment callback signature verification failed!");
        }
        return result;
    }

    @Override
    public String query(String outTradeNo, String tradeNo) {
        AlipayTradeQueryRequest request = new AlipayTradeQueryRequest();
        //******Required parameter******
        JSONObject bizContent = new JSONObject();
        //Set query parameters; at least one of out_trade_no and trade_no must be passed
        if(StrUtil.isNotEmpty(outTradeNo)){
            bizContent.put("out_trade_no",outTradeNo);
        }
        if(StrUtil.isNotEmpty(tradeNo)){
            bizContent.put("trade_no",tradeNo);
        }
        //Transaction settlement info: trade_settle_info
        String[] queryOptions = {"trade_settle_info"};
        bizContent.put("query_options", queryOptions);
        request.setBizContent(bizContent.toString());
        AlipayTradeQueryResponse response = null;
        try {
            response = alipayClient.execute(request);
        } catch (AlipayApiException e) {
            log.error("Error querying Alipay bill!",e);
        }
        if(response.isSuccess()){
            log.info("Alipay bill queried successfully!");
            if("TRADE_SUCCESS".equals(response.getTradeStatus())){
                portalOrderService.paySuccessByOrderSn(outTradeNo,1);
            }
        } else {
            log.error("Failed to query Alipay bill!");
        }
        //Transaction status: WAIT_BUYER_PAY (transaction created, awaiting buyer payment), TRADE_CLOSED (unpaid transaction closed on timeout, or fully refunded after payment), TRADE_SUCCESS (transaction paid successfully), TRADE_FINISHED (transaction finished, no refunds possible)
        return response.getTradeStatus();
    }

    @Override
    public String webPay(AliPayParam aliPayParam) {
        AlipayTradeWapPayRequest request = new AlipayTradeWapPayRequest ();
        if(StrUtil.isNotEmpty(alipayConfig.getNotifyUrl())){
            //Asynchronous receiving URL, publicly accessible
            request.setNotifyUrl(alipayConfig.getNotifyUrl());
        }
        if(StrUtil.isNotEmpty(alipayConfig.getReturnUrl())){
            //Synchronous redirect URL
            request.setReturnUrl(alipayConfig.getReturnUrl());
        }
        //******Required parameter******
        JSONObject bizContent = new JSONObject();
        //Merchant order number, customized by the merchant, must be unique
        bizContent.put("out_trade_no", aliPayParam.getOutTradeNo());
        //Payment amount, minimum 0.01 yuan
        bizContent.put("total_amount", aliPayParam.getTotalAmount());
        //Order title, special symbols not allowed
        bizContent.put("subject", aliPayParam.getSubject());
        //Default values passed for mobile website payment FAST_INSTANT_TRADE_PAY
        bizContent.put("product_code", "QUICK_WAP_WAY");
        request.setBizContent(bizContent.toString());
        String formHtml = null;
        try {
            formHtml = alipayClient.pageExecute(request).getBody();
        } catch (AlipayApiException e) {
            e.printStackTrace();
        }
        return formHtml;
    }
}
