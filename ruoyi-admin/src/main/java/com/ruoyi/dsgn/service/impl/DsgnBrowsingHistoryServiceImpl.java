package com.ruoyi.dsgn.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.dsgn.mapper.DsgnBrowsingHistoryMapper;
import com.ruoyi.dsgn.domain.DsgnBrowsingHistory;
import com.ruoyi.dsgn.service.IDsgnBrowsingHistoryService;

/**
 * 用户浏览历史Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-10-07 19:10:47
 */
@Service
public class DsgnBrowsingHistoryServiceImpl implements IDsgnBrowsingHistoryService 
{
    @Autowired
    private DsgnBrowsingHistoryMapper dsgnBrowsingHistoryMapper;

    /**
     * 查询用户浏览历史
     * 
     * @param id 用户浏览历史主键
     * @return 用户浏览历史
     */
    @Override
    public DsgnBrowsingHistory selectDsgnBrowsingHistoryById(Long id)
    {
        return dsgnBrowsingHistoryMapper.selectDsgnBrowsingHistoryById(id);
    }

    /**
     * 查询用户浏览历史列表
     * 
     * @param dsgnBrowsingHistory 用户浏览历史
     * @return 用户浏览历史
     */
    @Override
    public List<DsgnBrowsingHistory> selectDsgnBrowsingHistoryList(DsgnBrowsingHistory dsgnBrowsingHistory)
    {
        return dsgnBrowsingHistoryMapper.selectDsgnBrowsingHistoryList(dsgnBrowsingHistory);
    }

    /**
     * 新增用户浏览历史
     * 
     * @param dsgnBrowsingHistory 用户浏览历史
     * @return 结果
     */
    @Override
    public int insertDsgnBrowsingHistory(DsgnBrowsingHistory dsgnBrowsingHistory)
    {
        return dsgnBrowsingHistoryMapper.insertDsgnBrowsingHistory(dsgnBrowsingHistory);
    }

    /**
     * 修改用户浏览历史
     * 
     * @param dsgnBrowsingHistory 用户浏览历史
     * @return 结果
     */
    @Override
    public int updateDsgnBrowsingHistory(DsgnBrowsingHistory dsgnBrowsingHistory)
    {
        return dsgnBrowsingHistoryMapper.updateDsgnBrowsingHistory(dsgnBrowsingHistory);
    }

    /**
     * 批量删除用户浏览历史
     * 
     * @param ids 需要删除的用户浏览历史主键
     * @return 结果
     */
    @Override
    public int deleteDsgnBrowsingHistoryByIds(Long[] ids)
    {
        return dsgnBrowsingHistoryMapper.deleteDsgnBrowsingHistoryByIds(ids);
    }

    /**
     * 删除用户浏览历史信息
     * 
     * @param id 用户浏览历史主键
     * @return 结果
     */
    @Override
    public int deleteDsgnBrowsingHistoryById(Long id)
    {
        return dsgnBrowsingHistoryMapper.deleteDsgnBrowsingHistoryById(id);
    }
}
