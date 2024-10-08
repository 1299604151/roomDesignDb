package com.ruoyi.dsgn.domain;

import java.util.Date;

import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 设计方案-色彩关联对象 dsgn_design_scheme_colors
 * 
 * @author ruoyi
 * @date 2024-10-07 19:10:47
 */
@TableName("dsgn_design_scheme_colors")
public class DsgnDesignSchemeColors extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 关联ID */
    private Long id;

    /** 设计方案ID */
    @Excel(name = "设计方案ID")
    private Long designSchemeId;

    /** 色彩ID */
    @Excel(name = "色彩ID")
    private Long colorId;

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
    public void setColorId(Long colorId) 
    {
        this.colorId = colorId;
    }

    public Long getColorId() 
    {
        return colorId;
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
            .append("colorId", getColorId())
            .append("createdAt", getCreatedAt())
            .toString();
    }
}
