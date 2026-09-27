package com.macro.mall.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotEmpty;

/**
 * User login parameters
 * Created by macro on 2018/4/26.
 */
@Getter
@Setter
public class UmsAdminParam {
    @Schema(title = "Username", required = true)
    @NotEmpty
    private String username;
    @Schema(title = "Password", required = true)
    @NotEmpty
    private String password;
    @Schema(title = "User avatar")
    private String icon;
    @Schema(title = "Email")
    @Email
    private String email;
    @Schema(title = "User nickname")
    private String nickName;
    @Schema(title = "Remarks")
    private String note;
}
