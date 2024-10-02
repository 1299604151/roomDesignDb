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
import com.ruoyi.system.domain.Farmer;
import com.ruoyi.system.service.IFarmerService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 农民信息Controller
 * 
 * @author ruoyi
 * @date 2024-08-25
 */
@RestController
@RequestMapping("/system/farmer")
public class FarmerController extends BaseController
{
    @Autowired
    private IFarmerService farmerService;

    /**
     * 查询农民信息列表
     */
    @PreAuthorize("@ss.hasPermi('system:farmer:list')")
    @GetMapping("/list")
    public TableDataInfo list(Farmer farmer)
    {
        startPage();
        List<Farmer> list = farmerService.selectFarmerList(farmer);
        return getDataTable(list);
    }

    /**
     * 导出农民信息列表
     */
    @PreAuthorize("@ss.hasPermi('system:farmer:export')")
    @Log(title = "农民信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Farmer farmer)
    {
        List<Farmer> list = farmerService.selectFarmerList(farmer);
        ExcelUtil<Farmer> util = new ExcelUtil<Farmer>(Farmer.class);
        util.exportExcel(response, list, "农民信息数据");
    }

    /**
     * 获取农民信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:farmer:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(farmerService.selectFarmerById(id));
    }

    /**
     * 新增农民信息
     */
    @PreAuthorize("@ss.hasPermi('system:farmer:add')")
    @Log(title = "农民信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Farmer farmer)
    {
        return toAjax(farmerService.registerFarmer(farmer));
    }



    /**
     * 农户注册
     * */
    @PostMapping("/register")
    public AjaxResult register(@RequestBody Farmer farmer)
    {
        return toAjax(farmerService.registerFarmer(farmer));
    }
    /**
     * 修改农民信息
     */
    @PreAuthorize("@ss.hasPermi('system:farmer:edit')")
    @Log(title = "农民信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Farmer farmer)
    {
        return toAjax(farmerService.updateFarmer(farmer));
    }

    /**
     * 删除农民信息
     */
    @PreAuthorize("@ss.hasPermi('system:farmer:remove')")
    @Log(title = "农民信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(farmerService.deleteFarmerByIds(ids));
    }
}
