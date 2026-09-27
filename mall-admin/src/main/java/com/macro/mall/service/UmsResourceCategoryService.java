package com.macro.mall.service;

import com.macro.mall.model.UmsResourceCategory;

import java.util.List;

/**
 * Admin resource category management Service
 * Created by macro on 2020/2/5.
 */
public interface UmsResourceCategoryService {

    /**
     * Get all resource categories
     */
    List<UmsResourceCategory> listAll();

    /**
     * Create resource category
     */
    int create(UmsResourceCategory umsResourceCategory);

    /**
     * Modify resource category
     */
    int update(Long id, UmsResourceCategory umsResourceCategory);

    /**
     * Delete resource category
     */
    int delete(Long id);
}
