package com.macro.mall.common.constant;

/**
 * Permission related constant definitions
 * Created by macro on 2020/6/19.
 */
public interface AuthConstant {

    /**
     * JWT Store permission prefix
     */
    String AUTHORITY_PREFIX = "ROLE_";

    /**
     * JWT Store permission attributes
     */
    String AUTHORITY_CLAIM_NAME = "authorities";

    /**
     * Admin management client_id
     */
    String ADMIN_CLIENT_ID = "admin-app";

    /**
     * Storefront mall client_id
     */
    String PORTAL_CLIENT_ID = "portal-app";

    /**
     * Admin management API path matching
     */
    String ADMIN_URL_PATTERN = "/mall-admin/**";

    /**
     * Redis Cache permission rules (path->resource)
     */
    String PATH_RESOURCE_MAP = "auth:pathResourceMap";

    /**
     * Authentication info HTTP header
     */
    String JWT_TOKEN_HEADER = "Authorization";

    /**
     * JWT Token prefix
     */
    String JWT_TOKEN_PREFIX = "Bearer ";

    /**
     * User information HTTP header
     */
    String USER_TOKEN_HEADER = "user";

    /**
     * sa-token session Member information stored in
     */
    String STP_MEMBER_INFO = "memberInfo";

    /**
     * sa-token session Admin user information stored in
     */
    String STP_ADMIN_INFO = "adminInfo";

}
