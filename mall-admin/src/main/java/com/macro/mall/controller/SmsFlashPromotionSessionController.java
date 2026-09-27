package com.macro.mall.controller;

import com.macro.mall.common.api.CommonResult;
import com.macro.mall.dto.SmsFlashPromotionSessionDetail;
import com.macro.mall.model.SmsFlashPromotionSession;
import com.macro.mall.service.SmsFlashPromotionSessionService;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * Flash sale session management Controller
 * Created by macro on 2018/11/16.
 */
@Controller
@Tag(name = "SmsFlashPromotionSessionController", description = "Flash sale session management")
@RequestMapping("/flashSession")
public class SmsFlashPromotionSessionController {
    @Autowired
    private SmsFlashPromotionSessionService flashPromotionSessionService;

    @Operation(summary = "Add session")
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    @ResponseBody
    public CommonResult create(@RequestBody SmsFlashPromotionSession promotionSession) {
        int count = flashPromotionSessionService.create(promotionSession);
        if (count > 0) {
            return CommonResult.success(count);
        }
        return CommonResult.failed();
    }

    @Operation(summary = "Modify session")
    @RequestMapping(value = "/update/{id}", method = RequestMethod.POST)
    @ResponseBody
    public CommonResult update(@PathVariable Long id, @RequestBody SmsFlashPromotionSession promotionSession) {
        int count = flashPromotionSessionService.update(id, promotionSession);
        if (count > 0) {
            return CommonResult.success(count);
        }
        return CommonResult.failed();
    }

    @Operation(summary = "Modify enabled status")
    @RequestMapping(value = "/update/status/{id}", method = RequestMethod.POST)
    @ResponseBody
    public CommonResult updateStatus(@PathVariable Long id, Integer status) {
        int count = flashPromotionSessionService.updateStatus(id, status);
        if (count > 0) {
            return CommonResult.success(count);
        }
        return CommonResult.failed();
    }

    @Operation(summary = "Delete session")
    @RequestMapping(value = "/delete/{id}", method = RequestMethod.POST)
    @ResponseBody
    public CommonResult delete(@PathVariable Long id) {
        int count = flashPromotionSessionService.delete(id);
        if (count > 0) {
            return CommonResult.success(count);
        }
        return CommonResult.failed();
    }

    @Operation(summary = "Get session details")
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    @ResponseBody
    public CommonResult<SmsFlashPromotionSession> getItem(@PathVariable Long id) {
        SmsFlashPromotionSession promotionSession = flashPromotionSessionService.getItem(id);
        return CommonResult.success(promotionSession);
    }

    @Operation(summary = "Get all sessions")
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    @ResponseBody
    public CommonResult<List<SmsFlashPromotionSession>> list() {
        List<SmsFlashPromotionSession> promotionSessionList = flashPromotionSessionService.list();
        return CommonResult.success(promotionSessionList);
    }

    @Operation(summary = "Get all available sessions and their counts")
    @RequestMapping(value = "/selectList", method = RequestMethod.GET)
    @ResponseBody
    public CommonResult<List<SmsFlashPromotionSessionDetail>> selectList(Long flashPromotionId) {
        List<SmsFlashPromotionSessionDetail> promotionSessionList = flashPromotionSessionService.selectList(flashPromotionId);
        return CommonResult.success(promotionSessionList);
    }
}