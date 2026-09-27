package com.macro.mall.dao;

import com.macro.mall.model.UmsAdminRoleRelation;
import com.macro.mall.model.UmsResource;
import com.macro.mall.model.UmsRole;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Custom admin user and role management Dao
 * Created by macro on 2018/10/8.
 */
public interface UmsAdminRoleRelationDao {
    /**
     * Batch insert user-role relations
     */
    int insertList(@Param("list") List<UmsAdminRoleRelation> adminRoleRelationList);

    /**
     * Get for all roles
     */
    List<UmsRole> getRoleList(@Param("adminId") Long adminId);

    /**
     * Get all accessible resources of the user
     */
    List<UmsResource> getResourceList(@Param("adminId") Long adminId);

    /**
     * Get the list of user IDs related to the resource
     */
    List<Long> getAdminIdList(@Param("resourceId") Long resourceId);
}
