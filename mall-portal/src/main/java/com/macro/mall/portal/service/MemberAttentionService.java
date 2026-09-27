package com.macro.mall.portal.service;

import com.macro.mall.portal.domain.MemberBrandAttention;
import org.springframework.data.domain.Page;

import java.util.List;

/**
 * Member follows Service
 * Created by macro on 2018/8/2.
 */
public interface MemberAttentionService {
    /**
     * Add follow
     */
    int add(MemberBrandAttention memberBrandAttention);

    /**
     * Unfollow
     */
    int delete(Long brandId);

    /**
     * Get user follow list
     */
    Page<MemberBrandAttention> list(Integer pageNum, Integer pageSize);

    /**
     * Get user follow details
     */
    MemberBrandAttention detail(Long brandId);

    /**
     * Clear follow list
     */
    void clear();
}
