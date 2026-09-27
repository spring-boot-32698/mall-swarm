package com.macro.mall.service;

import com.macro.mall.model.UmsAdmin;
import com.macro.mall.model.UmsResource;

import java.util.List;

/**
 * Admin user cache operation class
 * Created by macro on 2020/3/13.
 */
public interface UmsAdminCacheService {
    /**
     * Delete admin user cache
     */
    void delAdmin(Long adminId);

    /**
     * Get cached admin user info
     */
    UmsAdmin getAdmin(Long adminId);

    /**
     * Set cached admin user info
     */
    void setAdmin(UmsAdmin admin);
}
