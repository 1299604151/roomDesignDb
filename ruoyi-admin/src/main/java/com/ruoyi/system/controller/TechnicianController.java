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
import com.ruoyi.system.domain.Technician;
import com.ruoyi.system.service.ITechnicianService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 技术员信息Controller
 * 
 * @author ruoyi
 * @date 2024-08-25
 */
@RestController
@RequestMapping("/system/technician")
public class TechnicianController extends BaseController
{
    @Autowired
    private ITechnicianService technicianService;

    /**
     * 查询技术员信息列表
     */
    @PreAuthorize("@ss.hasPermi('system:technician:list')")
    @GetMapping("/list")
    public TableDataInfo list(Technician technician)
    {
        startPage();
        List<Technician> list = technicianService.selectTechnicianList(technician);
        return getDataTable(list);
    }

    /**
     * 技术员列表所有
     * */
    @GetMapping("/all")
    public TableDataInfo all()
    {
        List<Technician> list = technicianService.list();
        return getDataTable(list);
    }


    /**
     * 导出技术员信息列表
     */
    @PreAuthorize("@ss.hasPermi('system:technician:export')")
    @Log(title = "技术员信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Technician technician)
    {
        List<Technician> list = technicianService.selectTechnicianList(technician);
        ExcelUtil<Technician> util = new ExcelUtil<Technician>(Technician.class);
        util.exportExcel(response, list, "技术员信息数据");
    }

    /**
     * 获取技术员信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:technician:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(technicianService.selectTechnicianById(id));
    }


    /**
     * 技术员注册
     * */
    @PostMapping("/register")
    public AjaxResult register(@RequestBody Technician technician)
    {
        return toAjax(technicianService.registerTechnician(technician));
    }
    /**
     * 新增技术员信息
     */
    @PreAuthorize("@ss.hasPermi('system:technician:add')")
    @Log(title = "技术员信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Technician technician)
    {
        return toAjax(technicianService.registerTechnician(technician));
    }

    /**
     * 修改技术员信息
     */
    @PreAuthorize("@ss.hasPermi('system:technician:edit')")
    @Log(title = "技术员信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Technician technician)
    {
        return toAjax(technicianService.updateTechnician(technician));
    }

    /**
     * 删除技术员信息
     */
    @PreAuthorize("@ss.hasPermi('system:technician:remove')")
    @Log(title = "技术员信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(technicianService.deleteTechnicianByIds(ids));
    }
}
