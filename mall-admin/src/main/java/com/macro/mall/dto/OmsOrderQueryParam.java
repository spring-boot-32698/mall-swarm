package com.macro.mall.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;

/**
 * Order query parameters
 * Created by macro on 2018/10/11.
 */
@Getter
@Setter
public class OmsOrderQueryParam {
    @Schema(title = "Order number")
    private String orderSn;
    @Schema(title = "Recipient name/number")
    private String receiverKeyword;
    @Schema(title = "Order status:0->Pending payment;1->Pending shipment;2->Shipped;3->Completed;4->Closed;5->Invalid order")
    private Integer status;
    @Schema(title = "Order type:0->Normal order;1->Flash sale order")
    private Integer orderType;
    @Schema(title = "Order source:0->PC Order;1->app Order")
    private Integer sourceType;
    @Schema(title = "Order submission time")
    private String createTime;
}
