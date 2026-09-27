package com.macro.mall.portal.service;

import cn.dev33.satoken.stp.SaTokenInfo;
import com.macro.mall.model.UmsMember;
import org.springframework.transaction.annotation.Transactional;

/**
 * Member management Service
 * Created by macro on 2018/8/3.
 */
public interface UmsMemberService {
    /**
     * Get member by username
     */
    UmsMember getByUsername(String username);

    /**
     * Get member by member number
     */
    UmsMember getById(Long id);

    /**
     * User registration
     */
    @Transactional
    void register(String username, String password, String telephone, String authCode);

    /**
     * Generate verification code
     */
    String generateAuthCode(String telephone);

    /**
     * Change password
     */
    @Transactional
    void updatePassword(String telephone, String password, String authCode);

    /**
     * Get the currently logged-in member
     */
    UmsMember getCurrentMember();

    /**
     * Modify member points by member id
     */
    void updateIntegration(Long id,Integer integration);

    /**
     * Obtained after login token
     */
    SaTokenInfo login(String username, String password);

    /**
     * Logout feature
     */
    void logout();
}
