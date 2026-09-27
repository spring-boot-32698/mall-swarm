package com.macro.mall.demo.dto;

import com.macro.mall.demo.validator.FlagValidator;
import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotNull;

/**
 * Brand parameters passed
 */
public class PmsBrandDto {
    @Schema(title = "Brand name",required = true)
    @NotNull(message = "Name cannot be empty")
    private String name;
    @Schema(title = "Brand initial letter",required = true)
    @NotNull(message = "Initial letter cannot be empty")
    private String firstLetter;
    @Schema(title = "Sort field")
    @Min(value = 0, message = "Minimum sort is 0")
    private Integer sort;
    @Schema(title = "Whether it is a manufacturer")
    @FlagValidator(value = {"0","1"}, message = "Manufacturer status is incorrect")
    private Integer factoryStatus;
    @Schema(title = "Whether to show")
    @FlagValidator(value = {"0","1"}, message = "Display status is incorrect")
    private Integer showStatus;
    @Schema(title = "Brand logo")
    private String logo;
    @Schema(title = "Brand large image")
    private String bigPic;
    @Schema(title = "Brand story")
    private String brandStory;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getFirstLetter() {
        return firstLetter;
    }

    public void setFirstLetter(String firstLetter) {
        this.firstLetter = firstLetter;
    }

    public Integer getSort() {
        return sort;
    }

    public void setSort(Integer sort) {
        this.sort = sort;
    }

    public Integer getFactoryStatus() {
        return factoryStatus;
    }

    public void setFactoryStatus(Integer factoryStatus) {
        this.factoryStatus = factoryStatus;
    }

    public Integer getShowStatus() {
        return showStatus;
    }

    public void setShowStatus(Integer showStatus) {
        this.showStatus = showStatus;
    }

    public String getLogo() {
        return logo;
    }

    public void setLogo(String logo) {
        this.logo = logo;
    }

    public String getBigPic() {
        return bigPic;
    }

    public void setBigPic(String bigPic) {
        this.bigPic = bigPic;
    }

    public String getBrandStory() {
        return brandStory;
    }

    public void setBrandStory(String brandStory) {
        this.brandStory = brandStory;
    }
}
