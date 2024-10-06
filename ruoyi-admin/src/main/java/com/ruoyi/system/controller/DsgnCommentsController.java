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
import com.ruoyi.system.domain.DsgnComments;
import com.ruoyi.system.service.IDsgnCommentsService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 用户评论Controller
 * 
 * @author ruoyi
 * @date 2024-10-06 16:51:17
 */
@RestController
@RequestMapping("/dsgn/comments")
public class DsgnCommentsController extends BaseController
{
    @Autowired
    private IDsgnCommentsService dsgnCommentsService;

    /**
     * 查询用户评论列表
     */
    @PreAuthorize("@ss.hasPermi('system:comments:list')")
    @GetMapping("/list")
    public TableDataInfo list(DsgnComments dsgnComments)
    {
        startPage();
        List<DsgnComments> list = dsgnCommentsService.selectDsgnCommentsList(dsgnComments);
        return getDataTable(list);
    }

    /**
     * 导出用户评论列表
     */
    @PreAuthorize("@ss.hasPermi('system:comments:export')")
    @Log(title = "用户评论", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, DsgnComments dsgnComments)
    {
        List<DsgnComments> list = dsgnCommentsService.selectDsgnCommentsList(dsgnComments);
        ExcelUtil<DsgnComments> util = new ExcelUtil<DsgnComments>(DsgnComments.class);
        util.exportExcel(response, list, "用户评论数据");
    }

    /**
     * 获取用户评论详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:comments:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(dsgnCommentsService.selectDsgnCommentsById(id));
    }

    /**
     * 新增用户评论
     */
    @PreAuthorize("@ss.hasPermi('system:comments:add')")
    @Log(title = "用户评论", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody DsgnComments dsgnComments)
    {
        return toAjax(dsgnCommentsService.insertDsgnComments(dsgnComments));
    }

    /**
     * 修改用户评论
     */
    @PreAuthorize("@ss.hasPermi('system:comments:edit')")
    @Log(title = "用户评论", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody DsgnComments dsgnComments)
    {
        return toAjax(dsgnCommentsService.updateDsgnComments(dsgnComments));
    }

    /**
     * 删除用户评论
     */
    @PreAuthorize("@ss.hasPermi('system:comments:remove')")
    @Log(title = "用户评论", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(dsgnCommentsService.deleteDsgnCommentsByIds(ids));
    }
}
