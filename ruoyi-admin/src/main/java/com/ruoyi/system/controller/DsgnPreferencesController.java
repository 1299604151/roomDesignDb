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
import com.ruoyi.system.domain.DsgnPreferences;
import com.ruoyi.system.service.IDsgnPreferencesService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 用户偏好Controller
 * 
 * @author ruoyi
 * @date 2024-10-06 16:51:18
 */
@RestController
@RequestMapping("/dsgn/preferences")
public class DsgnPreferencesController extends BaseController
{
    @Autowired
    private IDsgnPreferencesService dsgnPreferencesService;

    /**
     * 查询用户偏好列表
     */
    @PreAuthorize("@ss.hasPermi('system:preferences:list')")
    @GetMapping("/list")
    public TableDataInfo list(DsgnPreferences dsgnPreferences)
    {
        startPage();
        List<DsgnPreferences> list = dsgnPreferencesService.selectDsgnPreferencesList(dsgnPreferences);
        return getDataTable(list);
    }

    /**
     * 导出用户偏好列表
     */
    @PreAuthorize("@ss.hasPermi('system:preferences:export')")
    @Log(title = "用户偏好", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, DsgnPreferences dsgnPreferences)
    {
        List<DsgnPreferences> list = dsgnPreferencesService.selectDsgnPreferencesList(dsgnPreferences);
        ExcelUtil<DsgnPreferences> util = new ExcelUtil<DsgnPreferences>(DsgnPreferences.class);
        util.exportExcel(response, list, "用户偏好数据");
    }

    /**
     * 获取用户偏好详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:preferences:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(dsgnPreferencesService.selectDsgnPreferencesById(id));
    }

    /**
     * 新增用户偏好
     */
    @PreAuthorize("@ss.hasPermi('system:preferences:add')")
    @Log(title = "用户偏好", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody DsgnPreferences dsgnPreferences)
    {
        return toAjax(dsgnPreferencesService.insertDsgnPreferences(dsgnPreferences));
    }

    /**
     * 修改用户偏好
     */
    @PreAuthorize("@ss.hasPermi('system:preferences:edit')")
    @Log(title = "用户偏好", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody DsgnPreferences dsgnPreferences)
    {
        return toAjax(dsgnPreferencesService.updateDsgnPreferences(dsgnPreferences));
    }

    /**
     * 删除用户偏好
     */
    @PreAuthorize("@ss.hasPermi('system:preferences:remove')")
    @Log(title = "用户偏好", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(dsgnPreferencesService.deleteDsgnPreferencesByIds(ids));
    }
}
