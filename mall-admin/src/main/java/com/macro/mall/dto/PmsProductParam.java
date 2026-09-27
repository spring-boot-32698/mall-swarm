package com.macro.mall.dto;

import com.macro.mall.model.*;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.List;

/**
 * Parameters used when creating and modifying products
 * Created by macro on 2018/4/26.
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class PmsProductParam extends PmsProduct{
    @Schema(title = "Product tiered price settings")
    private List<PmsProductLadder> productLadderList;
    @Schema(title = "Product full reduction price settings")
    private List<PmsProductFullReduction> productFullReductionList;
    @Schema(title = "Product member price settings")
    private List<PmsMemberPrice> memberPriceList;
    @Schema(title = "Product SKU stock information")
    private List<PmsSkuStock> skuStockList;
    @Schema(title = "Product parameters and custom specification attributes")
    private List<PmsProductAttributeValue> productAttributeValueList;
    @Schema(title = "Relationship between topics and products")
    private List<CmsSubjectProductRelation> subjectProductRelationList;
    @Schema(title = "Relationship between preferred zones and products")
    private List<CmsPrefrenceAreaProductRelation> prefrenceAreaProductRelationList;
}
