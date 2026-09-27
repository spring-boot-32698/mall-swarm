package com.macro.mall.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * oss Callback result of file upload
 * Created by macro on 2018/5/17.
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class OssCallbackResult {
    @Schema(title = "File name")
    private String filename;
    @Schema(title = "File size")
    private String size;
    @Schema(title = "File’s mimeType")
    private String mimeType;
    @Schema(title = "Image file width")
    private String width;
    @Schema(title = "Image file height")
    private String height;
}
