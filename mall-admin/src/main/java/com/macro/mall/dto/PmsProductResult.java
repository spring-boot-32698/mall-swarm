package com.macro.mall.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;

/**
 * Result returned when querying a single product for modification
 * Created by macro on 2018/4/26.
 */
public class PmsProductResult extends PmsProductParam {
    @Getter
    @Setter
    @Schema(title = "Parent of the selected product category id")
    private Long cateParentId;
}
