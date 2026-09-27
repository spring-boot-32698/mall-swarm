package com.macro.mall.search.service;

import com.macro.mall.search.domain.EsProduct;
import com.macro.mall.search.domain.EsProductRelatedInfo;
import org.springframework.data.domain.Page;

import java.util.List;

/**
 * Product search management Service
 * Created by macro on 2018/6/19.
 */
public interface EsProductService {
    /**
     * Import all products from the database into ES
     */
    int importAll();

    /**
     * Delete product by id
     */
    void delete(Long id);

    /**
     * Create product by id
     */
    EsProduct create(Long id);

    /**
     * Batch delete products
     */
    void delete(List<Long> ids);

    /**
     * Search name or subtitle by keyword
     */
    Page<EsProduct> search(String keyword, Integer pageNum, Integer pageSize);

    /**
     * Compound query on name or subtitle by keyword
     */
    Page<EsProduct> search(String keyword, Long brandId, Long productCategoryId, Integer pageNum, Integer pageSize,Integer sort);

    /**
     * Recommend related products by product id
     */
    Page<EsProduct> recommend(Long id, Integer pageNum, Integer pageSize);

    /**
     * Get brands, categories and attributes related to the search term
     */
    EsProductRelatedInfo searchRelatedInfo(String keyword);
}
