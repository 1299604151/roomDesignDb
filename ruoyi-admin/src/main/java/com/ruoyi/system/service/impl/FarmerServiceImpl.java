package com.ruoyi.system.service.impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.common.constant.HttpStatus;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.system.domain.CourseSelection;
import com.ruoyi.system.domain.StudyGroup;
import com.ruoyi.system.mapper.CourseSelectionMapper;
import com.ruoyi.system.mapper.StudyGroupMapper;
import com.ruoyi.system.service.ISysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.FarmerMapper;
import com.ruoyi.system.domain.Farmer;
import com.ruoyi.system.service.IFarmerService;
import org.springframework.transaction.annotation.Transactional;

/**
 * 农民信息Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-08-25
 */
@Service
public class FarmerServiceImpl extends ServiceImpl<FarmerMapper,Farmer> implements IFarmerService
{
    @Autowired
    private FarmerMapper farmerMapper;
    @Autowired
    private ISysUserService userService;
    @Autowired
    private StudyGroupMapper studyGroupMapper;
    @Autowired
    private CourseSelectionMapper courseSelectionMapper;
    /**
     * 查询农民信息
     * 
     * @param id 农民信息主键
     * @return 农民信息
     */
    @Override
    public Farmer selectFarmerById(Long id)
    {
        return farmerMapper.selectFarmerById(id);
    }
    
    /**
     * 农民注册
     * */
    @Override
    public int registerFarmer(Farmer farmer)
    {
        SysUser user = new SysUser();
        // 工号
        user.setUserName(farmer.getStudentId());
        // 姓名
        user.setNickName(farmer.getName());
        // 性别 0 男 1 女
        user.setSex(farmer.getGender());
        // 部门id
        user.setDeptId(100L);
        // 密码
        user.setPassword(farmer.getPassword());
        // 角色id列表
        user.setRoleIds(new Long[]{3L});
        if (!userService.checkUserNameUnique(user))
        {
            throw new ServiceException("新增用户'" + user.getUserName() + "'失败，登录账号已存在", HttpStatus.ERROR);
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
        user.setPassword(SecurityUtils.encryptPassword(user.getPassword()));

        // 获取
        // 创建用户
        userService.insertUser(user);
        farmer.setUserId(user.getUserId());
        // 创建农户信息
        farmerMapper.insert(farmer);
        // 修改所属用户组的人数
        recount(farmer.getGroupId());
        return 1;
    }

    /**
     * 查询农民信息列表
     * 
     * @param farmer 农民信息
     * @return 农民信息
     */
    @Override
    public List<Farmer> selectFarmerList(Farmer farmer)
    {
        return farmerMapper.selectFarmerList(farmer);
    }

    /**
     * 新增农民信息
     * 
     * @param farmer 农民信息
     * @return 结果
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public int insertFarmer(Farmer farmer)
    {
        farmerMapper.insert(farmer);
        recount(farmer.getGroupId());
        return 1;
    }

    /**
     * 修改农民信息
     * 
     * @param farmer 农民信息
     * @return 结果
     */
    @Override
    public int updateFarmer(Farmer farmer)
    {
        farmerMapper.updateFarmer(farmer);
        Farmer old = this.getById(farmer.getId());
        recount(old.getGroupId());
        // 修改所属用户组的人数
        recount(farmer.getGroupId());
        return 1;
    }

    /**
     * 批量删除农民信息
     * 
     * @param ids 需要删除的农民信息主键
     * @return 结果
     */
    @Override
    public int deleteFarmerByIds(Long[] ids)
    {
        for (Long id : ids)
        {
            this.deleteFarmerById(id);
        }
        return 1;
    }

    /**
     * 删除农民信息信息
     * 
     * @param id 农民信息主键
     * @return 结果
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public int deleteFarmerById(Long id)
    {
        Farmer farmer = this.getById(id);
        // 判断用户是否关联选课
        LambdaQueryWrapper<CourseSelection> lambdaQueryWrapper = new LambdaQueryWrapper();
        if (courseSelectionMapper.selectCount(lambdaQueryWrapper.eq(CourseSelection::getStudentId, farmer.getStudentId())) > 0)
        {
            throw new ServiceException("该用户已经关联选课，无法删除", HttpStatus.ERROR);
        }

        // 删除用户
        userService.deleteUserById(farmer.getUserId());
        Farmer item =  this.getById(id);
        // 删除农民信息
        this.removeById(id);
        // 修改所属用户组的人数
        this.recount(item.getGroupId());
        return 1;
    }
    // 根据组号重新计算人数
    public void recount(Long groupId)
    {
        // 修改所属用户组的人数
        LambdaQueryWrapper<StudyGroup> lambdaQueryWrapper = new LambdaQueryWrapper();
        lambdaQueryWrapper.eq(StudyGroup::getGroupId, groupId);
        StudyGroup studyGroup = studyGroupMapper.selectOne(lambdaQueryWrapper);
        // 不存在则返回错误信息
        if (studyGroup == null)
        {
            throw new ServiceException("学习小组不存在", HttpStatus.ERROR);
        }
        // 计算人数
        Long count = farmerMapper.selectCount(new LambdaQueryWrapper<Farmer>().eq(Farmer::getGroupId, groupId));
        // 设置人数
        studyGroup.setMemberNumber(count);
        // 更新
        studyGroupMapper.updateById(studyGroup);

    }
}
