package com.macro.mall.service;

import com.macro.mall.model.SmsCouponHistory;

import java.util.List;

/**
 * Coupon claim record management Service
 * Created by macro on 2018/11/6.
 */
public interface SmsCouponHistoryService {
    /**
     * Query coupon claim records with paging
     * @param couponId Coupon id
     * @param useStatus Usage status
     * @param orderSn Use order number
     */
    List<SmsCouponHistory> list(Long couponId, Integer useStatus, String orderSn, Integer pageSize, Integer pageNum);
}
