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
import com.ruoyi.dsgn.domain.DsgnIncomeRecords;
import com.ruoyi.dsgn.service.IDsgnIncomeRecordsService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 收入记录Controller
 * 
 * @author ruoyi
 * @date 2024-10-07 19:10:47
 */
@RestController
@RequestMapping("/dsgn/dsgnIncomeRecords")
public class DsgnIncomeRecordsController extends BaseController
{
    @Autowired
    private IDsgnIncomeRecordsService dsgnIncomeRecordsService;

    /**
     * 查询收入记录列表
     */
    @PreAuthorize("@ss.hasPermi('dsgn:dsgnIncomeRecords:list')")
    @GetMapping("/list")
    public TableDataInfo list(DsgnIncomeRecords dsgnIncomeRecords)
    {
        startPage();
        List<DsgnIncomeRecords> list = dsgnIncomeRecordsService.selectDsgnIncomeRecordsList(dsgnIncomeRecords);
        return getDataTable(list);
    }

    /**
     * 导出收入记录列表
     */
    @PreAuthorize("@ss.hasPermi('dsgn:dsgnIncomeRecords:export')")
    @Log(title = "收入记录", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, DsgnIncomeRecords dsgnIncomeRecords)
    {
        List<DsgnIncomeRecords> list = dsgnIncomeRecordsService.selectDsgnIncomeRecordsList(dsgnIncomeRecords);
        ExcelUtil<DsgnIncomeRecords> util = new ExcelUtil<DsgnIncomeRecords>(DsgnIncomeRecords.class);
        util.exportExcel(response, list, "收入记录数据");
    }

    /**
     * 获取收入记录详细信息
     */
    @PreAuthorize("@ss.hasPermi('dsgn:dsgnIncomeRecords:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(dsgnIncomeRecordsService.selectDsgnIncomeRecordsById(id));
    }

    /**
     * 新增收入记录
     */
    @PreAuthorize("@ss.hasPermi('dsgn:dsgnIncomeRecords:add')")
    @Log(title = "收入记录", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody DsgnIncomeRecords dsgnIncomeRecords)
    {
        return toAjax(dsgnIncomeRecordsService.insertDsgnIncomeRecords(dsgnIncomeRecords));
    }

    /**
     * 修改收入记录
     */
    @PreAuthorize("@ss.hasPermi('dsgn:dsgnIncomeRecords:edit')")
    @Log(title = "收入记录", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody DsgnIncomeRecords dsgnIncomeRecords)
    {
        return toAjax(dsgnIncomeRecordsService.updateDsgnIncomeRecords(dsgnIncomeRecords));
    }

    /**
     * 删除收入记录
     */
    @PreAuthorize("@ss.hasPermi('dsgn:dsgnIncomeRecords:remove')")
    @Log(title = "收入记录", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(dsgnIncomeRecordsService.deleteDsgnIncomeRecordsByIds(ids));
    }
}
