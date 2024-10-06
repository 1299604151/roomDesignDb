package com.ruoyi.system.domain;

import java.util.Date;

import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 设计方案-材料关联对象 dsgn_design_scheme_materials
 * 
 * @author ruoyi
 * @date 2024-10-06 16:51:17
 */
@TableName("dsgn_design_scheme_materials")
public class DsgnDesignSchemeMaterials
{
    private static final long serialVersionUID = 1L;

    /** 关联ID */
    private Long id;

    /** 设计方案ID */
    @Excel(name = "设计方案ID")
    private Long designSchemeId;

    /** 材料ID */
    @Excel(name = "材料ID")
    private Long materialId;

    /** 材料使用描述 */
    @Excel(name = "材料使用描述")
    private String usageDescription;

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
    public void setMaterialId(Long materialId) 
    {
        this.materialId = materialId;
    }

    public Long getMaterialId() 
    {
        return materialId;
    }
    public void setUsageDescription(String usageDescription) 
    {
        this.usageDescription = usageDescription;
    }

    public String getUsageDescription() 
    {
        return usageDescription;
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
            .append("materialId", getMaterialId())
            .append("usageDescription", getUsageDescription())
            .append("createdAt", getCreatedAt())
            .toString();
    }
}
