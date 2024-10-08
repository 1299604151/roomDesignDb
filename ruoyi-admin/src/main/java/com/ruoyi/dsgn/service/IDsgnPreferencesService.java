package com.ruoyi.dsgn.service;

import java.util.List;

import com.baomidou.mybatisplus.extension.service.IService;
import com.ruoyi.dsgn.domain.DsgnPreferences;

/**
 * 用户偏好Service接口
 * 
 * @author ruoyi
 * @date 2024-10-07 19:10:48
 */
public interface IDsgnPreferencesService extends IService<DsgnPreferences>
{
    /**
     * 查询用户偏好
     * 
     * @param id 用户偏好主键
     * @return 用户偏好
     */
    public DsgnPreferences selectDsgnPreferencesById(Long id);

    /**
     * 查询用户偏好列表
     * 
     * @param dsgnPreferences 用户偏好
     * @return 用户偏好集合
     */
    public List<DsgnPreferences> selectDsgnPreferencesList(DsgnPreferences dsgnPreferences);

    /**
     * 新增用户偏好
     * 
     * @param dsgnPreferences 用户偏好
     * @return 结果
     */
    public int insertDsgnPreferences(DsgnPreferences dsgnPreferences);

    /**
     * 修改用户偏好
     * 
     * @param dsgnPreferences 用户偏好
     * @return 结果
     */
    public int updateDsgnPreferences(DsgnPreferences dsgnPreferences);

    /**
     * 批量删除用户偏好
     * 
     * @param ids 需要删除的用户偏好主键集合
     * @return 结果
     */
    public int deleteDsgnPreferencesByIds(Long[] ids);

    /**
     * 删除用户偏好信息
     * 
     * @param id 用户偏好主键
     * @return 结果
     */
    public int deleteDsgnPreferencesById(Long id);
}
