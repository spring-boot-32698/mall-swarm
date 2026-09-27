package com.macro.mall.service;

import com.macro.mall.dto.SmsFlashPromotionSessionDetail;
import com.macro.mall.model.SmsFlashPromotionSession;

import java.util.List;

/**
 * Flash sale session management Service
 * Created by macro on 2018/11/16.
 */
public interface SmsFlashPromotionSessionService {
    /**
     * Add session
     */
    int create(SmsFlashPromotionSession promotionSession);

    /**
     * Modify session
     */
    int update(Long id, SmsFlashPromotionSession promotionSession);

    /**
     * Modify session enabled status
     */
    int updateStatus(Long id, Integer status);

    /**
     * Delete session
     */
    int delete(Long id);

    /**
     * Get details
     */
    SmsFlashPromotionSession getItem(Long id);

    /**
     * Get session list by enabled status
     */
    List<SmsFlashPromotionSession> list();

    /**
     * Get all available sessions and their counts
     */
    List<SmsFlashPromotionSessionDetail> selectList(Long flashPromotionId);
}
