package com.ruoyi.dsgn.domain;

import java.util.Date;

import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 用户浏览历史对象 dsgn_browsing_history
 * 
 * @author ruoyi
 * @date 2024-10-07 19:10:47
 */
@TableName("dsgn_browsing_history")
public class DsgnBrowsingHistory extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 浏览历史ID */
    private Long id;

    /** 用户ID */
    @Excel(name = "用户ID")
    private Long userId;

    /** 设计方案ID */
    @Excel(name = "设计方案ID")
    private Long designSchemeId;

    /** 浏览时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "浏览时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date viewedAt;

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
    public void setViewedAt(Date viewedAt) 
    {
        this.viewedAt = viewedAt;
    }

    public Date getViewedAt() 
    {
        return viewedAt;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("userId", getUserId())
            .append("designSchemeId", getDesignSchemeId())
            .append("viewedAt", getViewedAt())
            .toString();
    }
}
