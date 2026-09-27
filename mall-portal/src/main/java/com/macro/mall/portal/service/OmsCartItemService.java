package com.macro.mall.portal.service;

import com.macro.mall.model.OmsCartItem;
import com.macro.mall.portal.domain.CartProduct;
import com.macro.mall.portal.domain.CartPromotionItem;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Shopping cart management Service
 * Created by macro on 2018/8/2.
 */
public interface OmsCartItemService {
    /**
     * Check whether the cart already contains the product; if so increase the quantity, otherwise add it to the cart
     */
    @Transactional
    int add(OmsCartItem cartItem);

    /**
     * Get cart list by member number
     */
    List<OmsCartItem> list(Long memberId);

    /**
     * Get the cart list including promotion info
     */
    List<CartPromotionItem> listPromotion(Long memberId, List<Long> cartIds);

    /**
     * Modify the quantity of a cart product
     */
    int updateQuantity(Long id, Long memberId, Integer quantity);

    /**
     * Batch delete products from the cart
     */
    int delete(Long memberId,List<Long> ids);

    /**
     *Get the product info used for selecting specifications in the cart
     */
    CartProduct getCartProduct(Long productId);

    /**
     * Modify specifications of products in the cart
     */
    @Transactional
    int updateAttr(OmsCartItem cartItem);

    /**
     * Clear shopping cart
     */
    int clear(Long memberId);
}
