package com.macro.mall.service;

import com.macro.mall.model.SmsHomeBrand;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Home brand management Service
 * Created by macro on 2018/11/6.
 */
public interface SmsHomeBrandService {
    /**
     * Add home brand recommendation
     */
    @Transactional
    int create(List<SmsHomeBrand> homeBrandList);

    /**
     * Modify brand recommendation sort
     */
    int updateSort(Long id, Integer sort);

    /**
     * Batch delete brand recommendations
     */
    int delete(List<Long> ids);

    /**
     * Update recommendation status
     */
    int updateRecommendStatus(List<Long> ids, Integer recommendStatus);

    /**
     * Query brand recommendations with paging
     */
    List<SmsHomeBrand> list(String brandName, Integer recommendStatus, Integer pageSize, Integer pageNum);
}
