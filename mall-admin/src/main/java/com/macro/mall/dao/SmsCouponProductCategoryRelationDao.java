package com.macro.mall.dao;

import com.macro.mall.model.SmsCouponProductCategoryRelation;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Custom coupon-product-category relation management Dao
 * Created by macro on 2018/8/28.
 */
public interface SmsCouponProductCategoryRelationDao {
    /**
     * Batch create
     */
    int insertList(@Param("list")List<SmsCouponProductCategoryRelation> productCategoryRelationList);
}
