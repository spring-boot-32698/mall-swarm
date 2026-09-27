package com.macro.mall.dto;

import com.macro.mall.validator.FlagValidator;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotEmpty;

/**
 * Brand parameters passed
 * Created by macro on 2018/4/26.
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class PmsBrandParam {
    @NotEmpty
    @Schema(title = "Brand name",required = true)
    private String name;
    @Schema(title = "Brand initial letter")
    private String firstLetter;
    @Min(value = 0)
    @Schema(title = "Sort field")
    private Integer sort;
    @FlagValidator(value = {"0","1"}, message = "Manufacturer status is incorrect")
    @Schema(title = "Whether it is a manufacturer")
    private Integer factoryStatus;
    @FlagValidator(value = {"0","1"}, message = "Display status is incorrect")
    @Schema(title = "Whether to show")
    private Integer showStatus;
    @NotEmpty
    @Schema(title = "Brand logo",required = true)
    private String logo;
    @Schema(title = "Brand large image")
    private String bigPic;
    @Schema(title = "Brand story")
    private String brandStory;
}
