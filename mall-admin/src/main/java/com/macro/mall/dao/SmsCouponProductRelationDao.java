package com.macro.mall.dao;

import com.macro.mall.model.SmsCouponProductRelation;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Custom coupon-product relation Dao
 * Created by macro on 2018/8/28.
 */
public interface SmsCouponProductRelationDao {
    /**
     * Batch create
     */
    int insertList(@Param("list")List<SmsCouponProductRelation> productRelationList);
}
