package com.macro.mall.dao;

import com.macro.mall.model.PmsProductAttributeValue;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Product parameters, custom specification attributes of the product Dao
 * Created by macro on 2018/4/26.
 */
public interface PmsProductAttributeValueDao {
    /**
     * Batch create
     */
    int insertList(@Param("list")List<PmsProductAttributeValue> productAttributeValueList);
}
