package com.macro.mall.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;

/**
 * Order modify recipient info parameters
 * Created by macro on 2018/10/29.
 */
@Getter
@Setter
public class OmsReceiverInfoParam {
    @Schema(title = "Order ID")
    private Long orderId;
    @Schema(title = "Recipient name")
    private String receiverName;
    @Schema(title = "Recipient phone")
    private String receiverPhone;
    @Schema(title = "Recipient postal code")
    private String receiverPostCode;
    @Schema(title = "Detailed address")
    private String receiverDetailAddress;
    @Schema(title = "Province/Municipality")
    private String receiverProvince;
    @Schema(title = "City")
    private String receiverCity;
    @Schema(title = "District")
    private String receiverRegion;
    @Schema(title = "Order status:0->Pending payment;1->Pending shipment;2->Shipped;3->Completed;4->Closed;5->Invalid order")
    private Integer status;
}
