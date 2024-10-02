package com.ruoyi.system.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.databind.ser.std.ToStringSerializer;
import lombok.Data;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 学习小组信息对象 study_group
 * 
 * @author ruoyi
 * @date 2024-08-25
 */
@Data
public class StudyGroup
{
    private static final long serialVersionUID = 1L;

    /** 主键ID */
    @TableId(type = IdType.AUTO)
    @JsonSerialize(using = ToStringSerializer.class)
    private Long id;

    /** 组号 */
    @Excel(name = "组号")
    private Long groupId;

    /** 名称 */
    @Excel(name = "名称")
    private String groupName;

    /** 所属地区 */
    @Excel(name = "所属地区")
    private String region;

    /** 成员数量 */
    @Excel(name = "成员数量")
    private Long memberNumber;

}
