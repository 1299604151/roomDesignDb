package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.DsgnOrdersMapper;
import com.ruoyi.system.domain.DsgnOrders;
import com.ruoyi.system.service.IDsgnOrdersService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
/**
 * 订单Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-10-06 16:51:18
 */
@Service
public class DsgnOrdersServiceImpl extends ServiceImpl<DsgnOrdersMapper, DsgnOrders> implements IDsgnOrdersService
{
    @Autowired
    private DsgnOrdersMapper dsgnOrdersMapper;

    /**
     * 查询订单
     * 
     * @param id 订单主键
     * @return 订单
     */
    @Override
    public DsgnOrders selectDsgnOrdersById(Long id)
    {
        return dsgnOrdersMapper.selectDsgnOrdersById(id);
    }

    /**
     * 查询订单列表
     * 
     * @param dsgnOrders 订单
     * @return 订单
     */
    @Override
    public List<DsgnOrders> selectDsgnOrdersList(DsgnOrders dsgnOrders)
    {
        return dsgnOrdersMapper.selectDsgnOrdersList(dsgnOrders);
    }

    /**
     * 新增订单
     * 
     * @param dsgnOrders 订单
     * @return 结果
     */
    @Override
    public int insertDsgnOrders(DsgnOrders dsgnOrders)
    {
        return dsgnOrdersMapper.insertDsgnOrders(dsgnOrders);
    }

    /**
     * 修改订单
     * 
     * @param dsgnOrders 订单
     * @return 结果
     */
    @Override
    public int updateDsgnOrders(DsgnOrders dsgnOrders)
    {
        return dsgnOrdersMapper.updateDsgnOrders(dsgnOrders);
    }

    /**
     * 批量删除订单
     * 
     * @param ids 需要删除的订单主键
     * @return 结果
     */
    @Override
    public int deleteDsgnOrdersByIds(Long[] ids)
    {
        return dsgnOrdersMapper.deleteDsgnOrdersByIds(ids);
    }

    /**
     * 删除订单信息
     * 
     * @param id 订单主键
     * @return 结果
     */
    @Override
    public int deleteDsgnOrdersById(Long id)
    {
        return dsgnOrdersMapper.deleteDsgnOrdersById(id);
    }
}
