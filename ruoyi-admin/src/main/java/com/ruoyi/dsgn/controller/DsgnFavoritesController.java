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
import com.ruoyi.dsgn.domain.DsgnFavorites;
import com.ruoyi.dsgn.service.IDsgnFavoritesService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 用户收藏Controller
 * 
 * @author ruoyi
 * @date 2024-10-07 19:10:47
 */
@RestController
@RequestMapping("/dsgn/dsgnFavorites")
public class DsgnFavoritesController extends BaseController
{
    @Autowired
    private IDsgnFavoritesService dsgnFavoritesService;

    /**
     * 查询用户收藏列表
     */
    @PreAuthorize("@ss.hasPermi('dsgn:dsgnFavorites:list')")
    @GetMapping("/list")
    public TableDataInfo list(DsgnFavorites dsgnFavorites)
    {
        startPage();
        List<DsgnFavorites> list = dsgnFavoritesService.selectDsgnFavoritesList(dsgnFavorites);
        return getDataTable(list);
    }

    /**
     * 导出用户收藏列表
     */
    @PreAuthorize("@ss.hasPermi('dsgn:dsgnFavorites:export')")
    @Log(title = "用户收藏", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, DsgnFavorites dsgnFavorites)
    {
        List<DsgnFavorites> list = dsgnFavoritesService.selectDsgnFavoritesList(dsgnFavorites);
        ExcelUtil<DsgnFavorites> util = new ExcelUtil<DsgnFavorites>(DsgnFavorites.class);
        util.exportExcel(response, list, "用户收藏数据");
    }

    /**
     * 获取用户收藏详细信息
     */
    @PreAuthorize("@ss.hasPermi('dsgn:dsgnFavorites:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(dsgnFavoritesService.selectDsgnFavoritesById(id));
    }

    /**
     * 新增用户收藏
     */
    @PreAuthorize("@ss.hasPermi('dsgn:dsgnFavorites:add')")
    @Log(title = "用户收藏", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody DsgnFavorites dsgnFavorites)
    {
        return toAjax(dsgnFavoritesService.insertDsgnFavorites(dsgnFavorites));
    }

    /**
     * 修改用户收藏
     */
    @PreAuthorize("@ss.hasPermi('dsgn:dsgnFavorites:edit')")
    @Log(title = "用户收藏", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody DsgnFavorites dsgnFavorites)
    {
        return toAjax(dsgnFavoritesService.updateDsgnFavorites(dsgnFavorites));
    }

    /**
     * 删除用户收藏
     */
    @PreAuthorize("@ss.hasPermi('dsgn:dsgnFavorites:remove')")
    @Log(title = "用户收藏", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(dsgnFavoritesService.deleteDsgnFavoritesByIds(ids));
    }
}
