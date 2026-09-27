package com.macro.mall.service;

import com.macro.mall.dto.UmsMenuNode;
import com.macro.mall.model.UmsMenu;

import java.util.List;

/**
 * Admin menu management Service
 * Created by macro on 2020/2/2.
 */
public interface UmsMenuService {
    /**
     * Create admin menu
     */
    int create(UmsMenu umsMenu);

    /**
     * Modify admin menu
     */
    int update(Long id, UmsMenu umsMenu);

    /**
     * Get menu details by ID
     */
    UmsMenu getItem(Long id);

    /**
     * Delete menu by ID
     */
    int delete(Long id);

    /**
     * Query admin menus with paging
     */
    List<UmsMenu> list(Long parentId, Integer pageSize, Integer pageNum);

    /**
     * Return all menus as a tree structure
     */
    List<UmsMenuNode> treeList();

    /**
     * Modify menu display status
     */
    int updateHidden(Long id, Integer hidden);
}
