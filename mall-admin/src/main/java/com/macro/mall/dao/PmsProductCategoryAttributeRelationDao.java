package com.macro.mall.dao;

import com.macro.mall.model.PmsProductCategoryAttributeRelation;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Custom product category and attribute relation Dao
 * Created by macro on 2018/5/23.
 */
public interface PmsProductCategoryAttributeRelationDao {
    /**
     * Batch create
     */
    int insertList(@Param("list") List<PmsProductCategoryAttributeRelation> productCategoryAttributeRelationList);
}
