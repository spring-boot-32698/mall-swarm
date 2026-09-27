package com.macro.mall.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * Product query parameters
 * Created by macro on 2018/4/27.
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class PmsProductQueryParam {
    @Schema(title = "Shelf status")
    private Integer publishStatus;
    @Schema(title = "Review status")
    private Integer verifyStatus;
    @Schema(title = "Product name fuzzy keyword")
    private String keyword;
    @Schema(title = "Product item number")
    private String productSn;
    @Schema(title = "Product category ID")
    private Long productCategoryId;
    @Schema(title = "Product brand ID")
    private Long brandId;
}
