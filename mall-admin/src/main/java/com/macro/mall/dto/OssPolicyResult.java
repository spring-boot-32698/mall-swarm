package com.macro.mall.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * Get the OSS file upload authorization result
 * Created by macro on 2018/5/17.
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class OssPolicyResult {
    @Schema(title = "User identifier used in access identity authentication")
    private String accessKeyId;
    @Schema(title = "Policy for user form upload,Base64-encoded string")
    private String policy;
    @Schema(title = "String after signing the policy")
    private String signature;
    @Schema(title = "Upload folder path prefix")
    private String dir;
    @Schema(title = "oss Access domain name for external services")
    private String host;
    @Schema(title = "Callback settings after successful upload")
    private String callback;
}
