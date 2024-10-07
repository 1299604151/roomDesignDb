package com.ruoyi.dsgn.domain;

import java.math.BigDecimal;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 设计方案对象 dsgn_design_schemes
 * 
 * @author ruoyi
 * @date 2024-10-07 19:10:47
 */
public class DsgnDesignSchemes extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 设计方案ID */
    private Long id;

    /** 设计方案标题 */
    @Excel(name = "设计方案标题")
    private String title;

    /** 标语 */
    @Excel(name = "标语")
    private String tagline;

    /** 价格 */
    @Excel(name = "价格")
    private BigDecimal price;

    /** 风格ID */
    @Excel(name = "风格ID")
    private Long styleId;

    /** 适用空间 */
    @Excel(name = "适用空间")
    private String spaceType;

    /** 推荐面积 */
    @Excel(name = "推荐面积")
    private String recommendedArea;

    /** 预算范围 */
    @Excel(name = "预算范围")
    private String budgetRange;

    /** 主图URL */
    @Excel(name = "主图URL")
    private String mainImageUrl;

    /** 预览图URL列表，以逗号分隔 */
    @Excel(name = "预览图URL列表，以逗号分隔")
    private String previewImages;

    /** 色彩方案描述 */
    @Excel(name = "色彩方案描述")
    private String colorSchemeDescription;

    /** 设计理念 */
    @Excel(name = "设计理念")
    private String designConcept;

    /** 设计特点 */
    @Excel(name = "设计特点")
    private String features;

    /** 设计师ID */
    @Excel(name = "设计师ID")
    private Long designerId;

    /** 状态：草稿、已发布、已归档 */
    @Excel(name = "状态：草稿、已发布、已归档")
    private String status;

    /** 发布日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "发布日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date publishDate;

    /** 查看次数 */
    @Excel(name = "查看次数")
    private Long viewCount;

    /** 点赞次数 */
    @Excel(name = "点赞次数")
    private Long likeCount;

    /** 创建时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "创建时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date createdAt;

    /** 更新时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "更新时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date updatedAt;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setTitle(String title) 
    {
        this.title = title;
    }

    public String getTitle() 
    {
        return title;
    }
    public void setTagline(String tagline) 
    {
        this.tagline = tagline;
    }

    public String getTagline() 
    {
        return tagline;
    }
    public void setPrice(BigDecimal price) 
    {
        this.price = price;
    }

    public BigDecimal getPrice() 
    {
        return price;
    }
    public void setStyleId(Long styleId) 
    {
        this.styleId = styleId;
    }

    public Long getStyleId() 
    {
        return styleId;
    }
    public void setSpaceType(String spaceType) 
    {
        this.spaceType = spaceType;
    }

    public String getSpaceType() 
    {
        return spaceType;
    }
    public void setRecommendedArea(String recommendedArea) 
    {
        this.recommendedArea = recommendedArea;
    }

    public String getRecommendedArea() 
    {
        return recommendedArea;
    }
    public void setBudgetRange(String budgetRange) 
    {
        this.budgetRange = budgetRange;
    }

    public String getBudgetRange() 
    {
        return budgetRange;
    }
    public void setMainImageUrl(String mainImageUrl) 
    {
        this.mainImageUrl = mainImageUrl;
    }

    public String getMainImageUrl() 
    {
        return mainImageUrl;
    }
    public void setPreviewImages(String previewImages) 
    {
        this.previewImages = previewImages;
    }

    public String getPreviewImages() 
    {
        return previewImages;
    }
    public void setColorSchemeDescription(String colorSchemeDescription) 
    {
        this.colorSchemeDescription = colorSchemeDescription;
    }

    public String getColorSchemeDescription() 
    {
        return colorSchemeDescription;
    }
    public void setDesignConcept(String designConcept) 
    {
        this.designConcept = designConcept;
    }

    public String getDesignConcept() 
    {
        return designConcept;
    }
    public void setFeatures(String features) 
    {
        this.features = features;
    }

    public String getFeatures() 
    {
        return features;
    }
    public void setDesignerId(Long designerId) 
    {
        this.designerId = designerId;
    }

    public Long getDesignerId() 
    {
        return designerId;
    }
    public void setStatus(String status) 
    {
        this.status = status;
    }

    public String getStatus() 
    {
        return status;
    }
    public void setPublishDate(Date publishDate) 
    {
        this.publishDate = publishDate;
    }

    public Date getPublishDate() 
    {
        return publishDate;
    }
    public void setViewCount(Long viewCount) 
    {
        this.viewCount = viewCount;
    }

    public Long getViewCount() 
    {
        return viewCount;
    }
    public void setLikeCount(Long likeCount) 
    {
        this.likeCount = likeCount;
    }

    public Long getLikeCount() 
    {
        return likeCount;
    }
    public void setCreatedAt(Date createdAt) 
    {
        this.createdAt = createdAt;
    }

    public Date getCreatedAt() 
    {
        return createdAt;
    }
    public void setUpdatedAt(Date updatedAt) 
    {
        this.updatedAt = updatedAt;
    }

    public Date getUpdatedAt() 
    {
        return updatedAt;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("title", getTitle())
            .append("tagline", getTagline())
            .append("price", getPrice())
            .append("styleId", getStyleId())
            .append("spaceType", getSpaceType())
            .append("recommendedArea", getRecommendedArea())
            .append("budgetRange", getBudgetRange())
            .append("mainImageUrl", getMainImageUrl())
            .append("previewImages", getPreviewImages())
            .append("colorSchemeDescription", getColorSchemeDescription())
            .append("designConcept", getDesignConcept())
            .append("features", getFeatures())
            .append("designerId", getDesignerId())
            .append("status", getStatus())
            .append("publishDate", getPublishDate())
            .append("viewCount", getViewCount())
            .append("likeCount", getLikeCount())
            .append("createdAt", getCreatedAt())
            .append("updatedAt", getUpdatedAt())
            .toString();
    }
}
