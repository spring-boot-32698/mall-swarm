package com.macro.mall.service;

import com.macro.mall.model.PmsSkuStock;

import java.util.List;

/**
 * sku Product stock management Service
 * Created by macro on 2018/4/27.
 */
public interface PmsSkuStockService {
    /**
     * Fuzzy search by product id and skuCode
     */
    List<PmsSkuStock> getList(Long pid, String keyword);

    /**
     * Batch update product stock information
     */
    int update(Long pid, List<PmsSkuStock> skuStockList);
}
