package com.ruoyi.system.service.impl;

import java.util.List;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.common.core.domain.model.LoginUser;
import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.system.domain.Farmer;
import com.ruoyi.system.domain.Technician;
import com.ruoyi.system.mapper.TechnicianMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.ScheduleMapper;
import com.ruoyi.system.domain.Schedule;
import com.ruoyi.system.service.IScheduleService;

/**
 * 排班信息Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-08-25
 */
@Service
public class ScheduleServiceImpl extends ServiceImpl<ScheduleMapper, Schedule> implements IScheduleService
{
    @Autowired
    private ScheduleMapper scheduleMapper;
    @Autowired
    private TechnicianMapper technicianMapper;

    /**
     * 查询排班信息
     * 
     * @param id 排班信息主键
     * @return 排班信息
     */
    @Override
    public Schedule selectScheduleById(Long id)
    {
        return scheduleMapper.selectScheduleById(id);
    }

    /**
     * 查询排班信息列表
     * 
     * @param schedule 排班信息
     * @return 排班信息
     */
    @Override
    public List<Schedule> selectScheduleList(Schedule schedule)
    {
        // 获取当前登录用户
        LoginUser loginUser = SecurityUtils.getLoginUser();
        // 如果不是管理员
        if (!loginUser.getUser().isAdmin()) {
            // 获取技术人员
            LambdaQueryWrapper<Technician> queryWrapper = new LambdaQueryWrapper<>();
            queryWrapper.eq(Technician::getUserId, loginUser.getUser().getUserId());
            Technician technician = technicianMapper.selectOne(queryWrapper);
            // 如果技术人员存在
            if (technician != null) {
                // 设置技术人员id
                schedule.setEmployeeId(technician.getEmployeeId());
            }
        }
        return scheduleMapper.selectScheduleList(schedule);
    }

    /**
     * 新增排班信息
     * 
     * @param schedule 排班信息
     * @return 结果
     */
    @Override
    public int insertSchedule(Schedule schedule)
    {
        // 判断是否选择了技术人员
        if (StringUtils.isBlank(schedule.getEmployeeId()))
        {
            throw new ServiceException("请选择技术人员");
        }
        // 校验排班信息是否存在
        LambdaQueryWrapper<Schedule> lqw = new LambdaQueryWrapper<>();
//        lqw.eq(Schedule::getEmployeeId, schedule.getEmployeeId());
        lqw.eq(Schedule::getCourseId, schedule.getCourseId());
        Long count =  this.count(lqw);
        if (count > 0)
        {
            throw new ServiceException("排班信息已存在");
        }
        return scheduleMapper.insertSchedule(schedule);
    }

    /**
     * 修改排班信息
     * 
     * @param schedule 排班信息
     * @return 结果
     */
    @Override
    public int updateSchedule(Schedule schedule)
    {
        // 校验排班信息是否存在
        LambdaQueryWrapper<Schedule> lqw = new LambdaQueryWrapper<>();
//        lqw.eq(Schedule::getEmployeeId, schedule.getEmployeeId());
        lqw.eq(Schedule::getCourseId, schedule.getCourseId());
        lqw.ne(Schedule::getId, schedule.getId());
        Long count =  this.count(lqw);
        if (count > 0)
        {
            throw new ServiceException("排班信息已存在");
        }
        return scheduleMapper.updateSchedule(schedule);
    }

    /**
     * 批量删除排班信息
     * 
     * @param ids 需要删除的排班信息主键
     * @return 结果
     */
    @Override
    public int deleteScheduleByIds(Long[] ids)
    {
        return scheduleMapper.deleteScheduleByIds(ids);
    }

    /**
     * 删除排班信息信息
     * 
     * @param id 排班信息主键
     * @return 结果
     */
    @Override
    public int deleteScheduleById(Long id)
    {
        return scheduleMapper.deleteScheduleById(id);
    }
}
