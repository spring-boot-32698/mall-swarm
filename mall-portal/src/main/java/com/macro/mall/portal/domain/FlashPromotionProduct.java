package com.macro.mall.portal.domain;

import com.macro.mall.model.PmsProduct;
import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;

/**
 * Flash sale info and product object wrapper
 * Created by macro on 2019/1/28.
 */
@Getter
@Setter
public class FlashPromotionProduct extends PmsProduct{
    private BigDecimal flashPromotionPrice;
    private Integer flashPromotionCount;
    private Integer flashPromotionLimit;
}
