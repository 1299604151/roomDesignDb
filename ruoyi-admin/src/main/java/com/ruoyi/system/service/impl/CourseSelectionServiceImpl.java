package com.ruoyi.system.service.impl;

import java.util.List;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.common.core.domain.model.LoginUser;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.system.domain.Farmer;
import com.ruoyi.system.mapper.FarmerMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.CourseSelectionMapper;
import com.ruoyi.system.domain.CourseSelection;
import com.ruoyi.system.service.ICourseSelectionService;

/**
 * 选课信息Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-08-25
 */
@Service
public class CourseSelectionServiceImpl extends ServiceImpl<CourseSelectionMapper, CourseSelection> implements ICourseSelectionService
{
    @Autowired
    private CourseSelectionMapper courseSelectionMapper;
    @Autowired
    private FarmerMapper farmerMapper;

    /**
     * 查询选课信息
     * 
     * @param id 选课信息主键
     * @return 选课信息
     */
    @Override
    public CourseSelection selectCourseSelectionById(Long id)
    {
        return courseSelectionMapper.selectCourseSelectionById(id);
    }

    /**
     * 查询选课信息列表
     * 
     * @param courseSelection 选课信息
     * @return 选课信息
     */
    @Override
    public List<CourseSelection> selectCourseSelectionList(CourseSelection courseSelection)
    {
        // 获取当前登录用户
        LoginUser loginUser = SecurityUtils.getLoginUser();
        // 如果不是管理员
        if (!loginUser.getUser().isAdmin()) {
            // 获取农户信息
            LambdaQueryWrapper<Farmer> queryWrapper = new LambdaQueryWrapper<>();
            queryWrapper.eq(Farmer::getUserId, loginUser.getUser().getUserId());
            Farmer farmer = farmerMapper.selectOne(queryWrapper);
            // 如果农户信息存在
            if (farmer != null) {
                // 设置农户id
                courseSelection.setStudentId(farmer.getStudentId());
            }
        }
        return courseSelectionMapper.selectCourseSelectionList(courseSelection);
    }

    /**
     * 新增选课信息
     * 
     * @param courseSelection 选课信息
     * @return 结果
     */
    @Override
    public int insertCourseSelection(CourseSelection courseSelection)
    {
        return courseSelectionMapper.insertCourseSelection(courseSelection);
    }

    /**
     * 修改选课信息
     * 
     * @param courseSelection 选课信息
     * @return 结果
     */
    @Override
    public int updateCourseSelection(CourseSelection courseSelection)
    {
        return courseSelectionMapper.updateCourseSelection(courseSelection);
    }

    /**
     * 批量删除选课信息
     * 
     * @param ids 需要删除的选课信息主键
     * @return 结果
     */
    @Override
    public int deleteCourseSelectionByIds(Long[] ids)
    {
        return courseSelectionMapper.deleteCourseSelectionByIds(ids);
    }

    /**
     * 删除选课信息信息
     * 
     * @param id 选课信息主键
     * @return 结果
     */
    @Override
    public int deleteCourseSelectionById(Long id)
    {
        return courseSelectionMapper.deleteCourseSelectionById(id);
    }
}
