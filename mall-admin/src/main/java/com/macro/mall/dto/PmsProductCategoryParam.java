package com.macro.mall.dto;

import com.macro.mall.validator.FlagValidator;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotEmpty;
import java.util.List;

/**
 * Add parameters for updating product category
 * Created by macro on 2018/4/26.
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class PmsProductCategoryParam {
    @Schema(title = "Parent category ID")
    private Long parentId;
    @NotEmpty
    @Schema(title = "Product category name",required = true)
    private String name;
    @Schema(title = "Category unit")
    private String productUnit;
    @FlagValidator(value = {"0","1"},message = "Status can only be 0 or 1")
    @Schema(title = "Whether to show in the navigation bar")
    private Integer navStatus;
    @FlagValidator(value = {"0","1"},message = "Status can only be 0 or 1")
    @Schema(title = "Whether to show")
    private Integer showStatus;
    @Min(value = 0)
    @Schema(title = "Sort")
    private Integer sort;
    @Schema(title = "Icon")
    private String icon;
    @Schema(title = "Keyword")
    private String keywords;
    @Schema(title = "Description")
    private String description;
    @Schema(title = "Set of product-related filter attributes")
    private List<Long> productAttributeIdList;
}
