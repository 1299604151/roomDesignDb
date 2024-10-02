package com.ruoyi.system.service.impl;

import java.util.List;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.common.core.domain.model.LoginUser;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.system.domain.CourseSelection;
import com.ruoyi.system.domain.Farmer;
import com.ruoyi.system.mapper.CourseSelectionMapper;
import com.ruoyi.system.mapper.FarmerMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.CourseMapper;
import com.ruoyi.system.domain.Course;
import com.ruoyi.system.service.ICourseService;
import org.springframework.transaction.annotation.Transactional;

/**
 * 课程信息Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-08-25
 */
@Service
public class CourseServiceImpl extends ServiceImpl<CourseMapper, Course> implements ICourseService
{
    @Autowired
    private CourseMapper courseMapper;
    @Autowired
    private FarmerMapper farmerMapper;
    @Autowired
    private CourseSelectionMapper courseSelectionMapper;

    /**
     * 查询课程信息
     * 
     * @param id 课程信息主键
     * @return 课程信息
     */
    @Override
    public Course selectCourseById(Long id)
    {
        return courseMapper.selectCourseById(id);
    }

    /**
     * 查询课程信息列表
     * 
     * @param course 课程信息
     * @return 课程信息
     */
    @Override
    public List<Course> selectCourseList(Course course)
    {

        return courseMapper.selectCourseList(course);
    }

    /**
     * 新增课程信息
     * 
     * @param course 课程信息
     * @return 结果
     */
    @Override
    public int insertCourse(Course course)
    {
        return courseMapper.insertCourse(course);
    }

    /**
     * 修改课程信息
     * 
     * @param course 课程信息
     * @return 结果
     */
    @Override
    public int updateCourse(Course course)
    {
        return courseMapper.updateCourse(course);
    }

    /**
     * 批量删除课程信息
     * 
     * @param ids 需要删除的课程信息主键
     * @return 结果
     */
    @Override
    public int deleteCourseByIds(Long[] ids)
    {
        return courseMapper.deleteCourseByIds(ids);
    }

    /**
     * 删除课程信息信息
     * 
     * @param id 课程信息主键
     * @return 结果
     */
    @Override
    public int deleteCourseById(Long id)
    {
        return courseMapper.deleteCourseById(id);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public int selectOneCourse(Long id) {
        // 获取当前登录用户
        LoginUser loginUser = SecurityUtils.getLoginUser();
        LambdaQueryWrapper<Farmer> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(Farmer::getUserId, loginUser.getUser().getUserId());
        // 根据用户id查询农户信息
        Farmer farmer = farmerMapper.selectOne(queryWrapper);
        // 判断农户是否存在
        if (farmer == null) {
            throw new RuntimeException("农户不存在");
        }
        // 判断课程是否存在
        Course course = courseMapper.selectCourseById(id);
        if (course == null) {
            throw new RuntimeException("课程不存在");
        }
        // 判断课程是否已选
        LambdaQueryWrapper<CourseSelection> queryWrapper1 = new LambdaQueryWrapper<>();
        queryWrapper1.eq(CourseSelection::getCourseId, course.getCourseId());
        queryWrapper1.eq(CourseSelection::getStudentId, farmer.getId());
        // 判断是否已选
        Long count = courseSelectionMapper.selectCount(queryWrapper1);
        if(count>0){
            throw new RuntimeException("课程已选");
        }
        // 选课
        CourseSelection courseSelection = new CourseSelection();
        courseSelection.setStudentId(farmer.getStudentId());
        courseSelection.setCourseId(course.getCourseId());
        courseSelection.setClassTime(course.getClassTime());
        courseSelectionMapper.insert(courseSelection);

        return 1;
    }
}
