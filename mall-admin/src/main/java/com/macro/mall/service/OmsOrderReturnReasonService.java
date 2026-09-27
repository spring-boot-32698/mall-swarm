package com.macro.mall.service;

import com.macro.mall.model.OmsOrderReturnReason;

import java.util.List;

/**
 * Order reason management Service
 * Created by macro on 2018/10/17.
 */
public interface OmsOrderReturnReasonService {
    /**
     * Add order reason
     */
    int create(OmsOrderReturnReason returnReason);

    /**
     * Modify return reason
     */
    int update(Long id, OmsOrderReturnReason returnReason);

    /**
     * Batch delete return reasons
     */
    int delete(List<Long> ids);

    /**
     * Get return reasons with paging
     */
    List<OmsOrderReturnReason> list(Integer pageSize, Integer pageNum);

    /**
     * Batch modify return reason status
     */
    int updateStatus(List<Long> ids, Integer status);

    /**
     * Get details of a single return reason
     */
    OmsOrderReturnReason getItem(Long id);
}
