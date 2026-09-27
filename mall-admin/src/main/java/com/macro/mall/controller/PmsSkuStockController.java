package com.macro.mall.controller;

import com.macro.mall.common.api.CommonResult;
import com.macro.mall.model.PmsSkuStock;
import com.macro.mall.service.PmsSkuStockService;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * sku In stock Controller
 * Created by macro on 2018/4/27.
 */
@Controller
@Tag(name = "PmsSkuStockController", description = "sku Product stock management")
@RequestMapping("/sku")
public class PmsSkuStockController {
    @Autowired
    private PmsSkuStockService skuStockService;

    @Operation(summary = "Fuzzy search SKU stock by product number and SKU number")
    @RequestMapping(value = "/{pid}", method = RequestMethod.GET)
    @ResponseBody
    public CommonResult<List<PmsSkuStock>> getList(@PathVariable Long pid, @RequestParam(value = "keyword",required = false) String keyword) {
        List<PmsSkuStock> skuStockList = skuStockService.getList(pid, keyword);
        return CommonResult.success(skuStockList);
    }
    @Operation(summary = "Batch update stock information")
    @RequestMapping(value ="/update/{pid}",method = RequestMethod.POST)
    @ResponseBody
    public CommonResult update(@PathVariable Long pid,@RequestBody List<PmsSkuStock> skuStockList){
        int count = skuStockService.update(pid,skuStockList);
        if(count>0){
            return CommonResult.success(count);
        }else{
            return CommonResult.failed();
        }
    }
}
