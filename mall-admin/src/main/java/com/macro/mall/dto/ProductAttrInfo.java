package com.macro.mall.dto;


import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * Attribute information corresponding to product category
 * Created by macro on 2018/5/23.
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class ProductAttrInfo {
    @Schema(title = "Product attributes ID")
    private Long attributeId;
    @Schema(title = "Product attribute category ID")
    private Long attributeCategoryId;
}
