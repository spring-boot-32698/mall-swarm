package com.macro.mall.service;

import com.macro.mall.dto.PmsProductParam;
import com.macro.mall.dto.PmsProductQueryParam;
import com.macro.mall.dto.PmsProductResult;
import com.macro.mall.model.PmsProduct;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Product management Service
 * Created by macro on 2018/4/26.
 */
public interface PmsProductService {
    /**
     * Create product
     */
    @Transactional(isolation = Isolation.DEFAULT,propagation = Propagation.REQUIRED)
    int create(PmsProductParam productParam);

    /**
     * Get update info by product number
     */
    PmsProductResult getUpdateInfo(Long id);

    /**
     * Update product
     */
    @Transactional
    int update(Long id, PmsProductParam productParam);

    /**
     * Query products with paging
     */
    List<PmsProduct> list(PmsProductQueryParam productQueryParam, Integer pageSize, Integer pageNum);

    /**
     * Batch modify review status
     * @param ids Product id
     * @param verifyStatus Review status
     * @param detail Review details
     */
    @Transactional
    int updateVerifyStatus(List<Long> ids, Integer verifyStatus, String detail);

    /**
     * Batch modify product shelf status
     */
    int updatePublishStatus(List<Long> ids, Integer publishStatus);

    /**
     * Batch modify product recommendation status
     */
    int updateRecommendStatus(List<Long> ids, Integer recommendStatus);

    /**
     * Batch modify new arrival status
     */
    int updateNewStatus(List<Long> ids, Integer newStatus);

    /**
     * Batch delete products
     */
    int updateDeleteStatus(List<Long> ids, Integer deleteStatus);

    /**
     * Fuzzy query by product name or item number
     */
    List<PmsProduct> list(String keyword);
}
