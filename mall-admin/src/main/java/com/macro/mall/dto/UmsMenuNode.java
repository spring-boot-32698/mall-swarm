package com.macro.mall.dto;

import com.macro.mall.model.UmsMenu;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

/**
 * Admin menu node wrapper
 * Created by macro on 2020/2/4.
 */
@Getter
@Setter
public class UmsMenuNode extends UmsMenu {
    @Schema(title = "Child menus")
    private List<UmsMenuNode> children;
}
