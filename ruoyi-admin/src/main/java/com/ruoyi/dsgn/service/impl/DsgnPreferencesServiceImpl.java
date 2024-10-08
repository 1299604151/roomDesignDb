package com.ruoyi.dsgn.service.impl;

import java.util.List;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.dsgn.mapper.DsgnPreferencesMapper;
import com.ruoyi.dsgn.domain.DsgnPreferences;
import com.ruoyi.dsgn.service.IDsgnPreferencesService;

/**
 * 用户偏好Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-10-07 19:10:48
 */
@Service
public class DsgnPreferencesServiceImpl extends ServiceImpl<DsgnPreferencesMapper, DsgnPreferences> implements IDsgnPreferencesService
{
    @Autowired
    private DsgnPreferencesMapper dsgnPreferencesMapper;

    /**
     * 查询用户偏好
     * 
     * @param id 用户偏好主键
     * @return 用户偏好
     */
    @Override
    public DsgnPreferences selectDsgnPreferencesById(Long id)
    {
        return dsgnPreferencesMapper.selectDsgnPreferencesById(id);
    }

    /**
     * 查询用户偏好列表
     * 
     * @param dsgnPreferences 用户偏好
     * @return 用户偏好
     */
    @Override
    public List<DsgnPreferences> selectDsgnPreferencesList(DsgnPreferences dsgnPreferences)
    {
        return dsgnPreferencesMapper.selectDsgnPreferencesList(dsgnPreferences);
    }

    /**
     * 新增用户偏好
     * 
     * @param dsgnPreferences 用户偏好
     * @return 结果
     */
    @Override
    public int insertDsgnPreferences(DsgnPreferences dsgnPreferences)
    {
        return dsgnPreferencesMapper.insertDsgnPreferences(dsgnPreferences);
    }

    /**
     * 修改用户偏好
     * 
     * @param dsgnPreferences 用户偏好
     * @return 结果
     */
    @Override
    public int updateDsgnPreferences(DsgnPreferences dsgnPreferences)
    {
        return dsgnPreferencesMapper.updateDsgnPreferences(dsgnPreferences);
    }

    /**
     * 批量删除用户偏好
     * 
     * @param ids 需要删除的用户偏好主键
     * @return 结果
     */
    @Override
    public int deleteDsgnPreferencesByIds(Long[] ids)
    {
        return dsgnPreferencesMapper.deleteDsgnPreferencesByIds(ids);
    }

    /**
     * 删除用户偏好信息
     * 
     * @param id 用户偏好主键
     * @return 结果
     */
    @Override
    public int deleteDsgnPreferencesById(Long id)
    {
        return dsgnPreferencesMapper.deleteDsgnPreferencesById(id);
    }
}
