package com.ruoyi.system.domain;

import java.util.Date;

import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 用户偏好对象 dsgn_preferences
 * 
 * @author ruoyi
 * @date 2024-10-06 16:51:18
 */
@TableName("dsgn_preferences")
public class DsgnPreferences
{
    private static final long serialVersionUID = 1L;

    /** 偏好ID */
    private Long id;

    /** 用户ID */
    @Excel(name = "用户ID")
    private Long userId;

    /** 偏好色彩ID列表，逗号分隔 */
    @Excel(name = "偏好色彩ID列表，逗号分隔")
    private String colorIds;

    /** 偏好材料ID列表，逗号分隔 */
    @Excel(name = "偏好材料ID列表，逗号分隔")
    private String materialIds;

    /** 偏好风格ID列表，逗号分隔 */
    @Excel(name = "偏好风格ID列表，逗号分隔")
    private String styleIds;

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
    public void setUserId(Long userId) 
    {
        this.userId = userId;
    }

    public Long getUserId() 
    {
        return userId;
    }
    public void setColorIds(String colorIds) 
    {
        this.colorIds = colorIds;
    }

    public String getColorIds() 
    {
        return colorIds;
    }
    public void setMaterialIds(String materialIds) 
    {
        this.materialIds = materialIds;
    }

    public String getMaterialIds() 
    {
        return materialIds;
    }
    public void setStyleIds(String styleIds) 
    {
        this.styleIds = styleIds;
    }

    public String getStyleIds() 
    {
        return styleIds;
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
            .append("userId", getUserId())
            .append("colorIds", getColorIds())
            .append("materialIds", getMaterialIds())
            .append("styleIds", getStyleIds())
            .append("createdAt", getCreatedAt())
            .append("updatedAt", getUpdatedAt())
            .toString();
    }
}
