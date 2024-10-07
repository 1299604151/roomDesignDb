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
import com.ruoyi.dsgn.domain.DsgnMaterials;
import com.ruoyi.dsgn.service.IDsgnMaterialsService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 材料Controller
 * 
 * @author ruoyi
 * @date 2024-10-07 19:10:47
 */
@RestController
@RequestMapping("/dsgn/dsgnMaterials")
public class DsgnMaterialsController extends BaseController
{
    @Autowired
    private IDsgnMaterialsService dsgnMaterialsService;

    /**
     * 查询材料列表
     */
    @PreAuthorize("@ss.hasPermi('dsgn:dsgnMaterials:list')")
    @GetMapping("/list")
    public TableDataInfo list(DsgnMaterials dsgnMaterials)
    {
        startPage();
        List<DsgnMaterials> list = dsgnMaterialsService.selectDsgnMaterialsList(dsgnMaterials);
        return getDataTable(list);
    }

    /**
     * 导出材料列表
     */
    @PreAuthorize("@ss.hasPermi('dsgn:dsgnMaterials:export')")
    @Log(title = "材料", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, DsgnMaterials dsgnMaterials)
    {
        List<DsgnMaterials> list = dsgnMaterialsService.selectDsgnMaterialsList(dsgnMaterials);
        ExcelUtil<DsgnMaterials> util = new ExcelUtil<DsgnMaterials>(DsgnMaterials.class);
        util.exportExcel(response, list, "材料数据");
    }

    /**
     * 获取材料详细信息
     */
    @PreAuthorize("@ss.hasPermi('dsgn:dsgnMaterials:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(dsgnMaterialsService.selectDsgnMaterialsById(id));
    }

    /**
     * 新增材料
     */
    @PreAuthorize("@ss.hasPermi('dsgn:dsgnMaterials:add')")
    @Log(title = "材料", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody DsgnMaterials dsgnMaterials)
    {
        return toAjax(dsgnMaterialsService.insertDsgnMaterials(dsgnMaterials));
    }

    /**
     * 修改材料
     */
    @PreAuthorize("@ss.hasPermi('dsgn:dsgnMaterials:edit')")
    @Log(title = "材料", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody DsgnMaterials dsgnMaterials)
    {
        return toAjax(dsgnMaterialsService.updateDsgnMaterials(dsgnMaterials));
    }

    /**
     * 删除材料
     */
    @PreAuthorize("@ss.hasPermi('dsgn:dsgnMaterials:remove')")
    @Log(title = "材料", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(dsgnMaterialsService.deleteDsgnMaterialsByIds(ids));
    }
}
