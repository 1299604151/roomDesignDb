package com.ruoyi.system.mapper;

import java.util.List;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ruoyi.system.domain.Farmer;
import com.ruoyi.system.domain.Schedule;

/**
 * 排班信息Mapper接口
 * 
 * @author ruoyi
 * @date 2024-08-25
 */
public interface ScheduleMapper extends BaseMapper<Schedule>
{
    /**
     * 查询排班信息
     * 
     * @param id 排班信息主键
     * @return 排班信息
     */
    public Schedule selectScheduleById(Long id);

    /**
     * 查询排班信息列表
     * 
     * @param schedule 排班信息
     * @return 排班信息集合
     */
    public List<Schedule> selectScheduleList(Schedule schedule);

    /**
     * 新增排班信息
     * 
     * @param schedule 排班信息
     * @return 结果
     */
    public int insertSchedule(Schedule schedule);

    /**
     * 修改排班信息
     * 
     * @param schedule 排班信息
     * @return 结果
     */
    public int updateSchedule(Schedule schedule);

    /**
     * 删除排班信息
     * 
     * @param id 排班信息主键
     * @return 结果
     */
    public int deleteScheduleById(Long id);

    /**
     * 批量删除排班信息
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteScheduleByIds(Long[] ids);
}
