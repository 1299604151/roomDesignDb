package com.ruoyi.system.domain;

import java.math.BigDecimal;
import java.util.Date;

import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 收入记录对象 dsgn_income_records
 * 
 * @author ruoyi
 * @date 2024-10-06 16:51:17
 */
@TableName("dsgn_income_records")
public class DsgnIncomeRecords
{
    private static final long serialVersionUID = 1L;

    /** 收入记录ID */
    private Long id;

    /** 关联订单ID */
    @Excel(name = "关联订单ID")
    private Long orderId;

    /** 收入金额 */
    @Excel(name = "收入金额")
    private BigDecimal amount;

    /** 记录时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "记录时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date recordedAt;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setOrderId(Long orderId) 
    {
        this.orderId = orderId;
    }

    public Long getOrderId() 
    {
        return orderId;
    }
    public void setAmount(BigDecimal amount) 
    {
        this.amount = amount;
    }

    public BigDecimal getAmount() 
    {
        return amount;
    }
    public void setRecordedAt(Date recordedAt) 
    {
        this.recordedAt = recordedAt;
    }

    public Date getRecordedAt() 
    {
        return recordedAt;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("orderId", getOrderId())
            .append("amount", getAmount())
            .append("recordedAt", getRecordedAt())
            .toString();
    }
}
