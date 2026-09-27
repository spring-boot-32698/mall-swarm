package com.macro.mall.dto;

import com.macro.mall.model.SmsCoupon;
import com.macro.mall.model.SmsCouponProductCategoryRelation;
import com.macro.mall.model.SmsCouponProductRelation;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

/**
 * Coupon info wrapper, including bound products and bound categories
 * Created by macro on 2018/8/28.
 */
public class SmsCouponParam extends SmsCoupon {
    @Getter
    @Setter
    @Schema(title = "Products bound to the coupon")
    private List<SmsCouponProductRelation> productRelationList;
    @Getter
    @Setter
    @Schema(title = "Product categories bound to the coupon")
    private List<SmsCouponProductCategoryRelation> productCategoryRelationList;
}
