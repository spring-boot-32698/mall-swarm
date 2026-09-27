package com.macro.mall.portal.service;

import com.macro.mall.model.CmsSubject;
import com.macro.mall.model.PmsProduct;
import com.macro.mall.model.PmsProductCategory;
import com.macro.mall.portal.domain.HomeContentResult;

import java.util.List;

/**
 * Home content management Service
 * Created by macro on 2019/1/28.
 */
public interface HomeService {

    /**
     * Get home page content
     */
    HomeContentResult content();

    /**
     * Home product recommendations
     */
    List<PmsProduct> recommendProductList(Integer pageSize, Integer pageNum);

    /**
     * Get product category
     * @param parentId 0:Get level-1 categories; otherwise: get the specified level-2 categories
     */
    List<PmsProductCategory> getProductCateList(Long parentId);

    /**
     * Get topics by topic category with paging
     * @param cateId Topic category id
     */
    List<CmsSubject> getSubjectList(Long cateId, Integer pageSize, Integer pageNum);

    /**
     * Get popular recommended products by page
     */
    List<PmsProduct> hotProductList(Integer pageNum, Integer pageSize);

    /**
     * Get new-arrival recommended products by page
     */
    List<PmsProduct> newProductList(Integer pageNum, Integer pageSize);
}
