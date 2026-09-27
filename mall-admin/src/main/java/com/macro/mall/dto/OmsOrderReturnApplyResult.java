package com.macro.mall.dto;

import com.macro.mall.model.OmsCompanyAddress;
import com.macro.mall.model.OmsOrderReturnApply;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;

/**
 * Application info wrapper
 * Created by macro on 2018/10/18.
 */
public class OmsOrderReturnApplyResult extends OmsOrderReturnApply {
    @Getter
    @Setter
    @Schema(title = "Company shipping address")
    private OmsCompanyAddress companyAddress;
}
