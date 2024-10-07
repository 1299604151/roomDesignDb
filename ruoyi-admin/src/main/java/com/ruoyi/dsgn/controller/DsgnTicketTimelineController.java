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
import com.ruoyi.dsgn.domain.DsgnTicketTimeline;
import com.ruoyi.dsgn.service.IDsgnTicketTimelineService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 工单时间线Controller
 * 
 * @author ruoyi
 * @date 2024-10-07 19:10:48
 */
@RestController
@RequestMapping("/dsgn/dsgnTicketTimeline")
public class DsgnTicketTimelineController extends BaseController
{
    @Autowired
    private IDsgnTicketTimelineService dsgnTicketTimelineService;

    /**
     * 查询工单时间线列表
     */
    @PreAuthorize("@ss.hasPermi('dsgn:dsgnTicketTimeline:list')")
    @GetMapping("/list")
    public TableDataInfo list(DsgnTicketTimeline dsgnTicketTimeline)
    {
        startPage();
        List<DsgnTicketTimeline> list = dsgnTicketTimelineService.selectDsgnTicketTimelineList(dsgnTicketTimeline);
        return getDataTable(list);
    }

    /**
     * 导出工单时间线列表
     */
    @PreAuthorize("@ss.hasPermi('dsgn:dsgnTicketTimeline:export')")
    @Log(title = "工单时间线", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, DsgnTicketTimeline dsgnTicketTimeline)
    {
        List<DsgnTicketTimeline> list = dsgnTicketTimelineService.selectDsgnTicketTimelineList(dsgnTicketTimeline);
        ExcelUtil<DsgnTicketTimeline> util = new ExcelUtil<DsgnTicketTimeline>(DsgnTicketTimeline.class);
        util.exportExcel(response, list, "工单时间线数据");
    }

    /**
     * 获取工单时间线详细信息
     */
    @PreAuthorize("@ss.hasPermi('dsgn:dsgnTicketTimeline:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(dsgnTicketTimelineService.selectDsgnTicketTimelineById(id));
    }

    /**
     * 新增工单时间线
     */
    @PreAuthorize("@ss.hasPermi('dsgn:dsgnTicketTimeline:add')")
    @Log(title = "工单时间线", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody DsgnTicketTimeline dsgnTicketTimeline)
    {
        return toAjax(dsgnTicketTimelineService.insertDsgnTicketTimeline(dsgnTicketTimeline));
    }

    /**
     * 修改工单时间线
     */
    @PreAuthorize("@ss.hasPermi('dsgn:dsgnTicketTimeline:edit')")
    @Log(title = "工单时间线", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody DsgnTicketTimeline dsgnTicketTimeline)
    {
        return toAjax(dsgnTicketTimelineService.updateDsgnTicketTimeline(dsgnTicketTimeline));
    }

    /**
     * 删除工单时间线
     */
    @PreAuthorize("@ss.hasPermi('dsgn:dsgnTicketTimeline:remove')")
    @Log(title = "工单时间线", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(dsgnTicketTimelineService.deleteDsgnTicketTimelineByIds(ids));
    }
}
