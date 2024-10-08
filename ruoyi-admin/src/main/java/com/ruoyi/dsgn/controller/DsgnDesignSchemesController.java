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
import com.ruoyi.dsgn.domain.DsgnDesignSchemes;
import com.ruoyi.dsgn.service.IDsgnDesignSchemesService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 设计方案Controller
 * 
 * @author ruoyi
 * @date 2024-10-08 10:20:31
 */
@RestController
@RequestMapping("/dsgn/dsgnDesignSchemes")
public class DsgnDesignSchemesController extends BaseController
{
    @Autowired
    private IDsgnDesignSchemesService dsgnDesignSchemesService;

    /**
     * 查询设计方案列表
     */
    @PreAuthorize("@ss.hasPermi('dsgn:dsgnDesignSchemes:list')")
    @GetMapping("/list")
    public TableDataInfo list(DsgnDesignSchemes dsgnDesignSchemes)
    {
        startPage();
        List<DsgnDesignSchemes> list = dsgnDesignSchemesService.selectDsgnDesignSchemesList(dsgnDesignSchemes);
        return getDataTable(list);
    }

    /**
     * 导出设计方案列表
     */
    @PreAuthorize("@ss.hasPermi('dsgn:dsgnDesignSchemes:export')")
    @Log(title = "设计方案", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, DsgnDesignSchemes dsgnDesignSchemes)
    {
        List<DsgnDesignSchemes> list = dsgnDesignSchemesService.selectDsgnDesignSchemesList(dsgnDesignSchemes);
        ExcelUtil<DsgnDesignSchemes> util = new ExcelUtil<DsgnDesignSchemes>(DsgnDesignSchemes.class);
        util.exportExcel(response, list, "设计方案数据");
    }

    /**
     * 获取设计方案详细信息
     */
    @PreAuthorize("@ss.hasPermi('dsgn:dsgnDesignSchemes:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(dsgnDesignSchemesService.selectDsgnDesignSchemesById(id));
    }

    /**
     * 新增设计方案
     */
    @PreAuthorize("@ss.hasPermi('dsgn:dsgnDesignSchemes:add')")
    @Log(title = "设计方案", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody DsgnDesignSchemes dsgnDesignSchemes)
    {
        return toAjax(dsgnDesignSchemesService.insertDsgnDesignSchemes(dsgnDesignSchemes));
    }

    /**
     * 修改设计方案
     */
    @PreAuthorize("@ss.hasPermi('dsgn:dsgnDesignSchemes:edit')")
    @Log(title = "设计方案", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody DsgnDesignSchemes dsgnDesignSchemes)
    {
        return toAjax(dsgnDesignSchemesService.updateDsgnDesignSchemes(dsgnDesignSchemes));
    }

    /**
     * 删除设计方案
     */
    @PreAuthorize("@ss.hasPermi('dsgn:dsgnDesignSchemes:remove')")
    @Log(title = "设计方案", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(dsgnDesignSchemesService.deleteDsgnDesignSchemesByIds(ids));
    }
}
