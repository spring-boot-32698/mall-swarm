package com.macro.mall.service;

import com.macro.mall.dto.*;
import com.macro.mall.model.OmsOrder;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Order management Service
 * Created by macro on 2018/10/11.
 */
public interface OmsOrderService {
    /**
     * Order query
     */
    List<OmsOrder> list(OmsOrderQueryParam queryParam, Integer pageSize, Integer pageNum);

    /**
     * Batch shipping
     */
    @Transactional
    int delivery(List<OmsOrderDeliveryParam> deliveryParamList);

    /**
     * Batch close orders
     */
    @Transactional
    int close(List<Long> ids, String note);

    /**
     * Batch delete orders
     */
    int delete(List<Long> ids);

    /**
     * Get specified order details
     */
    OmsOrderDetail detail(Long id);

    /**
     * Modify order recipient info
     */
    @Transactional
    int updateReceiverInfo(OmsReceiverInfoParam receiverInfoParam);

    /**
     * Modify order fee information
     */
    @Transactional
    int updateMoneyInfo(OmsMoneyInfoParam moneyInfoParam);

    /**
     * Modify order remarks
     */
    @Transactional
    int updateNote(Long id, String note, Integer status);
}
