package com.ruoyi.dsgn.service;

import java.util.List;

import com.baomidou.mybatisplus.extension.service.IService;
import com.ruoyi.dsgn.domain.DsgnOrders;

/**
 * 订单Service接口
 * 
 * @author ruoyi
 * @date 2024-10-07 19:10:47
 */
public interface IDsgnOrdersService extends IService<DsgnOrders>
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
     * 批量删除订单
     * 
     * @param ids 需要删除的订单主键集合
     * @return 结果
     */
    public int deleteDsgnOrdersByIds(Long[] ids);

    /**
     * 删除订单信息
     * 
     * @param id 订单主键
     * @return 结果
     */
    public int deleteDsgnOrdersById(Long id);
}
