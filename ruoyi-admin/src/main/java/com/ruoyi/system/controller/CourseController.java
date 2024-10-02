package com.ruoyi.system.controller;

import java.util.*;
import javax.servlet.http.HttpServletResponse;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.ruoyi.common.core.domain.model.LoginUser;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.system.domain.CourseSelection;
import com.ruoyi.system.domain.Farmer;
import com.ruoyi.system.domain.Schedule;
import com.ruoyi.system.mapper.CourseSelectionMapper;
import com.ruoyi.system.mapper.FarmerMapper;
import com.ruoyi.system.mapper.ScheduleMapper;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.system.domain.Course;
import com.ruoyi.system.service.ICourseService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 课程信息Controller
 * 
 * @author ruoyi
 * @date 2024-08-25
 */
@RestController
@RequestMapping("/system/course")
public class CourseController extends BaseController
{
    @Autowired
    private ICourseService courseService;
    @Autowired
    private CourseSelectionMapper courseSelectionMapper;
    @Autowired
    private FarmerMapper farmerMapper;
    @Autowired
    private ScheduleMapper scheduleMapper;

    /**
     * 查询课程信息列表
     */
    @PreAuthorize("@ss.hasPermi('system:course:list')")
    @GetMapping("/list")
    public TableDataInfo list(Course course)
    {
        startPage();
        List<Course> list = courseService.selectCourseList(course);
        return getDataTable(list);
    }

    /**
     * 导出课程信息列表
     */
    @PreAuthorize("@ss.hasPermi('system:course:export')")
    @Log(title = "课程信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Course course)
    {
        List<Course> list = courseService.selectCourseList(course);
        ExcelUtil<Course> util = new ExcelUtil<Course>(Course.class);
        util.exportExcel(response, list, "课程信息数据");
    }

    /**
     * 获取课程信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:course:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(courseService.selectCourseById(id));
    }

    /**
     * 新增课程信息
     */
    @PreAuthorize("@ss.hasPermi('system:course:add')")
    @Log(title = "课程信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Course course)
    {
        // 根据课程编号查询课程信息
        Course course1 = courseService.getOne(new QueryWrapper<Course>().eq("course_id", course.getCourseId()).last("limit 1"));
        if (course1 != null) {
            return AjaxResult.error("新增课程'" + course.getCourseId() + "'失败，课程编号已存在");
        }
        return toAjax(courseService.insertCourse(course));
    }

    /**
     * 修改课程信息
     */
    @PreAuthorize("@ss.hasPermi('system:course:edit')")
    @Log(title = "课程信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Course course)
    {
        // 根据课程编号查询课程信息
        Course course1 = courseService.getOne(new QueryWrapper<Course>().
                eq("course_id", course.getCourseId()).last("limit 1")
                .ne("id", course.getId())
        );
        // 根据id获取信息
        Course course2 = courseService.selectCourseById(course.getId());
        // 课程编号不能修改
        if (!course2.getCourseId().equals(course.getCourseId())) {
            return AjaxResult.error("修改课程'" + course.getCourseId() + "'失败，课程编号不能修改");
        }
        if (course1 != null) {
            return AjaxResult.error("新增课程'" + course.getCourseId() + "'失败，课程编号已存在");
        }
        return toAjax(courseService.updateCourse(course));
    }

    /**
     * 查询课程数和学员数
     * */
    @GetMapping("/courseAndStudentCount")
    public AjaxResult courseAndStudentCount()
    {
        Map<String,String> map = new HashMap<>();
        map.put("courseCount",courseService.count()+"");
        map.put("studentCount",farmerMapper.selectCount(null)+"");
        return AjaxResult.success(map);
    }
    /**
     * 选课
     * */
    @PreAuthorize("@ss.hasPermi('system:course:select')")
    @GetMapping("/select/{id}")
    public AjaxResult select(@PathVariable("id") Long id)
    {
        return toAjax(courseService.selectOneCourse(id));
    }

    /**
     * 删除课程信息
     */
    @PreAuthorize("@ss.hasPermi('system:course:remove')")
    @Log(title = "课程信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        List<String> courseIdList = new ArrayList<>();
        List<Course> courseList = courseService.listByIds(Arrays.asList(ids));
        for (Course course : courseList) {
            courseIdList.add(course.getCourseId());
        }
        // 判断是否有课程选课信息
        for (String id : courseIdList) {
            List<CourseSelection> courseSelections = courseSelectionMapper.selectList(new QueryWrapper<CourseSelection>().eq("course_id", id));
            // 判断课程是否被排班
            if (scheduleMapper.selectCount(new QueryWrapper<Schedule>().eq("course_id", id)) > 0) {
                return AjaxResult.error("删除课程'" + id + "'失败，课程已被排班");
            }
            if (courseSelections.size() > 0) {
                return AjaxResult.error("删除课程'" + id + "'失败，课程已被选课");
            }
        }
        return toAjax(courseService.deleteCourseByIds(ids));
    }

    /**
     * 获取当前用户已经选择的课程
     * */
    @GetMapping("/myCourse")
    public TableDataInfo myCourse()
    {
        // 获取当前登录用户
        LoginUser loginUser = SecurityUtils.getLoginUser();
        LambdaQueryWrapper<Farmer> queryWrapper1 = new LambdaQueryWrapper<>();
        queryWrapper1.eq(Farmer::getUserId, loginUser.getUser().getUserId());
        // 根据用户id查询农户信息
        Farmer farmer = farmerMapper.selectOne(queryWrapper1);
        if(farmer == null){
            return getDataTable(new ArrayList<>());
        }
        LambdaQueryWrapper<CourseSelection> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(CourseSelection::getStudentId, farmer.getStudentId());
        List<CourseSelection> list = courseSelectionMapper.selectList(queryWrapper);
        return getDataTable(list);
    }

}
