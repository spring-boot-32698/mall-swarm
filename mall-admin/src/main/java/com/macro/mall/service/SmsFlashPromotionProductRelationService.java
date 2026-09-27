package com.macro.mall.service;

import com.macro.mall.dto.SmsFlashPromotionProduct;
import com.macro.mall.model.SmsFlashPromotionProductRelation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Flash sale product association management Service
 * Created by macro on 2018/11/16.
 */
public interface SmsFlashPromotionProductRelationService {
    /**
     * Batch add associations
     */
    @Transactional
    int create(List<SmsFlashPromotionProductRelation> relationList);

    /**
     * Modify associated information
     */
    int update(Long id, SmsFlashPromotionProductRelation relation);

    /**
     * Delete association
     */
    int delete(Long id);

    /**
     * Get association details
     */
    SmsFlashPromotionProductRelation getItem(Long id);

    /**
     * Query related products and promotion info with paging
     *
     * @param flashPromotionId        Flash sale id
     * @param flashPromotionSessionId Flash sale session id
     */
    List<SmsFlashPromotionProduct> list(Long flashPromotionId, Long flashPromotionSessionId, Integer pageSize, Integer pageNum);

    /**
     * Get the product relation count by activity and session id
     * @param flashPromotionId
     * @param flashPromotionSessionId
     * @return
     */
    long getCount(Long flashPromotionId,Long flashPromotionSessionId);
}
