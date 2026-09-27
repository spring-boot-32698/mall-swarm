package com.macro.mall.dto;

import com.macro.mall.validator.FlagValidator;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

import jakarta.validation.constraints.NotEmpty;

/**
 * Product attribute parameters
 * Created by macro on 2018/4/26.
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class PmsProductAttributeParam {
    @NotEmpty
    @Schema(title = "Attribute category ID")
    private Long productAttributeCategoryId;
    @NotEmpty
    @Schema(title = "Attribute name")
    private String name;
    @FlagValidator({"0","1","2"})
    @Schema(title = "Attribute selection type:0->Unique;1->Single choice;2->Multiple choice")
    private Integer selectType;
    @FlagValidator({"0","1"})
    @Schema(title = "Attribute input method:0->Manual entry;1->Select from list")
    private Integer inputType;
    @Schema(title = "Optional value list, separated by commas")
    private String inputList;

    private Integer sort;
    @FlagValidator({"0","1"})
    @Schema(title = "Category filter style:0->Normal;1->Color")
    private Integer filterType;
    @FlagValidator({"0","1","2"})
    @Schema(title = "Search type;0->No search needed;1->Keyword search;2->Range search")
    private Integer searchType;
    @FlagValidator({"0","1"})
    @Schema(title = "Whether products with the same attribute are associated;0->Not associated;1->Associate")
    private Integer relatedStatus;
    @FlagValidator({"0","1"})
    @Schema(title = "Whether manual addition is supported;0->Not supported;1->Supports")
    private Integer handAddStatus;
    @FlagValidator({"0","1"})
    @Schema(title = "Attribute type;0->Specifications;1->Parameters")
    private Integer type;
}
