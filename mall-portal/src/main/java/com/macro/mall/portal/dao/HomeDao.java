package com.macro.mall.portal.dao;

import com.macro.mall.model.CmsSubject;
import com.macro.mall.model.PmsBrand;
import com.macro.mall.model.PmsProduct;
import com.macro.mall.portal.domain.FlashPromotionProduct;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Home content management customization Dao
 * Created by macro on 2019/1/28.
 */
public interface HomeDao {

    /**
     * Get recommended brands
     */
    List<PmsBrand> getRecommendBrandList(@Param("offset") Integer offset,@Param("limit") Integer limit);

    /**
     * Get flash sale products
     */
    List<FlashPromotionProduct> getFlashProductList(@Param("flashPromotionId") Long flashPromotionId, @Param("sessionId") Long sessionId);

    /**
     * Get new arrival recommendations
     */
    List<PmsProduct> getNewProductList(@Param("offset") Integer offset,@Param("limit") Integer limit);
    /**
     * Get popular recommendations
     */
    List<PmsProduct> getHotProductList(@Param("offset") Integer offset,@Param("limit") Integer limit);

    /**
     * Get recommended topics
     */
    List<CmsSubject> getRecommendSubjectList(@Param("offset") Integer offset, @Param("limit") Integer limit);
}
