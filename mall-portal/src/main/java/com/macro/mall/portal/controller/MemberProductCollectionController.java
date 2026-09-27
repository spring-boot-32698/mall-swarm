package com.macro.mall.portal.controller;

import com.macro.mall.common.api.CommonPage;
import com.macro.mall.common.api.CommonResult;
import com.macro.mall.portal.domain.MemberProductCollection;
import com.macro.mall.portal.service.MemberCollectionService;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * Member favorites management Controller
 * Created by macro on 2018/8/2.
 */
@Controller
@Tag(name = "MemberCollectionController", description = "Member favorites management")
@RequestMapping("/member/productCollection")
public class MemberProductCollectionController {
    @Autowired
    private MemberCollectionService memberCollectionService;

    @Operation(summary = "Add product favorite")
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    @ResponseBody
    public CommonResult add(@RequestBody MemberProductCollection productCollection) {
        int count = memberCollectionService.add(productCollection);
        if (count > 0) {
            return CommonResult.success(count);
        } else {
            return CommonResult.failed();
        }
    }

    @Operation(summary = "Delete favorited product")
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    @ResponseBody
    public CommonResult delete(Long productId) {
        int count = memberCollectionService.delete(productId);
        if (count > 0) {
            return CommonResult.success(count);
        } else {
            return CommonResult.failed();
        }
    }

    @Operation(summary = "Show favorites list")
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    @ResponseBody
    public CommonResult<CommonPage<MemberProductCollection>> list(@RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum,
                                                                  @RequestParam(value = "pageSize", defaultValue = "5") Integer pageSize) {
        Page<MemberProductCollection> page = memberCollectionService.list(pageNum,pageSize);
        return CommonResult.success(CommonPage.restPage(page));
    }

    @Operation(summary = "Show favorited product details")
    @RequestMapping(value = "/detail", method = RequestMethod.GET)
    @ResponseBody
    public CommonResult<MemberProductCollection> detail(@RequestParam Long productId) {
        MemberProductCollection memberProductCollection = memberCollectionService.detail(productId);
        return CommonResult.success(memberProductCollection);
    }

    @Operation(summary = "Clear favorites list")
    @RequestMapping(value = "/clear", method = RequestMethod.POST)
    @ResponseBody
    public CommonResult clear() {
        memberCollectionService.clear();
        return CommonResult.success(null);
    }
}
