package com.macro.mall.portal.controller;

import com.macro.mall.common.api.CommonResult;
import com.macro.mall.model.UmsMemberReceiveAddress;
import com.macro.mall.portal.service.UmsMemberReceiveAddressService;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * Member shipping address management Controller
 * Created by macro on 2018/8/28.
 */
@Controller
@Tag(name = "UmsMemberReceiveAddressController", description = "Member shipping address management")
@RequestMapping("/member/address")
public class UmsMemberReceiveAddressController {
    @Autowired
    private UmsMemberReceiveAddressService memberReceiveAddressService;

    @Operation(summary = "Add shipping address")
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    @ResponseBody
    public CommonResult add(@RequestBody UmsMemberReceiveAddress address) {
        int count = memberReceiveAddressService.add(address);
        if (count > 0) {
            return CommonResult.success(count);
        }
        return CommonResult.failed();
    }

    @Operation(summary = "Delete shipping address")
    @RequestMapping(value = "/delete/{id}", method = RequestMethod.POST)
    @ResponseBody
    public CommonResult delete(@PathVariable Long id) {
        int count = memberReceiveAddressService.delete(id);
        if (count > 0) {
            return CommonResult.success(count);
        }
        return CommonResult.failed();
    }

    @Operation(summary = "Modify shipping address")
    @RequestMapping(value = "/update/{id}", method = RequestMethod.POST)
    @ResponseBody
    public CommonResult update(@PathVariable Long id, @RequestBody UmsMemberReceiveAddress address) {
        int count = memberReceiveAddressService.update(id, address);
        if (count > 0) {
            return CommonResult.success(count);
        }
        return CommonResult.failed();
    }

    @Operation(summary = "Show all shipping addresses")
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    @ResponseBody
    public CommonResult<List<UmsMemberReceiveAddress>> list() {
        List<UmsMemberReceiveAddress> addressList = memberReceiveAddressService.list();
        return CommonResult.success(addressList);
    }

    @Operation(summary = "Get shipping address details")
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    @ResponseBody
    public CommonResult<UmsMemberReceiveAddress> getItem(@PathVariable Long id) {
        UmsMemberReceiveAddress address = memberReceiveAddressService.getItem(id);
        return CommonResult.success(address);
    }
}
