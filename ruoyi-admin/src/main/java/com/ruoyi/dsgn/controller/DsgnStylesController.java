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
import com.ruoyi.dsgn.domain.DsgnStyles;
import com.ruoyi.dsgn.service.IDsgnStylesService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 风格Controller
 * 
 * @author ruoyi
 * @date 2024-10-07 19:10:48
 */
@RestController
@RequestMapping("/dsgn/dsgnStyles")
public class DsgnStylesController extends BaseController
{
    @Autowired
    private IDsgnStylesService dsgnStylesService;

    /**
     * 查询风格列表
     */
    @PreAuthorize("@ss.hasPermi('dsgn:dsgnStyles:list')")
    @GetMapping("/list")
    public TableDataInfo list(DsgnStyles dsgnStyles)
    {
        startPage();
        List<DsgnStyles> list = dsgnStylesService.selectDsgnStylesList(dsgnStyles);
        return getDataTable(list);
    }

    /**
     * 导出风格列表
     */
    @PreAuthorize("@ss.hasPermi('dsgn:dsgnStyles:export')")
    @Log(title = "风格", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, DsgnStyles dsgnStyles)
    {
        List<DsgnStyles> list = dsgnStylesService.selectDsgnStylesList(dsgnStyles);
        ExcelUtil<DsgnStyles> util = new ExcelUtil<DsgnStyles>(DsgnStyles.class);
        util.exportExcel(response, list, "风格数据");
    }

    /**
     * 获取风格详细信息
     */
    @PreAuthorize("@ss.hasPermi('dsgn:dsgnStyles:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(dsgnStylesService.selectDsgnStylesById(id));
    }

    /**
     * 新增风格
     */
    @PreAuthorize("@ss.hasPermi('dsgn:dsgnStyles:add')")
    @Log(title = "风格", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody DsgnStyles dsgnStyles)
    {
        return toAjax(dsgnStylesService.insertDsgnStyles(dsgnStyles));
    }

    /**
     * 修改风格
     */
    @PreAuthorize("@ss.hasPermi('dsgn:dsgnStyles:edit')")
    @Log(title = "风格", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody DsgnStyles dsgnStyles)
    {
        return toAjax(dsgnStylesService.updateDsgnStyles(dsgnStyles));
    }

    /**
     * 删除风格
     */
    @PreAuthorize("@ss.hasPermi('dsgn:dsgnStyles:remove')")
    @Log(title = "风格", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(dsgnStylesService.deleteDsgnStylesByIds(ids));
    }
}
