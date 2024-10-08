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
import com.ruoyi.dsgn.domain.DsgnFurnitureItems;
import com.ruoyi.dsgn.service.IDsgnFurnitureItemsService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 家具素材Controller
 * 
 * @author ruoyi
 * @date 2024-10-07 19:10:47
 */
@RestController
@RequestMapping("/dsgn/dsgnFurnitureItems")
public class DsgnFurnitureItemsController extends BaseController
{
    @Autowired
    private IDsgnFurnitureItemsService dsgnFurnitureItemsService;

    /**
     * 查询家具素材列表
     */
    @PreAuthorize("@ss.hasPermi('dsgn:dsgnFurnitureItems:list')")
    @GetMapping("/list")
    public TableDataInfo list(DsgnFurnitureItems dsgnFurnitureItems)
    {
        startPage();
        List<DsgnFurnitureItems> list = dsgnFurnitureItemsService.selectDsgnFurnitureItemsList(dsgnFurnitureItems);
        return getDataTable(list);
    }

    /**
     * 导出家具素材列表
     */
    @PreAuthorize("@ss.hasPermi('dsgn:dsgnFurnitureItems:export')")
    @Log(title = "家具素材", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, DsgnFurnitureItems dsgnFurnitureItems)
    {
        List<DsgnFurnitureItems> list = dsgnFurnitureItemsService.selectDsgnFurnitureItemsList(dsgnFurnitureItems);
        ExcelUtil<DsgnFurnitureItems> util = new ExcelUtil<DsgnFurnitureItems>(DsgnFurnitureItems.class);
        util.exportExcel(response, list, "家具素材数据");
    }

    /**
     * 获取家具素材详细信息
     */
    @PreAuthorize("@ss.hasPermi('dsgn:dsgnFurnitureItems:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(dsgnFurnitureItemsService.selectDsgnFurnitureItemsById(id));
    }

    /**
     * 新增家具素材
     */
    @PreAuthorize("@ss.hasPermi('dsgn:dsgnFurnitureItems:add')")
    @Log(title = "家具素材", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody DsgnFurnitureItems dsgnFurnitureItems)
    {
        return toAjax(dsgnFurnitureItemsService.insertDsgnFurnitureItems(dsgnFurnitureItems));
    }

    /**
     * 修改家具素材
     */
    @PreAuthorize("@ss.hasPermi('dsgn:dsgnFurnitureItems:edit')")
    @Log(title = "家具素材", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody DsgnFurnitureItems dsgnFurnitureItems)
    {
        return toAjax(dsgnFurnitureItemsService.updateDsgnFurnitureItems(dsgnFurnitureItems));
    }

    /**
     * 删除家具素材
     */
    @PreAuthorize("@ss.hasPermi('dsgn:dsgnFurnitureItems:remove')")
    @Log(title = "家具素材", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(dsgnFurnitureItemsService.deleteDsgnFurnitureItemsByIds(ids));
    }
}
