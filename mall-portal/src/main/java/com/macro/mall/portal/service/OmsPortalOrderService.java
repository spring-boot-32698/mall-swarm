package com.macro.mall.portal.service;

import com.macro.mall.common.api.CommonPage;
import com.macro.mall.portal.domain.ConfirmOrderResult;
import com.macro.mall.portal.domain.OmsOrderDetail;
import com.macro.mall.portal.domain.OrderParam;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

/**
 * Storefront order management Service
 * Created by macro on 2018/8/30.
 */
public interface OmsPortalOrderService {
    /**
     * Generate confirmation order info from the user’s cart info
     */
    ConfirmOrderResult generateConfirmOrder(List<Long> cartIds);

    /**
     * Generate order from submitted info
     */
    @Transactional
    Map<String, Object> generateOrder(OrderParam orderParam);

    /**
     * Callback after successful payment
     */
    @Transactional
    Integer paySuccess(Long orderId, Integer payType);

    /**
     * Auto-cancel timed-out orders
     */
    @Transactional
    Integer cancelTimeOutOrder();

    /**
     * Cancel a single timed-out order
     */
    @Transactional
    void cancelOrder(Long orderId);

    /**
     * Send delayed message to cancel order
     */
    void sendDelayMessageCancelOrder(Long orderId);

    /**
     * Confirm receipt
     */
    void confirmReceiveOrder(Long orderId);

    /**
     * Get user orders with paging
     */
    CommonPage<OmsOrderDetail> list(Integer status, Integer pageNum, Integer pageSize);

    /**
     * Get order details by order ID
     */
    OmsOrderDetail detail(Long orderId);

    /**
     * User deletes order by order ID
     */
    void deleteOrder(Long orderId);

    /**
     * Payment success logic implemented based on orderSn
     */
    @Transactional
    void paySuccessByOrderSn(String orderSn, Integer payType);
}
