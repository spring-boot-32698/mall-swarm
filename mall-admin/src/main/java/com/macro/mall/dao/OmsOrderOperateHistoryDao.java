package com.macro.mall.dao;

import com.macro.mall.model.OmsOrderOperateHistory;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Order operation record customization Dao
 * Created by macro on 2018/10/12.
 */
public interface OmsOrderOperateHistoryDao {
    /**
     * Batch create
     */
    int insertList(@Param("list") List<OmsOrderOperateHistory> orderOperateHistoryList);
}
