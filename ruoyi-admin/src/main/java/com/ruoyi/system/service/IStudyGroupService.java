package com.ruoyi.system.service;

import java.util.List;

import com.baomidou.mybatisplus.extension.service.IService;
import com.ruoyi.system.domain.Farmer;
import com.ruoyi.system.domain.StudyGroup;

/**
 * 学习小组信息Service接口
 * 
 * @author ruoyi
 * @date 2024-08-25
 */
public interface IStudyGroupService extends IService<StudyGroup>
{
    /**
     * 查询学习小组信息
     * 
     * @param id 学习小组信息主键
     * @return 学习小组信息
     */
    public StudyGroup selectStudyGroupById(Long id);

    /**
     * 查询学习小组信息列表
     * 
     * @param studyGroup 学习小组信息
     * @return 学习小组信息集合
     */
    public List<StudyGroup> selectStudyGroupList(StudyGroup studyGroup);

    /**
     * 新增学习小组信息
     * 
     * @param studyGroup 学习小组信息
     * @return 结果
     */
    public int insertStudyGroup(StudyGroup studyGroup);

    /**
     * 修改学习小组信息
     * 
     * @param studyGroup 学习小组信息
     * @return 结果
     */
    public int updateStudyGroup(StudyGroup studyGroup);

    /**
     * 批量删除学习小组信息
     * 
     * @param ids 需要删除的学习小组信息主键集合
     * @return 结果
     */
    public int deleteStudyGroupByIds(Long[] ids);

    /**
     * 删除学习小组信息信息
     * 
     * @param id 学习小组信息主键
     * @return 结果
     */
    public int deleteStudyGroupById(Long id);
}
