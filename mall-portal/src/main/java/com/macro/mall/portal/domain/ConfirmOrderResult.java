package com.macro.mall.portal.domain;

import com.macro.mall.model.UmsIntegrationConsumeSetting;
import com.macro.mall.model.UmsMemberReceiveAddress;

import java.math.BigDecimal;
import java.util.List;

/**
 * Confirmation order info wrapper
 * Created by macro on 2018/8/30.
 */
public class ConfirmOrderResult {
    //Cart information including promotion info
    private List<CartPromotionItem> cartPromotionItemList;
    //User shipping address list
    private List<UmsMemberReceiveAddress> memberReceiveAddressList;
    //User available coupon list
    private List<SmsCouponHistoryDetail> couponHistoryDetailList;
    //Points usage rules
    private UmsIntegrationConsumeSetting integrationConsumeSetting;
    //Points held by the member
    private Integer memberIntegration;
    //Calculated amount
    private CalcAmount calcAmount;

    public List<CartPromotionItem> getCartPromotionItemList() {
        return cartPromotionItemList;
    }

    public void setCartPromotionItemList(List<CartPromotionItem> cartPromotionItemList) {
        this.cartPromotionItemList = cartPromotionItemList;
    }

    public List<UmsMemberReceiveAddress> getMemberReceiveAddressList() {
        return memberReceiveAddressList;
    }

    public void setMemberReceiveAddressList(List<UmsMemberReceiveAddress> memberReceiveAddressList) {
        this.memberReceiveAddressList = memberReceiveAddressList;
    }

    public List<SmsCouponHistoryDetail> getCouponHistoryDetailList() {
        return couponHistoryDetailList;
    }

    public void setCouponHistoryDetailList(List<SmsCouponHistoryDetail> couponHistoryDetailList) {
        this.couponHistoryDetailList = couponHistoryDetailList;
    }

    public UmsIntegrationConsumeSetting getIntegrationConsumeSetting() {
        return integrationConsumeSetting;
    }

    public void setIntegrationConsumeSetting(UmsIntegrationConsumeSetting integrationConsumeSetting) {
        this.integrationConsumeSetting = integrationConsumeSetting;
    }

    public Integer getMemberIntegration() {
        return memberIntegration;
    }

    public void setMemberIntegration(Integer memberIntegration) {
        this.memberIntegration = memberIntegration;
    }

    public CalcAmount getCalcAmount() {
        return calcAmount;
    }

    public void setCalcAmount(CalcAmount calcAmount) {
        this.calcAmount = calcAmount;
    }

    public static class CalcAmount{
        //Total amount of order products
        private BigDecimal totalAmount;
        //Shipping fee
        private BigDecimal freightAmount;
        //Promotion
        private BigDecimal promotionAmount;
        //Amount payable
        private BigDecimal payAmount;

        public BigDecimal getTotalAmount() {
            return totalAmount;
        }

        public void setTotalAmount(BigDecimal totalAmount) {
            this.totalAmount = totalAmount;
        }

        public BigDecimal getFreightAmount() {
            return freightAmount;
        }

        public void setFreightAmount(BigDecimal freightAmount) {
            this.freightAmount = freightAmount;
        }

        public BigDecimal getPromotionAmount() {
            return promotionAmount;
        }

        public void setPromotionAmount(BigDecimal promotionAmount) {
            this.promotionAmount = promotionAmount;
        }

        public BigDecimal getPayAmount() {
            return payAmount;
        }

        public void setPayAmount(BigDecimal payAmount) {
            this.payAmount = payAmount;
        }
    }
}
