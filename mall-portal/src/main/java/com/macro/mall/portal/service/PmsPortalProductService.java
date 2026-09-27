package com.macro.mall.portal.service;

import com.macro.mall.model.PmsProduct;
import com.macro.mall.portal.domain.PmsPortalProductDetail;
import com.macro.mall.portal.domain.PmsProductCategoryNode;

import java.util.List;

/**
 * Storefront product management Service
 * Created by macro on 2020/4/6.
 */
public interface PmsPortalProductService {
    /**
     * Comprehensive product search
     */
    List<PmsProduct> search(String keyword, Long brandId, Long productCategoryId, Integer pageNum, Integer pageSize, Integer sort);

    /**
     * Get all product categories as a tree structure
     */
    List<PmsProductCategoryNode> categoryTreeList();

    /**
     * Get storefront product details
     */
    PmsPortalProductDetail detail(Long id);
}
