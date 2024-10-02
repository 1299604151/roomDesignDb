package com.ruoyi.system.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.ruoyi.system.domain.Farmer;
import com.ruoyi.system.mapper.FarmerMapper;
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
import com.ruoyi.system.domain.StudyGroup;
import com.ruoyi.system.service.IStudyGroupService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 学习小组信息Controller
 * 
 * @author ruoyi
 * @date 2024-08-25
 */
@RestController
@RequestMapping("/system/group")
public class StudyGroupController extends BaseController
{
    @Autowired
    private IStudyGroupService studyGroupService;
    @Autowired
    private FarmerMapper farmerMapper;

    /**
     * 查询学习小组信息列表
     */
    @PreAuthorize("@ss.hasPermi('system:group:list')")
    @GetMapping("/list")
    public TableDataInfo list(StudyGroup studyGroup)
    {
        startPage();
        List<StudyGroup> list = studyGroupService.selectStudyGroupList(studyGroup);
        return getDataTable(list);
    }

    /**
     * 导出学习小组信息列表
     */
    @PreAuthorize("@ss.hasPermi('system:group:export')")
    @Log(title = "学习小组信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, StudyGroup studyGroup)
    {
        List<StudyGroup> list = studyGroupService.selectStudyGroupList(studyGroup);
        ExcelUtil<StudyGroup> util = new ExcelUtil<StudyGroup>(StudyGroup.class);
        util.exportExcel(response, list, "学习小组信息数据");
    }

    /*
    * 小组信息列表
    * 对外开放
    * */
    @GetMapping("/listAll")
    public TableDataInfo listAll()
    {

        List<StudyGroup> list = studyGroupService.list();
        return getDataTable(list);
    }

    /**
     * 获取学习小组信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:group:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(studyGroupService.selectStudyGroupById(id));
    }

    /**
     * 新增学习小组信息
     */
    @PreAuthorize("@ss.hasPermi('system:group:add')")
    @Log(title = "学习小组信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody StudyGroup studyGroup)
    {
        // 判断组号是否重复
        LambdaQueryWrapper<StudyGroup> lambdaQueryWrapper = new LambdaQueryWrapper();
        lambdaQueryWrapper.eq(StudyGroup::getGroupId, studyGroup.getGroupId());
        Long count = studyGroupService.count(lambdaQueryWrapper);
        if (count > 0) {
            return error("组号已存在");
        }
        return toAjax(studyGroupService.insertStudyGroup(studyGroup));
    }

    /**
     * 修改学习小组信息
     */
    @PreAuthorize("@ss.hasPermi('system:group:edit')")
    @Log(title = "学习小组信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody StudyGroup studyGroup)
    {
        // 不能修改组号
        StudyGroup one = studyGroupService.getById(studyGroup.getId());
        if (!one.getGroupId().equals(studyGroup.getGroupId())) {
            return error("组号不能修改");
        }
        // 判断组号是否重复
        LambdaQueryWrapper<StudyGroup> lambdaQueryWrapper = new LambdaQueryWrapper();
        lambdaQueryWrapper.eq(StudyGroup::getGroupId, studyGroup.getGroupId());
        lambdaQueryWrapper.ne(StudyGroup::getId, studyGroup.getId());
        Long count = studyGroupService.count(lambdaQueryWrapper);
        if (count > 0) {
            return error("组号已存在");
        }
        return toAjax(studyGroupService.updateStudyGroup(studyGroup));
    }

    /**
     * 删除学习小组信息
     */
    @PreAuthorize("@ss.hasPermi('system:group:remove')")
    @Log(title = "学习小组信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        // 判断是否有农户信息关联
        LambdaQueryWrapper<Farmer> lambdaQueryWrapper = new LambdaQueryWrapper();
        lambdaQueryWrapper.in(Farmer::getGroupId, ids);
        Long count = farmerMapper.selectCount(lambdaQueryWrapper);
        if (count > 0) {
            return error("存在关联农户信息,不允许删除");
        }
        return toAjax(studyGroupService.deleteStudyGroupByIds(ids));
    }
}
