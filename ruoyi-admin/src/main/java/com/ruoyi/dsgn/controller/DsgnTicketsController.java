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
import com.ruoyi.dsgn.domain.DsgnTickets;
import com.ruoyi.dsgn.service.IDsgnTicketsService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 工单Controller
 * 
 * @author ruoyi
 * @date 2024-10-07 19:10:48
 */
@RestController
@RequestMapping("/dsgn/dsgnTickets")
public class DsgnTicketsController extends BaseController
{
    @Autowired
    private IDsgnTicketsService dsgnTicketsService;

    /**
     * 查询工单列表
     */
    @PreAuthorize("@ss.hasPermi('dsgn:dsgnTickets:list')")
    @GetMapping("/list")
    public TableDataInfo list(DsgnTickets dsgnTickets)
    {
        startPage();
        List<DsgnTickets> list = dsgnTicketsService.selectDsgnTicketsList(dsgnTickets);
        return getDataTable(list);
    }

    /**
     * 导出工单列表
     */
    @PreAuthorize("@ss.hasPermi('dsgn:dsgnTickets:export')")
    @Log(title = "工单", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, DsgnTickets dsgnTickets)
    {
        List<DsgnTickets> list = dsgnTicketsService.selectDsgnTicketsList(dsgnTickets);
        ExcelUtil<DsgnTickets> util = new ExcelUtil<DsgnTickets>(DsgnTickets.class);
        util.exportExcel(response, list, "工单数据");
    }

    /**
     * 获取工单详细信息
     */
    @PreAuthorize("@ss.hasPermi('dsgn:dsgnTickets:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(dsgnTicketsService.selectDsgnTicketsById(id));
    }

    /**
     * 新增工单
     */
    @PreAuthorize("@ss.hasPermi('dsgn:dsgnTickets:add')")
    @Log(title = "工单", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody DsgnTickets dsgnTickets)
    {
        return toAjax(dsgnTicketsService.insertDsgnTickets(dsgnTickets));
    }

    /**
     * 修改工单
     */
    @PreAuthorize("@ss.hasPermi('dsgn:dsgnTickets:edit')")
    @Log(title = "工单", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody DsgnTickets dsgnTickets)
    {
        return toAjax(dsgnTicketsService.updateDsgnTickets(dsgnTickets));
    }

    /**
     * 删除工单
     */
    @PreAuthorize("@ss.hasPermi('dsgn:dsgnTickets:remove')")
    @Log(title = "工单", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(dsgnTicketsService.deleteDsgnTicketsByIds(ids));
    }
}
