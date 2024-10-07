package com.ruoyi.dsgn.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 用户收藏对象 dsgn_favorites
 * 
 * @author ruoyi
 * @date 2024-10-07 19:10:47
 */
public class DsgnFavorites extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 收藏ID */
    private Long id;

    /** 用户ID */
    @Excel(name = "用户ID")
    private Long userId;

    /** 设计方案ID */
    @Excel(name = "设计方案ID")
    private Long designSchemeId;

    /** 收藏时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "收藏时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date createdAt;

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
    public void setDesignSchemeId(Long designSchemeId) 
    {
        this.designSchemeId = designSchemeId;
    }

    public Long getDesignSchemeId() 
    {
        return designSchemeId;
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
            .append("userId", getUserId())
            .append("designSchemeId", getDesignSchemeId())
            .append("createdAt", getCreatedAt())
            .toString();
    }
}
