package com.macro.mall.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;

/**
 * Modify order fee information parameters
 * Created by macro on 2018/10/29.
 */
@Getter
@Setter
public class OmsMoneyInfoParam {
    @Schema(title = "Order ID")
    private Long orderId;
    @Schema(title = "Shipping fee amount")
    private BigDecimal freightAmount;
    @Schema(title = "Discount amount applied by admin when adjusting an order")
    private BigDecimal discountAmount;
    @Schema(title = "Order status:0->Pending payment;1->Pending shipment;2->Shipped;3->Completed;4->Closed;5->Invalid order")
    private Integer status;
}
