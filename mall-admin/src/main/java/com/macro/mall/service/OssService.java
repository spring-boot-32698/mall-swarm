package com.macro.mall.service;

import com.macro.mall.dto.OssCallbackResult;
import com.macro.mall.dto.OssPolicyResult;

import jakarta.servlet.http.HttpServletRequest;

/**
 * oss Upload management Service
 * Created by macro on 2018/5/17.
 */
public interface OssService {
    /**
     * oss Upload policy generation
     */
    OssPolicyResult policy();
    /**
     * oss Upload success callback
     */
    OssCallbackResult callback(HttpServletRequest request);
}
