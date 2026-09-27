package com.macro.mall.dao;

import com.macro.mall.dto.OmsOrderReturnApplyResult;
import com.macro.mall.dto.OmsReturnApplyQueryParam;
import com.macro.mall.model.OmsOrderReturnApply;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Order return request customization Dao
 * Created by macro on 2018/10/18.
 */
public interface OmsOrderReturnApplyDao {
    /**
     * Query request list
     */
    List<OmsOrderReturnApply> getList(@Param("queryParam") OmsReturnApplyQueryParam queryParam);

    /**
     * Get request details
     */
    OmsOrderReturnApplyResult getDetail(@Param("id")Long id);
}
