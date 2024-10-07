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
import com.ruoyi.dsgn.domain.DsgnBrowsingHistory;
import com.ruoyi.dsgn.service.IDsgnBrowsingHistoryService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 用户浏览历史Controller
 * 
 * @author ruoyi
 * @date 2024-10-07 19:10:47
 */
@RestController
@RequestMapping("/dsgn/dsgnBrowsingHistory")
public class DsgnBrowsingHistoryController extends BaseController
{
    @Autowired
    private IDsgnBrowsingHistoryService dsgnBrowsingHistoryService;

    /**
     * 查询用户浏览历史列表
     */
    @PreAuthorize("@ss.hasPermi('dsgn:dsgnBrowsingHistory:list')")
    @GetMapping("/list")
    public TableDataInfo list(DsgnBrowsingHistory dsgnBrowsingHistory)
    {
        startPage();
        List<DsgnBrowsingHistory> list = dsgnBrowsingHistoryService.selectDsgnBrowsingHistoryList(dsgnBrowsingHistory);
        return getDataTable(list);
    }

    /**
     * 导出用户浏览历史列表
     */
    @PreAuthorize("@ss.hasPermi('dsgn:dsgnBrowsingHistory:export')")
    @Log(title = "用户浏览历史", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, DsgnBrowsingHistory dsgnBrowsingHistory)
    {
        List<DsgnBrowsingHistory> list = dsgnBrowsingHistoryService.selectDsgnBrowsingHistoryList(dsgnBrowsingHistory);
        ExcelUtil<DsgnBrowsingHistory> util = new ExcelUtil<DsgnBrowsingHistory>(DsgnBrowsingHistory.class);
        util.exportExcel(response, list, "用户浏览历史数据");
    }

    /**
     * 获取用户浏览历史详细信息
     */
    @PreAuthorize("@ss.hasPermi('dsgn:dsgnBrowsingHistory:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(dsgnBrowsingHistoryService.selectDsgnBrowsingHistoryById(id));
    }

    /**
     * 新增用户浏览历史
     */
    @PreAuthorize("@ss.hasPermi('dsgn:dsgnBrowsingHistory:add')")
    @Log(title = "用户浏览历史", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody DsgnBrowsingHistory dsgnBrowsingHistory)
    {
        return toAjax(dsgnBrowsingHistoryService.insertDsgnBrowsingHistory(dsgnBrowsingHistory));
    }

    /**
     * 修改用户浏览历史
     */
    @PreAuthorize("@ss.hasPermi('dsgn:dsgnBrowsingHistory:edit')")
    @Log(title = "用户浏览历史", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody DsgnBrowsingHistory dsgnBrowsingHistory)
    {
        return toAjax(dsgnBrowsingHistoryService.updateDsgnBrowsingHistory(dsgnBrowsingHistory));
    }

    /**
     * 删除用户浏览历史
     */
    @PreAuthorize("@ss.hasPermi('dsgn:dsgnBrowsingHistory:remove')")
    @Log(title = "用户浏览历史", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(dsgnBrowsingHistoryService.deleteDsgnBrowsingHistoryByIds(ids));
    }
}
