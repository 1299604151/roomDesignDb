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
import com.ruoyi.system.domain.DsgnDesignSchemeColors;
import com.ruoyi.system.service.IDsgnDesignSchemeColorsService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 设计方案-色彩关联Controller
 * 
 * @author ruoyi
 * @date 2024-10-06 16:51:17
 */
@RestController
@RequestMapping("/dsgn/scheme/colors")
public class DsgnDesignSchemeColorsController extends BaseController
{
    @Autowired
    private IDsgnDesignSchemeColorsService dsgnDesignSchemeColorsService;

    /**
     * 查询设计方案-色彩关联列表
     */
    @PreAuthorize("@ss.hasPermi('system:colors:list')")
    @GetMapping("/list")
    public TableDataInfo list(DsgnDesignSchemeColors dsgnDesignSchemeColors)
    {
        startPage();
        List<DsgnDesignSchemeColors> list = dsgnDesignSchemeColorsService.selectDsgnDesignSchemeColorsList(dsgnDesignSchemeColors);
        return getDataTable(list);
    }

    /**
     * 导出设计方案-色彩关联列表
     */
    @PreAuthorize("@ss.hasPermi('system:colors:export')")
    @Log(title = "设计方案-色彩关联", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, DsgnDesignSchemeColors dsgnDesignSchemeColors)
    {
        List<DsgnDesignSchemeColors> list = dsgnDesignSchemeColorsService.selectDsgnDesignSchemeColorsList(dsgnDesignSchemeColors);
        ExcelUtil<DsgnDesignSchemeColors> util = new ExcelUtil<DsgnDesignSchemeColors>(DsgnDesignSchemeColors.class);
        util.exportExcel(response, list, "设计方案-色彩关联数据");
    }

    /**
     * 获取设计方案-色彩关联详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:colors:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(dsgnDesignSchemeColorsService.selectDsgnDesignSchemeColorsById(id));
    }

    /**
     * 新增设计方案-色彩关联
     */
    @PreAuthorize("@ss.hasPermi('system:colors:add')")
    @Log(title = "设计方案-色彩关联", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody DsgnDesignSchemeColors dsgnDesignSchemeColors)
    {
        return toAjax(dsgnDesignSchemeColorsService.insertDsgnDesignSchemeColors(dsgnDesignSchemeColors));
    }

    /**
     * 修改设计方案-色彩关联
     */
    @PreAuthorize("@ss.hasPermi('system:colors:edit')")
    @Log(title = "设计方案-色彩关联", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody DsgnDesignSchemeColors dsgnDesignSchemeColors)
    {
        return toAjax(dsgnDesignSchemeColorsService.updateDsgnDesignSchemeColors(dsgnDesignSchemeColors));
    }

    /**
     * 删除设计方案-色彩关联
     */
    @PreAuthorize("@ss.hasPermi('system:colors:remove')")
    @Log(title = "设计方案-色彩关联", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(dsgnDesignSchemeColorsService.deleteDsgnDesignSchemeColorsByIds(ids));
    }
}
