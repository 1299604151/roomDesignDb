package com.ruoyi.dsgn.controller;

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
import com.ruoyi.dsgn.domain.DsgnColors;
import com.ruoyi.dsgn.service.IDsgnColorsService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 色彩Controller
 * 
 * @author ruoyi
 * @date 2024-10-07 19:10:47
 */
@RestController
@RequestMapping("/dsgn/dsgnColors")
public class DsgnColorsController extends BaseController
{
    @Autowired
    private IDsgnColorsService dsgnColorsService;

    /**
     * 查询色彩列表
     */
    @PreAuthorize("@ss.hasPermi('dsgn:dsgnColors:list')")
    @GetMapping("/list")
    public TableDataInfo list(DsgnColors dsgnColors)
    {
        startPage();
        List<DsgnColors> list = dsgnColorsService.selectDsgnColorsList(dsgnColors);
        return getDataTable(list);
    }

    /**
     * 导出色彩列表
     */
    @PreAuthorize("@ss.hasPermi('dsgn:dsgnColors:export')")
    @Log(title = "色彩", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, DsgnColors dsgnColors)
    {
        List<DsgnColors> list = dsgnColorsService.selectDsgnColorsList(dsgnColors);
        ExcelUtil<DsgnColors> util = new ExcelUtil<DsgnColors>(DsgnColors.class);
        util.exportExcel(response, list, "色彩数据");
    }

    /**
     * 获取色彩详细信息
     */
    @PreAuthorize("@ss.hasPermi('dsgn:dsgnColors:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(dsgnColorsService.selectDsgnColorsById(id));
    }

    /**
     * 新增色彩
     */
    @PreAuthorize("@ss.hasPermi('dsgn:dsgnColors:add')")
    @Log(title = "色彩", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody DsgnColors dsgnColors)
    {
        return toAjax(dsgnColorsService.insertDsgnColors(dsgnColors));
    }

    /**
     * 修改色彩
     */
    @PreAuthorize("@ss.hasPermi('dsgn:dsgnColors:edit')")
    @Log(title = "色彩", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody DsgnColors dsgnColors)
    {
        return toAjax(dsgnColorsService.updateDsgnColors(dsgnColors));
    }

    /**
     * 删除色彩
     */
    @PreAuthorize("@ss.hasPermi('dsgn:dsgnColors:remove')")
    @Log(title = "色彩", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(dsgnColorsService.deleteDsgnColorsByIds(ids));
    }
}
