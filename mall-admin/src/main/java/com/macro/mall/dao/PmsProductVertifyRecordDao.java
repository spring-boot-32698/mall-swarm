package com.macro.mall.dao;

import com.macro.mall.model.PmsProductVertifyRecord;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Custom product review log management Dao
 * Created by macro on 2018/4/27.
 */
public interface PmsProductVertifyRecordDao {
    /**
     * Batch create
     */
    int insertList(@Param("list") List<PmsProductVertifyRecord> list);
}
