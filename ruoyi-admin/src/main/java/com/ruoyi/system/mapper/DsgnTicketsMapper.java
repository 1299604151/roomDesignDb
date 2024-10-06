package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.DsgnTickets;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
/**
 * 工单Mapper接口
 * 
 * @author ruoyi
 * @date 2024-10-06 16:51:18
 */
public interface DsgnTicketsMapper extends BaseMapper<DsgnTickets>
{
    /**
     * 查询工单
     * 
     * @param id 工单主键
     * @return 工单
     */
    public DsgnTickets selectDsgnTicketsById(Long id);

    /**
     * 查询工单列表
     * 
     * @param dsgnTickets 工单
     * @return 工单集合
     */
    public List<DsgnTickets> selectDsgnTicketsList(DsgnTickets dsgnTickets);

    /**
     * 新增工单
     * 
     * @param dsgnTickets 工单
     * @return 结果
     */
    public int insertDsgnTickets(DsgnTickets dsgnTickets);

    /**
     * 修改工单
     * 
     * @param dsgnTickets 工单
     * @return 结果
     */
    public int updateDsgnTickets(DsgnTickets dsgnTickets);

    /**
     * 删除工单
     * 
     * @param id 工单主键
     * @return 结果
     */
    public int deleteDsgnTicketsById(Long id);

    /**
     * 批量删除工单
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteDsgnTicketsByIds(Long[] ids);
}
