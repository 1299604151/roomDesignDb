package com.ruoyi.system.service.impl;

import java.util.List;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.common.constant.HttpStatus;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.system.domain.CourseSelection;
import com.ruoyi.system.domain.Schedule;
import com.ruoyi.system.mapper.CourseMapper;
import com.ruoyi.system.mapper.CourseSelectionMapper;
import com.ruoyi.system.mapper.ScheduleMapper;
import com.ruoyi.system.service.ISysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.TechnicianMapper;
import com.ruoyi.system.domain.Technician;
import com.ruoyi.system.service.ITechnicianService;
import org.springframework.transaction.annotation.Transactional;

/**
 * 技术员信息Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-08-25
 */
@Service
public class TechnicianServiceImpl extends ServiceImpl<TechnicianMapper, Technician> implements ITechnicianService
{
    @Autowired
    private TechnicianMapper technicianMapper;
    @Autowired
    private ISysUserService userService;
    @Autowired
    private CourseSelectionMapper courseSelectionMapper;
    @Autowired
    private ScheduleMapper scheduleMapper;
    /**
     * 查询技术员信息
     * 
     * @param id 技术员信息主键
     * @return 技术员信息
     */
    @Override
    public Technician selectTechnicianById(Long id)
    {
        return technicianMapper.selectTechnicianById(id);
    }

    /**
     * 技术员注册
     * */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public int registerTechnician(Technician technician)
    {
        SysUser user = new SysUser();
        // 工号
        user.setUserName(technician.getEmployeeId());
        // 姓名
        user.setNickName(technician.getName());
        // 性别 0 男 1 女
        user.setSex(technician.getGender());
        // 部门id
        user.setDeptId(100L);
        // 密码  加密原始密码
        user.setPassword(SecurityUtils.encryptPassword(technician.getPassword()));
        // 角色id列表
        user.setRoleIds(new Long[]{4L});
        if (!userService.checkUserNameUnique(user))
        {
            throw new ServiceException("新增用户'" + user.getUserName() + "'失败，登录账号已存在",HttpStatus.ERROR);
        }
        else if (StringUtils.isNotEmpty(user.getPhonenumber()) && !userService.checkPhoneUnique(user))
        {
            throw new ServiceException("新增用户'" + user.getUserName() + "'失败，手机号码已存在",HttpStatus.ERROR);

        }
        else if (StringUtils.isNotEmpty(user.getEmail()) && !userService.checkEmailUnique(user))
        {
            throw new ServiceException("新增用户'" + user.getUserName() + "'失败，邮箱账号已存在",HttpStatus.ERROR);
        }
        user.setCreateBy("admin");
//        user.setPassword(SecurityUtils.encryptPassword(user.getPassword()));

        // 创建用户
        userService.insertUser(user);
        technician.setUserId(user.getUserId());
        // 创建技术员信息
        technicianMapper.insert(technician);
        return 1;
    }

    /**
     * 查询技术员信息列表
     * 
     * @param technician 技术员信息
     * @return 技术员信息
     */
    @Override
    public List<Technician> selectTechnicianList(Technician technician)
    {
        return technicianMapper.selectTechnicianList(technician);
    }

    /**
     * 新增技术员信息
     * 
     * @param technician 技术员信息
     * @return 结果
     */
    @Override
    public int insertTechnician(Technician technician)
    {
        return technicianMapper.insertTechnician(technician);
    }

    /**
     * 修改技术员信息
     * 
     * @param technician 技术员信息
     * @return 结果
     */
    @Override
    public int updateTechnician(Technician technician)
    {
        // 工号不能修改 todo
        Technician one = technicianMapper.selectById(technician.getId());
        if (!one.getEmployeeId().equals(technician.getEmployeeId())) {
            throw new ServiceException("工号不能修改", HttpStatus.ERROR);
        }
        return technicianMapper.updateTechnician(technician);
    }

    /**
     * 批量删除技术员信息
     * 
     * @param ids 需要删除的技术员信息主键
     * @return 结果
     */
    @Override
    public int deleteTechnicianByIds(Long[] ids)
    {
        // 循环删除
        for (Long id : ids) {
            deleteTechnicianById(id);
        }
        return 1;
    }

    /**
     * 删除技术员信息信息
     * 
     * @param id 技术员信息主键
     * @return 结果
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public int deleteTechnicianById(Long id)
    {
        // 根据id获取技术员信息
        Technician technician = technicianMapper.selectById(id);
        // 查询排班信息
        LambdaQueryWrapper<Schedule> lambdaQueryWrapper1 = new LambdaQueryWrapper();
        lambdaQueryWrapper1.eq(Schedule::getEmployeeId,technician.getEmployeeId());
        List<Schedule> scheduleList = scheduleMapper.selectList(lambdaQueryWrapper1);
        if (scheduleList.size() > 0) {
            throw new ServiceException("该技术员存在排班信息，无法删除",HttpStatus.ERROR);
        }
        // 删除用户
        userService.deleteUserById(technicianMapper.selectById(id).getUserId());
        // 删除技术员信息
        return technicianMapper.deleteTechnicianById(id);
    }
}
