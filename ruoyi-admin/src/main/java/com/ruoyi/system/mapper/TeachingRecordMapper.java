package com.ruoyi.system.mapper;

import java.util.List;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ruoyi.system.domain.Farmer;
import com.ruoyi.system.domain.TeachingRecord;

/**
 * 授课信息Mapper接口
 * 
 * @author ruoyi
 * @date 2024-08-25
 */
public interface TeachingRecordMapper extends BaseMapper<TeachingRecord>
{
    /**
     * 查询授课信息
     * 
     * @param id 授课信息主键
     * @return 授课信息
     */
    public TeachingRecord selectTeachingRecordById(Long id);

    /**
     * 查询授课信息列表
     * 
     * @param teachingRecord 授课信息
     * @return 授课信息集合
     */
    public List<TeachingRecord> selectTeachingRecordList(TeachingRecord teachingRecord);

    /**
     * 新增授课信息
     * 
     * @param teachingRecord 授课信息
     * @return 结果
     */
    public int insertTeachingRecord(TeachingRecord teachingRecord);

    /**
     * 修改授课信息
     * 
     * @param teachingRecord 授课信息
     * @return 结果
     */
    public int updateTeachingRecord(TeachingRecord teachingRecord);

    /**
     * 删除授课信息
     * 
     * @param id 授课信息主键
     * @return 结果
     */
    public int deleteTeachingRecordById(Long id);

    /**
     * 批量删除授课信息
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteTeachingRecordByIds(Long[] ids);
}
