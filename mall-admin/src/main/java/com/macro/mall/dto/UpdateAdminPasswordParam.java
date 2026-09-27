package com.macro.mall.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;

import jakarta.validation.constraints.NotEmpty;

/**
 * Modify username/password parameters
 * Created by macro on 2019/10/9.
 */
@Getter
@Setter
public class UpdateAdminPasswordParam {
    @NotEmpty
    @Schema(title = "Username", required = true)
    private String username;
    @NotEmpty
    @Schema(title = "Old password", required = true)
    private String oldPassword;
    @NotEmpty
    @Schema(title = "New password", required = true)
    private String newPassword;
}
