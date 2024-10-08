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
import com.ruoyi.dsgn.domain.DsgnOrders;
import com.ruoyi.dsgn.service.IDsgnOrdersService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 订单Controller
 * 
 * @author ruoyi
 * @date 2024-10-07 19:10:47
 */
@RestController
@RequestMapping("/dsgn/dsgnOrders")
public class DsgnOrdersController extends BaseController
{
    @Autowired
    private IDsgnOrdersService dsgnOrdersService;

    /**
     * 查询订单列表
     */
    @PreAuthorize("@ss.hasPermi('dsgn:dsgnOrders:list')")
    @GetMapping("/list")
    public TableDataInfo list(DsgnOrders dsgnOrders)
    {
        startPage();
        List<DsgnOrders> list = dsgnOrdersService.selectDsgnOrdersList(dsgnOrders);
        return getDataTable(list);
    }

    /**
     * 导出订单列表
     */
    @PreAuthorize("@ss.hasPermi('dsgn:dsgnOrders:export')")
    @Log(title = "订单", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, DsgnOrders dsgnOrders)
    {
        List<DsgnOrders> list = dsgnOrdersService.selectDsgnOrdersList(dsgnOrders);
        ExcelUtil<DsgnOrders> util = new ExcelUtil<DsgnOrders>(DsgnOrders.class);
        util.exportExcel(response, list, "订单数据");
    }

    /**
     * 获取订单详细信息
     */
    @PreAuthorize("@ss.hasPermi('dsgn:dsgnOrders:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(dsgnOrdersService.selectDsgnOrdersById(id));
    }

    /**
     * 新增订单
     */
    @PreAuthorize("@ss.hasPermi('dsgn:dsgnOrders:add')")
    @Log(title = "订单", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody DsgnOrders dsgnOrders)
    {
        return toAjax(dsgnOrdersService.insertDsgnOrders(dsgnOrders));
    }

    /**
     * 修改订单
     */
    @PreAuthorize("@ss.hasPermi('dsgn:dsgnOrders:edit')")
    @Log(title = "订单", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody DsgnOrders dsgnOrders)
    {
        return toAjax(dsgnOrdersService.updateDsgnOrders(dsgnOrders));
    }

    /**
     * 删除订单
     */
    @PreAuthorize("@ss.hasPermi('dsgn:dsgnOrders:remove')")
    @Log(title = "订单", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(dsgnOrdersService.deleteDsgnOrdersByIds(ids));
    }
}
