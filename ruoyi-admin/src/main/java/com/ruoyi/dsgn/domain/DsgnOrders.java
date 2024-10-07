package com.ruoyi.dsgn.domain;

import java.math.BigDecimal;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 订单对象 dsgn_orders
 * 
 * @author ruoyi
 * @date 2024-10-07 19:10:47
 */
public class DsgnOrders extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 订单ID */
    private Long id;

    /** 用户ID */
    @Excel(name = "用户ID")
    private Long userId;

    /** 设计方案ID */
    @Excel(name = "设计方案ID")
    private Long designSchemeId;

    /** 订单编号 */
    @Excel(name = "订单编号")
    private String orderNumber;

    /** 订单金额 */
    @Excel(name = "订单金额")
    private BigDecimal amount;

    /** 订单状态 */
    @Excel(name = "订单状态")
    private String status;

    /** 支付方式 */
    @Excel(name = "支付方式")
    private String paymentMethod;

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
    public void setDesignSchemeId(Long designSchemeId) 
    {
        this.designSchemeId = designSchemeId;
    }

    public Long getDesignSchemeId() 
    {
        return designSchemeId;
    }
    public void setOrderNumber(String orderNumber) 
    {
        this.orderNumber = orderNumber;
    }

    public String getOrderNumber() 
    {
        return orderNumber;
    }
    public void setAmount(BigDecimal amount) 
    {
        this.amount = amount;
    }

    public BigDecimal getAmount() 
    {
        return amount;
    }
    public void setStatus(String status) 
    {
        this.status = status;
    }

    public String getStatus() 
    {
        return status;
    }
    public void setPaymentMethod(String paymentMethod) 
    {
        this.paymentMethod = paymentMethod;
    }

    public String getPaymentMethod() 
    {
        return paymentMethod;
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
            .append("designSchemeId", getDesignSchemeId())
            .append("orderNumber", getOrderNumber())
            .append("amount", getAmount())
            .append("status", getStatus())
            .append("paymentMethod", getPaymentMethod())
            .append("createdAt", getCreatedAt())
            .append("updatedAt", getUpdatedAt())
            .toString();
    }
}
