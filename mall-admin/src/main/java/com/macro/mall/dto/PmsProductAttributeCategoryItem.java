package com.macro.mall.dto;

import com.macro.mall.model.PmsProductAttribute;
import com.macro.mall.model.PmsProductAttributeCategory;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

/**
 * Including attributes under the category dto
 * Created by macro on 2018/5/24.
 */
public class PmsProductAttributeCategoryItem extends PmsProductAttributeCategory {
    @Getter
    @Setter
    @Schema(title = "Product attribute list")
    private List<PmsProductAttribute> productAttributeList;
}
