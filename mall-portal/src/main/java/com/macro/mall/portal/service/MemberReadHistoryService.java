package com.macro.mall.portal.service;

import com.macro.mall.portal.domain.MemberReadHistory;
import org.springframework.data.domain.Page;

import java.util.List;

/**
 * Member browsing history management Service
 * Created by macro on 2018/8/3.
 */
public interface MemberReadHistoryService {
    /**
     * Generate browsing history
     */
    int create(MemberReadHistory memberReadHistory);

    /**
     * Batch delete browsing history
     */
    int delete(List<String> ids);

    /**
     * Get user browsing history with paging
     */
    Page<MemberReadHistory> list(Integer pageNum, Integer pageSize);

    /**
     * Clear browsing history
     */
    void clear();
}
