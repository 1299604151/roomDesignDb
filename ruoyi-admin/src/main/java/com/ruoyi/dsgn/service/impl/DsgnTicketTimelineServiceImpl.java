package com.ruoyi.dsgn.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.dsgn.mapper.DsgnTicketTimelineMapper;
import com.ruoyi.dsgn.domain.DsgnTicketTimeline;
import com.ruoyi.dsgn.service.IDsgnTicketTimelineService;

/**
 * 工单时间线Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-10-07 19:10:48
 */
@Service
public class DsgnTicketTimelineServiceImpl implements IDsgnTicketTimelineService 
{
    @Autowired
    private DsgnTicketTimelineMapper dsgnTicketTimelineMapper;

    /**
     * 查询工单时间线
     * 
     * @param id 工单时间线主键
     * @return 工单时间线
     */
    @Override
    public DsgnTicketTimeline selectDsgnTicketTimelineById(Long id)
    {
        return dsgnTicketTimelineMapper.selectDsgnTicketTimelineById(id);
    }

    /**
     * 查询工单时间线列表
     * 
     * @param dsgnTicketTimeline 工单时间线
     * @return 工单时间线
     */
    @Override
    public List<DsgnTicketTimeline> selectDsgnTicketTimelineList(DsgnTicketTimeline dsgnTicketTimeline)
    {
        return dsgnTicketTimelineMapper.selectDsgnTicketTimelineList(dsgnTicketTimeline);
    }

    /**
     * 新增工单时间线
     * 
     * @param dsgnTicketTimeline 工单时间线
     * @return 结果
     */
    @Override
    public int insertDsgnTicketTimeline(DsgnTicketTimeline dsgnTicketTimeline)
    {
        return dsgnTicketTimelineMapper.insertDsgnTicketTimeline(dsgnTicketTimeline);
    }

    /**
     * 修改工单时间线
     * 
     * @param dsgnTicketTimeline 工单时间线
     * @return 结果
     */
    @Override
    public int updateDsgnTicketTimeline(DsgnTicketTimeline dsgnTicketTimeline)
    {
        return dsgnTicketTimelineMapper.updateDsgnTicketTimeline(dsgnTicketTimeline);
    }

    /**
     * 批量删除工单时间线
     * 
     * @param ids 需要删除的工单时间线主键
     * @return 结果
     */
    @Override
    public int deleteDsgnTicketTimelineByIds(Long[] ids)
    {
        return dsgnTicketTimelineMapper.deleteDsgnTicketTimelineByIds(ids);
    }

    /**
     * 删除工单时间线信息
     * 
     * @param id 工单时间线主键
     * @return 结果
     */
    @Override
    public int deleteDsgnTicketTimelineById(Long id)
    {
        return dsgnTicketTimelineMapper.deleteDsgnTicketTimelineById(id);
    }
}
