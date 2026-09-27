package com.macro.mall.service;

import cn.dev33.satoken.stp.SaTokenInfo;
import com.macro.mall.dto.UmsAdminParam;
import com.macro.mall.dto.UpdateAdminPasswordParam;
import com.macro.mall.model.*;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Admin user Service
 * Created by macro on 2018/4/26.
 */
public interface UmsAdminService {
    /**
     * Get admin by username
     */
    UmsAdmin getAdminByUsername(String username);

    /**
     * Registration feature
     */
    UmsAdmin register(UmsAdminParam umsAdminParam);

    /**
     * Login feature
     * @param username Username
     * @param password Password
     */
    SaTokenInfo login(String username, String password);

    /**
     * Get user by user id
     */
    UmsAdmin getItem(Long id);

    /**
     * Query users by username or nickname with paging
     */
    List<UmsAdmin> list(String keyword, Integer pageSize, Integer pageNum);

    /**
     * Modify specified user information
     */
    int update(Long id, UmsAdmin admin);

    /**
     * Delete specified user
     */
    int delete(Long id);

    /**
     * Modify user-role relations
     */
    @Transactional
    int updateRole(Long adminId, List<Long> roleIds);

    /**
     * Get user’s roles
     */
    List<UmsRole> getRoleList(Long adminId);

    /**
     * Get accessible resources of the specified user
     */
    List<UmsResource> getResourceList(Long adminId);

    /**
     * Change password
     */
    int updatePassword(UpdateAdminPasswordParam updatePasswordParam);

    /**
     * Get the currently logged-in admin user
     */
    UmsAdmin getCurrentAdmin();

    /**
     * Logout operation
     */
    void logout();
}
