package com.macro.mall.service;

import com.macro.mall.model.SmsHomeNewProduct;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Home new arrival management Service
 * Created by macro on 2018/11/6.
 */
public interface SmsHomeNewProductService {
    /**
     * Add home recommendation
     */
    @Transactional
    int create(List<SmsHomeNewProduct> homeNewProductList);

    /**
     * Modify recommendation sort
     */
    int updateSort(Long id, Integer sort);

    /**
     * Batch delete recommendations
     */
    int delete(List<Long> ids);

    /**
     * Update recommendation status
     */
    int updateRecommendStatus(List<Long> ids, Integer recommendStatus);

    /**
     * Paged query recommendations
     */
    List<SmsHomeNewProduct> list(String productName, Integer recommendStatus, Integer pageSize, Integer pageNum);
}
