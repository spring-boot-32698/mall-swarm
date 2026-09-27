package com.macro.mall.dao;

import com.macro.mall.dto.ProductAttrInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Custom product attributes Dao
 * Created by macro on 2018/5/23.
 */
public interface PmsProductAttributeDao {
    /**
     * Get product attribute information
     */
    List<ProductAttrInfo> getProductAttrInfo(@Param("id") Long productCategoryId);
}
