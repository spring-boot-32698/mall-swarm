package com.macro.mall.portal.domain;

import com.macro.mall.model.CmsSubject;
import com.macro.mall.model.PmsBrand;
import com.macro.mall.model.PmsProduct;
import com.macro.mall.model.SmsHomeAdvertise;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

/**
 * Home content response wrapper
 * Created by macro on 2019/1/28.
 */
@Getter
@Setter
public class HomeContentResult {
    //Carousel ads
    private List<SmsHomeAdvertise> advertiseList;
    //Recommended brands
    private List<PmsBrand> brandList;
    //Current flash sale session
    private HomeFlashPromotion homeFlashPromotion;
    //New arrival recommendations
    private List<PmsProduct> newProductList;
    //Popular recommendations
    private List<PmsProduct> hotProductList;
    //Recommended topics
    private List<CmsSubject> subjectList;
}
