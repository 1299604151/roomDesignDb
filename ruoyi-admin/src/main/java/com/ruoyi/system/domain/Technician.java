package com.ruoyi.system.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.databind.ser.std.ToStringSerializer;
import lombok.Data;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 技术员信息对象 technician
 * 
 * @author ruoyi
 * @date 2024-08-25
 */
@Data
public class Technician
{
    private static final long serialVersionUID = 1L;

    /** 主键ID */
    @TableId(type = IdType.AUTO)
    @JsonSerialize(using = ToStringSerializer.class)
    private Long id;

    /** 工号 */
    @Excel(name = "工号")
    private String employeeId;

    /** 性别
     * 性别 0 男 1 女
     * */
    @Excel(name = "性别")
    private String gender;

    /** 年龄 */
    @Excel(name = "年龄")
    private Long age;

    /** 姓名 */
    @Excel(name = "姓名")
    private String name;

    /** 职称 */
    @Excel(name = "职称")
    private String title;

    /** 专长 */
    @Excel(name = "专长")
    private String speciality;

    /**
     * 密码*/
    @TableField(exist = false)
    private String password;

    /** 用户ID */
    @Excel(name = "用户ID")
    private Long userId;



}
