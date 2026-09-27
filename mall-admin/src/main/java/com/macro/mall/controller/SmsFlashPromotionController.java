package com.macro.mall.controller;

import com.macro.mall.common.api.CommonPage;
import com.macro.mall.common.api.CommonResult;
import com.macro.mall.model.SmsFlashPromotion;
import com.macro.mall.service.SmsFlashPromotionService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * Flash sale activity management Controller
 * Created by macro on 2018/11/16.
 */
@Controller
@Tag(name = "SmsFlashPromotionController", description = "Flash sale activity management")
@RequestMapping("/flash")
public class SmsFlashPromotionController {
    @Autowired
    private SmsFlashPromotionService flashPromotionService;

    @Operation(summary = "Add activity")
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    @ResponseBody
    public CommonResult create(@RequestBody SmsFlashPromotion flashPromotion) {
        int count = flashPromotionService.create(flashPromotion);
        if (count > 0) {
            return CommonResult.success(count);
        }
        return CommonResult.failed();
    }

    @Operation(summary = "Edit activity information")
    @RequestMapping(value = "/update/{id}", method = RequestMethod.POST)
    @ResponseBody
    public Object update(@PathVariable Long id, @RequestBody SmsFlashPromotion flashPromotion) {
        int count = flashPromotionService.update(id, flashPromotion);
        if (count > 0) {
            return CommonResult.success(count);
        }
        return CommonResult.failed();
    }

    @Operation(summary = "Delete activity information")
    @RequestMapping(value = "/delete/{id}", method = RequestMethod.POST)
    @ResponseBody
    public Object delete(@PathVariable Long id) {
        int count = flashPromotionService.delete(id);
        if (count > 0) {
            return CommonResult.success(count);
        }
        return CommonResult.failed();
    }

    @Operation(summary = "Modify online/offline status")
    @RequestMapping(value = "/update/status/{id}", method = RequestMethod.POST)
    @ResponseBody
    public Object update(@PathVariable Long id, Integer status) {
        int count = flashPromotionService.updateStatus(id, status);
        if (count > 0) {
            return CommonResult.success(count);
        }
        return CommonResult.failed();
    }

    @Operation(summary = "Get activity details")
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    @ResponseBody
    public Object getItem(@PathVariable Long id) {
        SmsFlashPromotion flashPromotion = flashPromotionService.getItem(id);
        return CommonResult.success(flashPromotion);
    }

    @Operation(summary = "Query by activity name with paging")
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    @ResponseBody
    public Object getItem(@RequestParam(value = "keyword", required = false) String keyword,
                          @RequestParam(value = "pageSize", defaultValue = "5") Integer pageSize,
                          @RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum) {
        List<SmsFlashPromotion> flashPromotionList = flashPromotionService.list(keyword, pageSize, pageNum);
        return CommonResult.success(CommonPage.restPage(flashPromotionList));
    }
}
