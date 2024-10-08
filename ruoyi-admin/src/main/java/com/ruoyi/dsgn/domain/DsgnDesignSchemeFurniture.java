package com.ruoyi.dsgn.domain;

import java.util.Date;

import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 家具素材-设计方案关联对象 dsgn_design_scheme_furniture
 * 
 * @author ruoyi
 * @date 2024-10-07 19:10:47
 */
@TableName("dsgn_design_scheme_furniture")
public class DsgnDesignSchemeFurniture extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 关联ID */
    private Long id;

    /** 设计方案ID */
    @Excel(name = "设计方案ID")
    private Long designSchemeId;

    /** 家具素材ID */
    @Excel(name = "家具素材ID")
    private Long furnitureItemId;

    /** 创建时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "创建时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date createdAt;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setDesignSchemeId(Long designSchemeId) 
    {
        this.designSchemeId = designSchemeId;
    }

    public Long getDesignSchemeId() 
    {
        return designSchemeId;
    }
    public void setFurnitureItemId(Long furnitureItemId) 
    {
        this.furnitureItemId = furnitureItemId;
    }

    public Long getFurnitureItemId() 
    {
        return furnitureItemId;
    }
    public void setCreatedAt(Date createdAt) 
    {
        this.createdAt = createdAt;
    }

    public Date getCreatedAt() 
    {
        return createdAt;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("designSchemeId", getDesignSchemeId())
            .append("furnitureItemId", getFurnitureItemId())
            .append("createdAt", getCreatedAt())
            .toString();
    }
}
