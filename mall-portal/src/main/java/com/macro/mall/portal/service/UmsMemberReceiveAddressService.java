package com.macro.mall.portal.service;

import com.macro.mall.model.UmsMemberReceiveAddress;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * User address management Service
 * Created by macro on 2018/8/28.
 */
public interface UmsMemberReceiveAddressService {
    /**
     * Add shipping address
     */
    int add(UmsMemberReceiveAddress address);

    /**
     * Delete shipping address
     * @param id of the address table id
     */
    int delete(Long id);

    /**
     * Modify shipping address
     * @param id of the address table id
     * @param address Modified shipping address information
     */
    @Transactional
    int update(Long id, UmsMemberReceiveAddress address);

    /**
     * Return the current user’s shipping addresses
     */
    List<UmsMemberReceiveAddress> list();

    /**
     * Get address details
     * @param id Address id
     */
    UmsMemberReceiveAddress getItem(Long id);
}
