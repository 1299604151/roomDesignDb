package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.DsgnTicketTimeline;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
/**
 * 工单时间线Mapper接口
 * 
 * @author ruoyi
 * @date 2024-10-06 16:51:18
 */
public interface DsgnTicketTimelineMapper extends BaseMapper<DsgnTicketTimeline>
{
    /**
     * 查询工单时间线
     * 
     * @param id 工单时间线主键
     * @return 工单时间线
     */
    public DsgnTicketTimeline selectDsgnTicketTimelineById(Long id);

    /**
     * 查询工单时间线列表
     * 
     * @param dsgnTicketTimeline 工单时间线
     * @return 工单时间线集合
     */
    public List<DsgnTicketTimeline> selectDsgnTicketTimelineList(DsgnTicketTimeline dsgnTicketTimeline);

    /**
     * 新增工单时间线
     * 
     * @param dsgnTicketTimeline 工单时间线
     * @return 结果
     */
    public int insertDsgnTicketTimeline(DsgnTicketTimeline dsgnTicketTimeline);

    /**
     * 修改工单时间线
     * 
     * @param dsgnTicketTimeline 工单时间线
     * @return 结果
     */
    public int updateDsgnTicketTimeline(DsgnTicketTimeline dsgnTicketTimeline);

    /**
     * 删除工单时间线
     * 
     * @param id 工单时间线主键
     * @return 结果
     */
    public int deleteDsgnTicketTimelineById(Long id);

    /**
     * 批量删除工单时间线
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteDsgnTicketTimelineByIds(Long[] ids);
}
