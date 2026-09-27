package com.macro.mall.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * File upload result
 * Created by macro on 2019/12/25.
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class MinioUploadDto {
    @Schema(title = "File access URL")
    private String url;
    @Schema(title = "File name")
    private String name;
}
