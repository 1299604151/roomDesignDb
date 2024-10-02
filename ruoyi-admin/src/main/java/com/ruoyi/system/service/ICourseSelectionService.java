package com.ruoyi.system.service;

import java.util.List;

import com.baomidou.mybatisplus.extension.service.IService;
import com.ruoyi.system.domain.CourseSelection;
import com.ruoyi.system.domain.Farmer;

/**
 * 选课信息Service接口
 * 
 * @author ruoyi
 * @date 2024-08-25
 */
public interface ICourseSelectionService extends IService<CourseSelection>
{
    /**
     * 查询选课信息
     * 
     * @param id 选课信息主键
     * @return 选课信息
     */
    public CourseSelection selectCourseSelectionById(Long id);

    /**
     * 查询选课信息列表
     * 
     * @param courseSelection 选课信息
     * @return 选课信息集合
     */
    public List<CourseSelection> selectCourseSelectionList(CourseSelection courseSelection);

    /**
     * 新增选课信息
     * 
     * @param courseSelection 选课信息
     * @return 结果
     */
    public int insertCourseSelection(CourseSelection courseSelection);

    /**
     * 修改选课信息
     * 
     * @param courseSelection 选课信息
     * @return 结果
     */
    public int updateCourseSelection(CourseSelection courseSelection);

    /**
     * 批量删除选课信息
     * 
     * @param ids 需要删除的选课信息主键集合
     * @return 结果
     */
    public int deleteCourseSelectionByIds(Long[] ids);

    /**
     * 删除选课信息信息
     * 
     * @param id 选课信息主键
     * @return 结果
     */
    public int deleteCourseSelectionById(Long id);
}
