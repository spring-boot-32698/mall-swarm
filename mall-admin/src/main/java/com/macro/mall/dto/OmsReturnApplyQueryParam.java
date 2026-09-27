package com.macro.mall.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;

/**
 * Order return request query parameters
 * Created by macro on 2018/10/18.
 */
@Getter
@Setter
public class OmsReturnApplyQueryParam {
    @Schema(title = "Service order number")
    private Long id;
    @Schema(title = "Recipient name/number")
    private String receiverKeyword;
    @Schema(title = "Application status:0->Pending;1->Returning;2->Completed;3->Rejected")
    private Integer status;
    @Schema(title = "Application time")
    private String createTime;
    @Schema(title = "Handler")
    private String handleMan;
    @Schema(title = "Handling time")
    private String handleTime;
}
