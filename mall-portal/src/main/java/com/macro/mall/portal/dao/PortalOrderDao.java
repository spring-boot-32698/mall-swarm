package com.macro.mall.portal.dao;

import com.macro.mall.model.OmsOrderItem;
import com.macro.mall.portal.domain.OmsOrderDetail;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Storefront order customization Dao
 * Created by macro on 2018/9/4.
 */
public interface PortalOrderDao {
    /**
     * Get order and ordered product details
     */
    OmsOrderDetail getDetail(@Param("orderId") Long orderId);

    /**
     * Modify locked stock and real stock in the pms_sku_stock table
     */
    int updateSkuStock(@Param("itemList") List<OmsOrderItem> orderItemList);

    /**
     * Get timed-out orders
     * @param minute Timeout (minutes)
     */
    List<OmsOrderDetail> getTimeOutOrders(@Param("minute") Integer minute);

    /**
     * Batch modify order status
     */
    int updateOrderStatus(@Param("ids") List<Long> ids,@Param("status") Integer status);

    /**
     * Release the stock lock for cancelled orders
     */
    int releaseSkuStockLock(@Param("itemList") List<OmsOrderItem> orderItemList);

}
