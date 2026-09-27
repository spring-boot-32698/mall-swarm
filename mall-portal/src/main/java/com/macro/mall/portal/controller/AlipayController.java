package com.macro.mall.portal.controller;

import com.macro.mall.common.api.CommonResult;
import com.macro.mall.portal.config.AlipayConfig;
import com.macro.mall.portal.domain.AliPayParam;
import com.macro.mall.portal.service.AlipayService;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * @auther macrozheng
 * @description Alipay payment Controller
 * @date 2023/9/8
 * @github https://github.com/macrozheng
 */
@Controller
@Tag(name = "AlipayController", description = "Alipay payment related APIs")
@RequestMapping("/alipay")
public class AlipayController {

    @Autowired
    private AlipayConfig alipayConfig;
    @Autowired
    private AlipayService alipayService;

    @Operation(summary = "Alipay desktop website payment")
    @RequestMapping(value = "/pay", method = RequestMethod.GET)
    public void pay(AliPayParam aliPayParam, HttpServletResponse response) throws IOException {
        response.setContentType("text/html;charset=" + alipayConfig.getCharset());
        response.getWriter().write(alipayService.pay(aliPayParam));
        response.getWriter().flush();
        response.getWriter().close();
    }

    @Operation(summary = "Alipay mobile website payment")
    @RequestMapping(value = "/webPay", method = RequestMethod.GET)
    public void webPay(AliPayParam aliPayParam, HttpServletResponse response) throws IOException {
        response.setContentType("text/html;charset=" + alipayConfig.getCharset());
        response.getWriter().write(alipayService.webPay(aliPayParam));
        response.getWriter().flush();
        response.getWriter().close();
    }

    @Operation(summary = "Alipay asynchronous callback",description = "Must be a POST request; return success on successful execution, and return failure otherwise failure")
    @RequestMapping(value = "/notify", method = RequestMethod.POST)
    public String notify(HttpServletRequest request){
        Map<String, String> params = new HashMap<>();
        Map<String, String[]> requestParams = request.getParameterMap();
        for (String name : requestParams.keySet()) {
            params.put(name, request.getParameter(name));
        }
        return alipayService.notify(params);
    }

    @Operation(summary = "Alipay unified acquiring offline transaction query",description = "Transaction status returned when order payment succeeds:TRADE_SUCCESS")
    @RequestMapping(value = "/query", method = RequestMethod.GET)
    @ResponseBody
    public CommonResult<String> query(String outTradeNo, String tradeNo){
        return CommonResult.success(alipayService.query(outTradeNo,tradeNo));
    }
}
