package com.macro.mall.portal.domain;

import com.macro.mall.model.OmsCartItem;

import java.math.BigDecimal;

/**
 * Created by macro on 2018/8/27.
 * Wrapper for promotion info in the cart
 */
public class CartPromotionItem extends OmsCartItem{
    //Promotion activity information
    private String promotionMessage;
    //Amount reduced by promotion, per product
    private BigDecimal reduceAmount;
    //Product real stock (remaining stock - locked stock)
    private Integer realStock;
    //Points awarded for purchasing products
    private Integer integration;
    //Growth value awarded for purchasing products
    private Integer growth;
    public String getPromotionMessage() {
        return promotionMessage;
    }

    public void setPromotionMessage(String promotionMessage) {
        this.promotionMessage = promotionMessage;
    }

    public BigDecimal getReduceAmount() {
        return reduceAmount;
    }

    public void setReduceAmount(BigDecimal reduceAmount) {
        this.reduceAmount = reduceAmount;
    }

    public Integer getRealStock() {
        return realStock;
    }

    public void setRealStock(Integer realStock) {
        this.realStock = realStock;
    }

    public Integer getIntegration() {
        return integration;
    }

    public void setIntegration(Integer integration) {
        this.integration = integration;
    }

    public Integer getGrowth() {
        return growth;
    }

    public void setGrowth(Integer growth) {
        this.growth = growth;
    }
}
