package com.macro.mall.demo.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;

/**
 * User login parameters
 * Created by macro on 2018/4/26.
 */
@Getter
@Setter
public class UmsAdminLoginParam {
    @Schema(title = "Username", required = true)
    private String username;
    @Schema(title = "Password", required = true)
    private String password;
}
