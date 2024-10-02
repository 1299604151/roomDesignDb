package com.ruoyi.system.service.impl;

import java.util.List;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.StudyGroupMapper;
import com.ruoyi.system.domain.StudyGroup;
import com.ruoyi.system.service.IStudyGroupService;

/**
 * 学习小组信息Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-08-25
 */
@Service
public class StudyGroupServiceImpl extends ServiceImpl<StudyGroupMapper, StudyGroup> implements IStudyGroupService
{
    @Autowired
    private StudyGroupMapper studyGroupMapper;

    /**
     * 查询学习小组信息
     * 
     * @param id 学习小组信息主键
     * @return 学习小组信息
     */
    @Override
    public StudyGroup selectStudyGroupById(Long id)
    {
        return studyGroupMapper.selectStudyGroupById(id);
    }

    /**
     * 查询学习小组信息列表
     * 
     * @param studyGroup 学习小组信息
     * @return 学习小组信息
     */
    @Override
    public List<StudyGroup> selectStudyGroupList(StudyGroup studyGroup)
    {
        return studyGroupMapper.selectStudyGroupList(studyGroup);
    }

    /**
     * 新增学习小组信息
     * 
     * @param studyGroup 学习小组信息
     * @return 结果
     */
    @Override
    public int insertStudyGroup(StudyGroup studyGroup)
    {
        // 初始化数量
        studyGroup.setMemberNumber(0L);
        return studyGroupMapper.insertStudyGroup(studyGroup);
    }

    /**
     * 修改学习小组信息
     * 
     * @param studyGroup 学习小组信息
     * @return 结果
     */
    @Override
    public int updateStudyGroup(StudyGroup studyGroup)
    {
        return studyGroupMapper.updateStudyGroup(studyGroup);
    }

    /**
     * 批量删除学习小组信息
     * 
     * @param ids 需要删除的学习小组信息主键
     * @return 结果
     */
    @Override
    public int deleteStudyGroupByIds(Long[] ids)
    {
        return studyGroupMapper.deleteStudyGroupByIds(ids);
    }

    /**
     * 删除学习小组信息信息
     * 
     * @param id 学习小组信息主键
     * @return 结果
     */
    @Override
    public int deleteStudyGroupById(Long id)
    {
        return studyGroupMapper.deleteStudyGroupById(id);
    }
}
