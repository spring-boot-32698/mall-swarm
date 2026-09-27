package com.macro.mall.dto;

import com.macro.mall.model.OmsOrder;
import com.macro.mall.model.OmsOrderItem;
import com.macro.mall.model.OmsOrderOperateHistory;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

/**
 * Order detail information
 * Created by macro on 2018/10/11.
 */
public class OmsOrderDetail extends OmsOrder {
    @Getter
    @Setter
    @Schema(title = "Order product list")
    private List<OmsOrderItem> orderItemList;
    @Getter
    @Setter
    @Schema(title = "Order operation record list")
    private List<OmsOrderOperateHistory> historyList;
}
