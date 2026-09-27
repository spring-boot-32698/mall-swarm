package com.macro.mall.service;

import com.macro.mall.model.SmsHomeRecommendSubject;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Home topic recommendation management Service
 * Created by macro on 2018/11/7.
 */
public interface SmsHomeRecommendSubjectService {
    /**
     * Add home recommendation
     */
    @Transactional
    int create(List<SmsHomeRecommendSubject> recommendSubjectList);

    /**
     * Modify recommendation sort
     */
    int updateSort(Long id, Integer sort);

    /**
     * Batch delete recommendations
     */
    int delete(List<Long> ids);

    /**
     * Update recommendation status
     */
    int updateRecommendStatus(List<Long> ids, Integer recommendStatus);

    /**
     * Paged query recommendations
     */
    List<SmsHomeRecommendSubject> list(String subjectName, Integer recommendStatus, Integer pageSize, Integer pageNum);
}
