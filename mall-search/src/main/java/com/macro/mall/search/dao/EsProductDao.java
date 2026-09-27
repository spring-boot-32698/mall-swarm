package com.macro.mall.search.dao;

import com.macro.mall.search.domain.EsProduct;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Product search management customization Dao
 * Created by macro on 2018/6/19.
 */
public interface EsProductDao {
    /**
     * Get the search product with the specified ID
     */
    List<EsProduct> getAllEsProductList(@Param("id") Long id);
}
