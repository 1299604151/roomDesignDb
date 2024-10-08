package com.ruoyi.dsgn.domain;

import java.util.Date;

import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 工单时间线对象 dsgn_ticket_timeline
 * 
 * @author ruoyi
 * @date 2024-10-07 19:10:48
 */
@TableName("dsgn_ticket_timeline")
public class DsgnTicketTimeline extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 时间线ID */
    private Long id;

    /** 工单ID */
    @Excel(name = "工单ID")
    private Long ticketId;

    /** 操作 */
    @Excel(name = "操作")
    private String action;

    /** 描述 */
    @Excel(name = "描述")
    private String description;

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
    public void setTicketId(Long ticketId) 
    {
        this.ticketId = ticketId;
    }

    public Long getTicketId() 
    {
        return ticketId;
    }
    public void setAction(String action) 
    {
        this.action = action;
    }

    public String getAction() 
    {
        return action;
    }
    public void setDescription(String description) 
    {
        this.description = description;
    }

    public String getDescription() 
    {
        return description;
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
            .append("ticketId", getTicketId())
            .append("action", getAction())
            .append("description", getDescription())
            .append("createdAt", getCreatedAt())
            .toString();
    }
}
