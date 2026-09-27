package com.macro.mall.controller;

import com.macro.mall.common.api.CommonPage;
import com.macro.mall.common.api.CommonResult;
import com.macro.mall.model.OmsOrderReturnReason;
import com.macro.mall.service.OmsOrderReturnReasonService;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * Return reason management Controller
 * Created by macro on 2018/10/17.
 */
@Controller
@Tag(name = "OmsOrderReturnReasonController", description = "Return reason management")
@RequestMapping("/returnReason")
public class OmsOrderReturnReasonController {
    @Autowired
    private OmsOrderReturnReasonService orderReturnReasonService;

    @Operation(summary = "Add return reason")
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    @ResponseBody
    public CommonResult create(@RequestBody OmsOrderReturnReason returnReason) {
        int count = orderReturnReasonService.create(returnReason);
        if (count > 0) {
            return CommonResult.success(count);
        }
        return CommonResult.failed();
    }

    @Operation(summary = "Modify return reason")
    @RequestMapping(value = "/update/{id}", method = RequestMethod.POST)
    @ResponseBody
    public CommonResult update(@PathVariable Long id, @RequestBody OmsOrderReturnReason returnReason) {
        int count = orderReturnReasonService.update(id, returnReason);
        if (count > 0) {
            return CommonResult.success(count);
        }
        return CommonResult.failed();
    }

    @Operation(summary = "Batch delete return reasons")
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    @ResponseBody
    public CommonResult delete(@RequestParam("ids") List<Long> ids) {
        int count = orderReturnReasonService.delete(ids);
        if (count > 0) {
            return CommonResult.success(count);
        }
        return CommonResult.failed();
    }

    @Operation(summary = "Query all return reasons with paging")
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    @ResponseBody
    public CommonResult<CommonPage<OmsOrderReturnReason>> list(@RequestParam(value = "pageSize", defaultValue = "5") Integer pageSize,
                                                               @RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum) {
        List<OmsOrderReturnReason> reasonList = orderReturnReasonService.list(pageSize, pageNum);
        return CommonResult.success(CommonPage.restPage(reasonList));
    }

    @Operation(summary = "Get details of a single return reason")
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    @ResponseBody
    public CommonResult<OmsOrderReturnReason> getItem(@PathVariable Long id) {
        OmsOrderReturnReason reason = orderReturnReasonService.getItem(id);
        return CommonResult.success(reason);
    }

    @Operation(summary = "Modify return reason enabled status")
    @RequestMapping(value = "/update/status", method = RequestMethod.POST)
    @ResponseBody
    public CommonResult updateStatus(@RequestParam(value = "status") Integer status,
                                     @RequestParam("ids") List<Long> ids) {
        int count = orderReturnReasonService.updateStatus(ids, status);
        if (count > 0) {
            return CommonResult.success(count);
        }
        return CommonResult.failed();
    }
}
