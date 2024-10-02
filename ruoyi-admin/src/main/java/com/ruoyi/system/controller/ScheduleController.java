package com.ruoyi.system.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
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
import com.ruoyi.system.domain.Schedule;
import com.ruoyi.system.service.IScheduleService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 排班信息Controller
 * 
 * @author ruoyi
 * @date 2024-08-25
 */
@RestController
@RequestMapping("/system/schedule")
public class ScheduleController extends BaseController
{
    @Autowired
    private IScheduleService scheduleService;

    /**
     * 查询排班信息列表
     */
    @PreAuthorize("@ss.hasPermi('system:schedule:list')")
    @GetMapping("/list")
    public TableDataInfo list(Schedule schedule)
    {
        startPage();
        List<Schedule> list = scheduleService.selectScheduleList(schedule);
        return getDataTable(list);
    }

    /**
     * 导出排班信息列表
     */
    @PreAuthorize("@ss.hasPermi('system:schedule:export')")
    @Log(title = "排班信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Schedule schedule)
    {
        List<Schedule> list = scheduleService.selectScheduleList(schedule);
        ExcelUtil<Schedule> util = new ExcelUtil<Schedule>(Schedule.class);
        util.exportExcel(response, list, "排班信息数据");
    }

    /**
     * 获取排班信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:schedule:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(scheduleService.selectScheduleById(id));
    }

    /**
     * 新增排班信息
     */
    @PreAuthorize("@ss.hasPermi('system:schedule:add')")
    @Log(title = "排班信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Schedule schedule)
    {
        return toAjax(scheduleService.insertSchedule(schedule));
    }

    /**
     * 修改排班信息
     */
    @PreAuthorize("@ss.hasPermi('system:schedule:edit')")
    @Log(title = "排班信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Schedule schedule)
    {
        return toAjax(scheduleService.updateSchedule(schedule));
    }

    /**
     * 删除排班信息
     */
    @PreAuthorize("@ss.hasPermi('system:schedule:remove')")
    @Log(title = "排班信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(scheduleService.deleteScheduleByIds(ids));
    }
}
