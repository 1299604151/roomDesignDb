package com.ruoyi.dsgn.service.impl;

import java.util.List;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.dsgn.mapper.DsgnTicketsMapper;
import com.ruoyi.dsgn.domain.DsgnTickets;
import com.ruoyi.dsgn.service.IDsgnTicketsService;

/**
 * 工单Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-10-07 19:10:48
 */
@Service
public class DsgnTicketsServiceImpl extends ServiceImpl<DsgnTicketsMapper, DsgnTickets> implements IDsgnTicketsService
{
    @Autowired
    private DsgnTicketsMapper dsgnTicketsMapper;

    /**
     * 查询工单
     * 
     * @param id 工单主键
     * @return 工单
     */
    @Override
    public DsgnTickets selectDsgnTicketsById(Long id)
    {
        return dsgnTicketsMapper.selectDsgnTicketsById(id);
    }

    /**
     * 查询工单列表
     * 
     * @param dsgnTickets 工单
     * @return 工单
     */
    @Override
    public List<DsgnTickets> selectDsgnTicketsList(DsgnTickets dsgnTickets)
    {
        return dsgnTicketsMapper.selectDsgnTicketsList(dsgnTickets);
    }

    /**
     * 新增工单
     * 
     * @param dsgnTickets 工单
     * @return 结果
     */
    @Override
    public int insertDsgnTickets(DsgnTickets dsgnTickets)
    {
        return dsgnTicketsMapper.insertDsgnTickets(dsgnTickets);
    }

    /**
     * 修改工单
     * 
     * @param dsgnTickets 工单
     * @return 结果
     */
    @Override
    public int updateDsgnTickets(DsgnTickets dsgnTickets)
    {
        return dsgnTicketsMapper.updateDsgnTickets(dsgnTickets);
    }

    /**
     * 批量删除工单
     * 
     * @param ids 需要删除的工单主键
     * @return 结果
     */
    @Override
    public int deleteDsgnTicketsByIds(Long[] ids)
    {
        return dsgnTicketsMapper.deleteDsgnTicketsByIds(ids);
    }

    /**
     * 删除工单信息
     * 
     * @param id 工单主键
     * @return 结果
     */
    @Override
    public int deleteDsgnTicketsById(Long id)
    {
        return dsgnTicketsMapper.deleteDsgnTicketsById(id);
    }
}
