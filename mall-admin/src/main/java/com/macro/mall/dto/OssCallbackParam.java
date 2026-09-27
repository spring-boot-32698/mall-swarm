package com.macro.mall.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * oss Callback parameters after successful upload
 * Created by macro on 2018/5/17.
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class OssCallbackParam {
    @Schema(title = "Request callback URL")
    private String callbackUrl;
    @Schema(title = "Parameters in request passed on callback")
    private String callbackBody;
    @Schema(title = "Format of parameters passed on callback, such as form submission")
    private String callbackBodyType;
}
