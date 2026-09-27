package com.macro.mall.service;

import com.macro.mall.model.UmsResource;

import java.util.List;
import java.util.Map;

/**
 * Admin resource management Service
 * Created by macro on 2020/2/2.
 */
public interface UmsResourceService {
    /**
     * Add resource
     */
    int create(UmsResource umsResource);

    /**
     * Modify resource
     */
    int update(Long id, UmsResource umsResource);

    /**
     * Get resource details
     */
    UmsResource getItem(Long id);

    /**
     * Delete resource
     */
    int delete(Long id);

    /**
     * Query resources with paging
     */
    List<UmsResource> list(Long categoryId, String nameKeyword, String urlKeyword, Integer pageSize, Integer pageNum);

    /**
     * Query all resources
     */
    List<UmsResource> listAll();

    /**
     * Initialize path and resource access rules
     */
    Map<String,String> initPathResourceMap();
}
