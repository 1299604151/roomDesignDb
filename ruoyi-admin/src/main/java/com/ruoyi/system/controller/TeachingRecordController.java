package com.ruoyi.system.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.ruoyi.common.core.domain.model.LoginUser;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.system.domain.Technician;
import com.ruoyi.system.service.ITechnicianService;
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
import com.ruoyi.system.domain.TeachingRecord;
import com.ruoyi.system.service.ITeachingRecordService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 授课信息Controller
 * 
 * @author ruoyi
 * @date 2024-08-25
 */
@RestController
@RequestMapping("/system/record")
public class TeachingRecordController extends BaseController
{
    @Autowired
    private ITeachingRecordService teachingRecordService;
    @Autowired
    private ITechnicianService technicianService;

    /**
     * 查询授课信息列表
     */
    @PreAuthorize("@ss.hasPermi('system:record:list')")
    @GetMapping("/list")
    public TableDataInfo list(TeachingRecord teachingRecord)
    {
        startPage();
        List<TeachingRecord> list = teachingRecordService.selectTeachingRecordList(teachingRecord);
        return getDataTable(list);
    }

    /**
     * 导出授课信息列表
     */
    @PreAuthorize("@ss.hasPermi('system:record:export')")
    @Log(title = "授课信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, TeachingRecord teachingRecord)
    {
        List<TeachingRecord> list = teachingRecordService.selectTeachingRecordList(teachingRecord);
        ExcelUtil<TeachingRecord> util = new ExcelUtil<TeachingRecord>(TeachingRecord.class);
        util.exportExcel(response, list, "授课信息数据");
    }

    /**
     * 获取授课信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:record:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(teachingRecordService.selectTeachingRecordById(id));
    }

    /**
     * 授课
     * */
    @PreAuthorize("@ss.hasPermi('system:record:teach')")
    @Log(title = "授课信息", businessType = BusinessType.INSERT)
    @PostMapping("/teach")
    public AjaxResult teach(@RequestBody TeachingRecord teachingRecord)
    {
        // 获取当前登录用户
        LoginUser loginUser = SecurityUtils.getLoginUser();
        // 根据用户id获取技术人员信息
        LambdaQueryWrapper<Technician> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(Technician::getUserId, loginUser.getUser().getUserId());
        Technician technician = technicianService.getOne(queryWrapper);
        // 判断是否是技术人员
        if (technician == null) {
            return error("您不是技术人员，无法授课");
        }
        // 判断是否是对应的技术人员
        if (!technician.getEmployeeId().equals(teachingRecord.getEmployeeId())) {
            return error("您不是该课程技术人员，无法授课");
        }
        // 判断是否重复授课
        LambdaQueryWrapper<TeachingRecord> queryWrapper1 = new LambdaQueryWrapper<>();
        queryWrapper1.eq(TeachingRecord::getEmployeeId, teachingRecord.getEmployeeId());
        queryWrapper1.eq(TeachingRecord::getCourseId, teachingRecord.getCourseId());
        Long count = teachingRecordService.count(queryWrapper1);
        if (count > 0) {
            return error("您已授课，无法重复授课");
        }
        // 保存
        teachingRecordService.save(teachingRecord);
        return success();
    }

    /**
     * 新增授课信息
     */
    @PreAuthorize("@ss.hasPermi('system:record:add')")
    @Log(title = "授课信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody TeachingRecord teachingRecord)
    {
        return toAjax(teachingRecordService.insertTeachingRecord(teachingRecord));
    }

    /**
     * 修改授课信息
     */
    @PreAuthorize("@ss.hasPermi('system:record:edit')")
    @Log(title = "授课信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody TeachingRecord teachingRecord)
    {
        return toAjax(teachingRecordService.updateTeachingRecord(teachingRecord));
    }

    /**
     * 删除授课信息
     */
    @PreAuthorize("@ss.hasPermi('system:record:remove')")
    @Log(title = "授课信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(teachingRecordService.deleteTeachingRecordByIds(ids));
    }
}
