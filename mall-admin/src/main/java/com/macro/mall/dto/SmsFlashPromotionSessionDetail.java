package com.macro.mall.dto;

import com.macro.mall.model.SmsFlashPromotionSession;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;

/**
 * Session info including product counts
 * Created by macro on 2018/11/19.
 */
public class SmsFlashPromotionSessionDetail extends SmsFlashPromotionSession {
    @Setter
    @Getter
    @Schema(title = "Product quantity")
    private Long productCount;
}
