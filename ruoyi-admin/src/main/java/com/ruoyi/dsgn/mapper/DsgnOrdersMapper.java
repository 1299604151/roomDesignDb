package com.ruoyi.dsgn.mapper;

import java.util.List;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ruoyi.dsgn.domain.DsgnOrders;

/**
 * 订单Mapper接口
 * 
 * @author ruoyi
 * @date 2024-10-07 19:10:47
 */
public interface DsgnOrdersMapper extends BaseMapper<DsgnOrders>
{
    /**
     * 查询订单
     * 
     * @param id 订单主键
     * @return 订单
     */
    public DsgnOrders selectDsgnOrdersById(Long id);

    /**
     * 查询订单列表
     * 
     * @param dsgnOrders 订单
     * @return 订单集合
     */
    public List<DsgnOrders> selectDsgnOrdersList(DsgnOrders dsgnOrders);

    /**
     * 新增订单
     * 
     * @param dsgnOrders 订单
     * @return 结果
     */
    public int insertDsgnOrders(DsgnOrders dsgnOrders);

    /**
     * 修改订单
     * 
     * @param dsgnOrders 订单
     * @return 结果
     */
    public int updateDsgnOrders(DsgnOrders dsgnOrders);

    /**
     * 删除订单
     * 
     * @param id 订单主键
     * @return 结果
     */
    public int deleteDsgnOrdersById(Long id);

    /**
     * 批量删除订单
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteDsgnOrdersByIds(Long[] ids);
}
