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
import com.ruoyi.system.domain.CourseSelection;
import com.ruoyi.system.service.ICourseSelectionService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 选课信息Controller
 * 
 * @author ruoyi
 * @date 2024-08-25
 */
@RestController
@RequestMapping("/system/selection")
public class CourseSelectionController extends BaseController
{
    @Autowired
    private ICourseSelectionService courseSelectionService;

    /**
     * 查询选课信息列表
     */
    @PreAuthorize("@ss.hasPermi('system:selection:list')")
    @GetMapping("/list")
    public TableDataInfo list(CourseSelection courseSelection)
    {
        startPage();
        List<CourseSelection> list = courseSelectionService.selectCourseSelectionList(courseSelection);
        return getDataTable(list);
    }

    /**
     * 导出选课信息列表
     */
    @PreAuthorize("@ss.hasPermi('system:selection:export')")
    @Log(title = "选课信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, CourseSelection courseSelection)
    {
        List<CourseSelection> list = courseSelectionService.selectCourseSelectionList(courseSelection);
        ExcelUtil<CourseSelection> util = new ExcelUtil<CourseSelection>(CourseSelection.class);
        util.exportExcel(response, list, "选课信息数据");
    }

    /**
     * 获取选课信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:selection:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(courseSelectionService.selectCourseSelectionById(id));
    }

    /**
     * 新增选课信息
     */
    @PreAuthorize("@ss.hasPermi('system:selection:add')")
    @Log(title = "选课信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody CourseSelection courseSelection)
    {
        return toAjax(courseSelectionService.insertCourseSelection(courseSelection));
    }

    /**
     * 修改选课信息
     */
    @PreAuthorize("@ss.hasPermi('system:selection:edit')")
    @Log(title = "选课信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody CourseSelection courseSelection)
    {
        return toAjax(courseSelectionService.updateCourseSelection(courseSelection));
    }

    /**
     * 删除选课信息
     */
    @PreAuthorize("@ss.hasPermi('system:selection:remove')")
    @Log(title = "选课信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(courseSelectionService.deleteCourseSelectionByIds(ids));
    }
}
