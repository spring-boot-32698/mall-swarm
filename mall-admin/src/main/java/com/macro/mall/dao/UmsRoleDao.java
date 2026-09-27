package com.macro.mall.dao;

import com.macro.mall.model.UmsMenu;
import com.macro.mall.model.UmsResource;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Custom admin role management Dao
 * Created by macro on 2020/2/2.
 */
public interface UmsRoleDao {
    /**
     * Get menus by admin user ID
     */
    List<UmsMenu> getMenuList(@Param("adminId") Long adminId);
    /**
     * Get menus by role ID
     */
    List<UmsMenu> getMenuListByRoleId(@Param("roleId") Long roleId);
    /**
     * Get resources by role ID
     */
    List<UmsResource> getResourceListByRoleId(@Param("roleId") Long roleId);
}
