package com.macro.mall.service;

import com.macro.mall.dto.PmsProductAttributeParam;
import com.macro.mall.dto.ProductAttrInfo;
import com.macro.mall.model.PmsProductAttribute;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Product attributes Service
 * Created by macro on 2018/4/26.
 */
public interface PmsProductAttributeService {
    /**
     * Get product attributes by category with paging
     * @param cid Category id
     * @param type 0->Attributes;2->Parameters
     */
    List<PmsProductAttribute> getList(Long cid, Integer type, Integer pageSize, Integer pageNum);

    /**
     * Add product attribute
     */
    @Transactional
    int create(PmsProductAttributeParam pmsProductAttributeParam);

    /**
     * Modify product attribute
     */
    int update(Long id, PmsProductAttributeParam productAttributeParam);

    /**
     * Get single product attribute info
     */
    PmsProductAttribute getItem(Long id);

    @Transactional
    int delete(List<Long> ids);

    List<ProductAttrInfo> getProductAttrInfo(Long productCategoryId);
}
