package com.macro.mall.dao;

import com.macro.mall.dto.SmsFlashPromotionProduct;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Custom flash sale product relation management Dao
 * Created by macro on 2018/11/16.
 */
public interface SmsFlashPromotionProductRelationDao {
    /**
     * Get flash sale and related product info
     */
    List<SmsFlashPromotionProduct> getList(@Param("flashPromotionId") Long flashPromotionId, @Param("flashPromotionSessionId") Long flashPromotionSessionId);
}
