package com.macro.mall.dao;

import com.macro.mall.model.PmsProductLadder;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Custom member tiered price Dao
 * Created by macro on 2018/4/26.
 */
public interface PmsProductLadderDao {
    /**
     * Batch create
     */
    int insertList(@Param("list") List<PmsProductLadder> productLadderList);
}
