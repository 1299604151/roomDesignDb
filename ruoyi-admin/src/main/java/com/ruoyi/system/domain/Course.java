package com.ruoyi.system.domain;

import java.util.Date;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.databind.ser.std.ToStringSerializer;
import lombok.Data;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 课程信息对象 course
 * 
 * @author ruoyi
 * @date 2024-08-25
 */
@Data
public class Course
{
    private static final long serialVersionUID = 1L;

    /** 主键ID */
    @TableId(type = IdType.AUTO)
    @JsonSerialize(using = ToStringSerializer.class)
    private Long id;

    /** 课程编号 */
    @Excel(name = "课程编号")
    private String courseId;

    /** 课程名称 */
    @Excel(name = "课程名称")
    private String courseName;

    /** 课程描述 */
    @Excel(name = "课程描述")
    private String courseDescription;

    /** 授课场地 */
    @Excel(name = "授课场地")
    private String venue;

    /** 授课时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "授课时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date classTime;

}
