package com.ruoyi.system.service.impl;

import java.util.List;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.common.core.domain.model.LoginUser;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.system.domain.Technician;
import com.ruoyi.system.mapper.TechnicianMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.TeachingRecordMapper;
import com.ruoyi.system.domain.TeachingRecord;
import com.ruoyi.system.service.ITeachingRecordService;

/**
 * 授课信息Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-08-25
 */
@Service
public class TeachingRecordServiceImpl extends ServiceImpl<TeachingRecordMapper, TeachingRecord> implements ITeachingRecordService
{
    @Autowired
    private TeachingRecordMapper teachingRecordMapper;
    @Autowired
    private TechnicianMapper technicianMapper;
    /**
     * 查询授课信息
     * 
     * @param id 授课信息主键
     * @return 授课信息
     */
    @Override
    public TeachingRecord selectTeachingRecordById(Long id)
    {
        return teachingRecordMapper.selectTeachingRecordById(id);
    }

    /**
     * 查询授课信息列表
     * 
     * @param teachingRecord 授课信息
     * @return 授课信息
     */
    @Override
    public List<TeachingRecord> selectTeachingRecordList(TeachingRecord teachingRecord)
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
                teachingRecord.setEmployeeId(technician.getEmployeeId());
            }
        }
        return teachingRecordMapper.selectTeachingRecordList(teachingRecord);
    }

    /**
     * 新增授课信息
     * 
     * @param teachingRecord 授课信息
     * @return 结果
     */
    @Override
    public int insertTeachingRecord(TeachingRecord teachingRecord)
    {
        return teachingRecordMapper.insertTeachingRecord(teachingRecord);
    }

    /**
     * 修改授课信息
     * 
     * @param teachingRecord 授课信息
     * @return 结果
     */
    @Override
    public int updateTeachingRecord(TeachingRecord teachingRecord)
    {
        return teachingRecordMapper.updateTeachingRecord(teachingRecord);
    }

    /**
     * 批量删除授课信息
     * 
     * @param ids 需要删除的授课信息主键
     * @return 结果
     */
    @Override
    public int deleteTeachingRecordByIds(Long[] ids)
    {
        return teachingRecordMapper.deleteTeachingRecordByIds(ids);
    }

    /**
     * 删除授课信息信息
     * 
     * @param id 授课信息主键
     * @return 结果
     */
    @Override
    public int deleteTeachingRecordById(Long id)
    {
        return teachingRecordMapper.deleteTeachingRecordById(id);
    }
}
