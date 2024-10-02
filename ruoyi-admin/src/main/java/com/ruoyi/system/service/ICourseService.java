package com.ruoyi.system.service;

import java.util.List;

import com.baomidou.mybatisplus.extension.service.IService;
import com.ruoyi.system.domain.Course;
import com.ruoyi.system.domain.Farmer;

/**
 * 课程信息Service接口
 * 
 * @author ruoyi
 * @date 2024-08-25
 */
public interface ICourseService extends IService<Course>
{
    /**
     * 查询课程信息
     * 
     * @param id 课程信息主键
     * @return 课程信息
     */
    public Course selectCourseById(Long id);

    /**
     * 查询课程信息列表
     * 
     * @param course 课程信息
     * @return 课程信息集合
     */
    public List<Course> selectCourseList(Course course);

    /**
     * 新增课程信息
     * 
     * @param course 课程信息
     * @return 结果
     */
    public int insertCourse(Course course);

    /**
     * 修改课程信息
     * 
     * @param course 课程信息
     * @return 结果
     */
    public int updateCourse(Course course);

    /**
     * 批量删除课程信息
     * 
     * @param ids 需要删除的课程信息主键集合
     * @return 结果
     */
    public int deleteCourseByIds(Long[] ids);

    /**
     * 删除课程信息信息
     * 
     * @param id 课程信息主键
     * @return 结果
     */
    public int deleteCourseById(Long id);

    /**
     * 选择一门课程
     * */
    public int selectOneCourse(Long id);
}
