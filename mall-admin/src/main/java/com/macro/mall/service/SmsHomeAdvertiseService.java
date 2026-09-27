package com.macro.mall.service;

import com.macro.mall.model.SmsHomeAdvertise;

import java.util.List;

/**
 * Home ad management Service
 * Created by macro on 2018/11/7.
 */
public interface SmsHomeAdvertiseService {
    /**
     * Add advertisement
     */
    int create(SmsHomeAdvertise advertise);

    /**
     * Batch delete advertisements
     */
    int delete(List<Long> ids);

    /**
     * Modify online/offline status
     */
    int updateStatus(Long id, Integer status);

    /**
     * Get advertisement details
     */
    SmsHomeAdvertise getItem(Long id);

    /**
     * Update advertisement
     */
    int update(Long id, SmsHomeAdvertise advertise);

    /**
     * Query advertisements with paging
     */
    List<SmsHomeAdvertise> list(String name, Integer type, String endTime, Integer pageSize, Integer pageNum);
}
