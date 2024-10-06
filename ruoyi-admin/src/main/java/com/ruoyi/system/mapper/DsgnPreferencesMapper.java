package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.DsgnPreferences;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
/**
 * 用户偏好Mapper接口
 * 
 * @author ruoyi
 * @date 2024-10-06 16:51:18
 */
public interface DsgnPreferencesMapper extends BaseMapper<DsgnPreferences>
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
     * 删除用户偏好
     * 
     * @param id 用户偏好主键
     * @return 结果
     */
    public int deleteDsgnPreferencesById(Long id);

    /**
     * 批量删除用户偏好
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteDsgnPreferencesByIds(Long[] ids);
}
