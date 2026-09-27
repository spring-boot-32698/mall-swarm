package com.macro.mall.service;

import com.macro.mall.model.SmsFlashPromotion;

import java.util.List;

/**
 * Flash sale activity management Service
 * Created by macro on 2018/11/16.
 */
public interface SmsFlashPromotionService {
    /**
     * Add activity
     */
    int create(SmsFlashPromotion flashPromotion);

    /**
     * Modify specified activity
     */
    int update(Long id, SmsFlashPromotion flashPromotion);

    /**
     * Delete a single activity
     */
    int delete(Long id);

    /**
     * Modify online/offline status
     */
    int updateStatus(Long id, Integer status);

    /**
     * Get detailed information
     */
    SmsFlashPromotion getItem(Long id);

    /**
     * Query activities with paging
     */
    List<SmsFlashPromotion> list(String keyword, Integer pageSize, Integer pageNum);
}
