package com.ruoyi.dsgn.mapper;

import java.util.List;
import com.ruoyi.dsgn.domain.DsgnBrowsingHistory;

/**
 * 用户浏览历史Mapper接口
 * 
 * @author ruoyi
 * @date 2024-10-07 19:10:47
 */
public interface DsgnBrowsingHistoryMapper 
{
    /**
     * 查询用户浏览历史
     * 
     * @param id 用户浏览历史主键
     * @return 用户浏览历史
     */
    public DsgnBrowsingHistory selectDsgnBrowsingHistoryById(Long id);

    /**
     * 查询用户浏览历史列表
     * 
     * @param dsgnBrowsingHistory 用户浏览历史
     * @return 用户浏览历史集合
     */
    public List<DsgnBrowsingHistory> selectDsgnBrowsingHistoryList(DsgnBrowsingHistory dsgnBrowsingHistory);

    /**
     * 新增用户浏览历史
     * 
     * @param dsgnBrowsingHistory 用户浏览历史
     * @return 结果
     */
    public int insertDsgnBrowsingHistory(DsgnBrowsingHistory dsgnBrowsingHistory);

    /**
     * 修改用户浏览历史
     * 
     * @param dsgnBrowsingHistory 用户浏览历史
     * @return 结果
     */
    public int updateDsgnBrowsingHistory(DsgnBrowsingHistory dsgnBrowsingHistory);

    /**
     * 删除用户浏览历史
     * 
     * @param id 用户浏览历史主键
     * @return 结果
     */
    public int deleteDsgnBrowsingHistoryById(Long id);

    /**
     * 批量删除用户浏览历史
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteDsgnBrowsingHistoryByIds(Long[] ids);
}
