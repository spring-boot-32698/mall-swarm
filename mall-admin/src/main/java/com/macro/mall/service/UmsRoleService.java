package com.macro.mall.service;

import com.macro.mall.model.UmsMenu;
import com.macro.mall.model.UmsResource;
import com.macro.mall.model.UmsRole;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Admin role management Service
 * Created by macro on 2018/9/30.
 */
public interface UmsRoleService {
    /**
     * Add role
     */
    int create(UmsRole role);

    /**
     * Modify role information
     */
    int update(Long id, UmsRole role);

    /**
     * Batch delete roles
     */
    int delete(List<Long> ids);

    /**
     * Get all role list
     */
    List<UmsRole> list();

    /**
     * Get role list with paging
     */
    List<UmsRole> list(String keyword, Integer pageSize, Integer pageNum);

    /**
     * Get corresponding menus by admin ID
     */
    List<UmsMenu> getMenuList(Long adminId);

    /**
     * Get role-related menus
     */
    List<UmsMenu> listMenu(Long roleId);

    /**
     * Get role-related resources
     */
    List<UmsResource> listResource(Long roleId);

    /**
     * Assign menus to role
     */
    @Transactional
    int allocMenu(Long roleId, List<Long> menuIds);

    /**
     * Assign resources to role
     */
    @Transactional
    int allocResource(Long roleId, List<Long> resourceIds);
}
