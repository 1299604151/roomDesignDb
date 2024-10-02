package com.ruoyi.system.mapper;

import java.util.List;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ruoyi.system.domain.Farmer;
import com.ruoyi.system.domain.StudyGroup;

/**
 * 学习小组信息Mapper接口
 * 
 * @author ruoyi
 * @date 2024-08-25
 */
public interface StudyGroupMapper extends BaseMapper<StudyGroup>
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
     * 删除学习小组信息
     * 
     * @param id 学习小组信息主键
     * @return 结果
     */
    public int deleteStudyGroupById(Long id);

    /**
     * 批量删除学习小组信息
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteStudyGroupByIds(Long[] ids);
}
