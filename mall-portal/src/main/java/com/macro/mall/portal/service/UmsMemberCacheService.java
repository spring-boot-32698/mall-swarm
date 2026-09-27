package com.macro.mall.portal.service;

import com.macro.mall.model.UmsMember;

/**
 * Member information cache business class
 * Created by macro on 2020/3/14.
 */
public interface UmsMemberCacheService {
    /**
     * Delete member user cache
     */
    void delMember(Long memberId);

    /**
     * Get member user cache
     */
    UmsMember getMember(Long memberId);

    /**
     * Set member user cache
     */
    void setMember(UmsMember member);

    /**
     * Set verification code
     */
    void setAuthCode(String telephone, String authCode);

    /**
     * Get verification code
     */
    String getAuthCode(String telephone);
}
