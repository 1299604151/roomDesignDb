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
import com.ruoyi.dsgn.domain.DsgnDesignSchemeMaterials;
import com.ruoyi.dsgn.service.IDsgnDesignSchemeMaterialsService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 设计方案-材料关联Controller
 * 
 * @author ruoyi
 * @date 2024-10-07 19:10:47
 */
@RestController
@RequestMapping("/dsgn/dsgnDesignSchemeMaterials")
public class DsgnDesignSchemeMaterialsController extends BaseController
{
    @Autowired
    private IDsgnDesignSchemeMaterialsService dsgnDesignSchemeMaterialsService;

    /**
     * 查询设计方案-材料关联列表
     */
    @PreAuthorize("@ss.hasPermi('dsgn:dsgnDesignSchemeMaterials:list')")
    @GetMapping("/list")
    public TableDataInfo list(DsgnDesignSchemeMaterials dsgnDesignSchemeMaterials)
    {
        startPage();
        List<DsgnDesignSchemeMaterials> list = dsgnDesignSchemeMaterialsService.selectDsgnDesignSchemeMaterialsList(dsgnDesignSchemeMaterials);
        return getDataTable(list);
    }

    /**
     * 导出设计方案-材料关联列表
     */
    @PreAuthorize("@ss.hasPermi('dsgn:dsgnDesignSchemeMaterials:export')")
    @Log(title = "设计方案-材料关联", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, DsgnDesignSchemeMaterials dsgnDesignSchemeMaterials)
    {
        List<DsgnDesignSchemeMaterials> list = dsgnDesignSchemeMaterialsService.selectDsgnDesignSchemeMaterialsList(dsgnDesignSchemeMaterials);
        ExcelUtil<DsgnDesignSchemeMaterials> util = new ExcelUtil<DsgnDesignSchemeMaterials>(DsgnDesignSchemeMaterials.class);
        util.exportExcel(response, list, "设计方案-材料关联数据");
    }

    /**
     * 获取设计方案-材料关联详细信息
     */
    @PreAuthorize("@ss.hasPermi('dsgn:dsgnDesignSchemeMaterials:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(dsgnDesignSchemeMaterialsService.selectDsgnDesignSchemeMaterialsById(id));
    }

    /**
     * 新增设计方案-材料关联
     */
    @PreAuthorize("@ss.hasPermi('dsgn:dsgnDesignSchemeMaterials:add')")
    @Log(title = "设计方案-材料关联", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody DsgnDesignSchemeMaterials dsgnDesignSchemeMaterials)
    {
        return toAjax(dsgnDesignSchemeMaterialsService.insertDsgnDesignSchemeMaterials(dsgnDesignSchemeMaterials));
    }

    /**
     * 修改设计方案-材料关联
     */
    @PreAuthorize("@ss.hasPermi('dsgn:dsgnDesignSchemeMaterials:edit')")
    @Log(title = "设计方案-材料关联", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody DsgnDesignSchemeMaterials dsgnDesignSchemeMaterials)
    {
        return toAjax(dsgnDesignSchemeMaterialsService.updateDsgnDesignSchemeMaterials(dsgnDesignSchemeMaterials));
    }

    /**
     * 删除设计方案-材料关联
     */
    @PreAuthorize("@ss.hasPermi('dsgn:dsgnDesignSchemeMaterials:remove')")
    @Log(title = "设计方案-材料关联", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(dsgnDesignSchemeMaterialsService.deleteDsgnDesignSchemeMaterialsByIds(ids));
    }
}
