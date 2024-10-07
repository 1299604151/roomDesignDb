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
import com.ruoyi.dsgn.domain.DsgnDesignSchemeFurniture;
import com.ruoyi.dsgn.service.IDsgnDesignSchemeFurnitureService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 家具素材-设计方案关联Controller
 * 
 * @author ruoyi
 * @date 2024-10-07 19:10:47
 */
@RestController
@RequestMapping("/dsgn/dsgnDesignSchemeFurniture")
public class DsgnDesignSchemeFurnitureController extends BaseController
{
    @Autowired
    private IDsgnDesignSchemeFurnitureService dsgnDesignSchemeFurnitureService;

    /**
     * 查询家具素材-设计方案关联列表
     */
    @PreAuthorize("@ss.hasPermi('dsgn:dsgnDesignSchemeFurniture:list')")
    @GetMapping("/list")
    public TableDataInfo list(DsgnDesignSchemeFurniture dsgnDesignSchemeFurniture)
    {
        startPage();
        List<DsgnDesignSchemeFurniture> list = dsgnDesignSchemeFurnitureService.selectDsgnDesignSchemeFurnitureList(dsgnDesignSchemeFurniture);
        return getDataTable(list);
    }

    /**
     * 导出家具素材-设计方案关联列表
     */
    @PreAuthorize("@ss.hasPermi('dsgn:dsgnDesignSchemeFurniture:export')")
    @Log(title = "家具素材-设计方案关联", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, DsgnDesignSchemeFurniture dsgnDesignSchemeFurniture)
    {
        List<DsgnDesignSchemeFurniture> list = dsgnDesignSchemeFurnitureService.selectDsgnDesignSchemeFurnitureList(dsgnDesignSchemeFurniture);
        ExcelUtil<DsgnDesignSchemeFurniture> util = new ExcelUtil<DsgnDesignSchemeFurniture>(DsgnDesignSchemeFurniture.class);
        util.exportExcel(response, list, "家具素材-设计方案关联数据");
    }

    /**
     * 获取家具素材-设计方案关联详细信息
     */
    @PreAuthorize("@ss.hasPermi('dsgn:dsgnDesignSchemeFurniture:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(dsgnDesignSchemeFurnitureService.selectDsgnDesignSchemeFurnitureById(id));
    }

    /**
     * 新增家具素材-设计方案关联
     */
    @PreAuthorize("@ss.hasPermi('dsgn:dsgnDesignSchemeFurniture:add')")
    @Log(title = "家具素材-设计方案关联", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody DsgnDesignSchemeFurniture dsgnDesignSchemeFurniture)
    {
        return toAjax(dsgnDesignSchemeFurnitureService.insertDsgnDesignSchemeFurniture(dsgnDesignSchemeFurniture));
    }

    /**
     * 修改家具素材-设计方案关联
     */
    @PreAuthorize("@ss.hasPermi('dsgn:dsgnDesignSchemeFurniture:edit')")
    @Log(title = "家具素材-设计方案关联", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody DsgnDesignSchemeFurniture dsgnDesignSchemeFurniture)
    {
        return toAjax(dsgnDesignSchemeFurnitureService.updateDsgnDesignSchemeFurniture(dsgnDesignSchemeFurniture));
    }

    /**
     * 删除家具素材-设计方案关联
     */
    @PreAuthorize("@ss.hasPermi('dsgn:dsgnDesignSchemeFurniture:remove')")
    @Log(title = "家具素材-设计方案关联", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(dsgnDesignSchemeFurnitureService.deleteDsgnDesignSchemeFurnitureByIds(ids));
    }
}
