package com.macro.mall.demo.controller;

/**
 * Created by macro on 2019/10/18.
 */

import com.macro.mall.common.api.CommonResult;
import com.macro.mall.demo.dto.UmsAdminLoginParam;
import com.macro.mall.demo.service.FeignAdminService;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * Feign Example of calling mall-admin API
 */
@Tag(name = "FeignAdminController", description = "Feign Example of calling mall-admin API")
@RestController
@RequestMapping("/feign/admin")
public class FeignAdminController {
    @Autowired
    private FeignAdminService adminService;

    @Operation(summary = "Admin login")
    @PostMapping("/login")
    public CommonResult login(@RequestBody UmsAdminLoginParam loginParam) {
        return adminService.login(loginParam);
    }

    @Operation(summary = "Get product list")
    @GetMapping("/getBrandList")
    public CommonResult getBrandList(){
        return adminService.getList();
    }
}
