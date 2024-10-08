package com.ruoyi.dsgn.service.impl;

import java.util.List;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.dsgn.mapper.DsgnFurnitureItemsMapper;
import com.ruoyi.dsgn.domain.DsgnFurnitureItems;
import com.ruoyi.dsgn.service.IDsgnFurnitureItemsService;

/**
 * 家具素材Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-10-07 19:10:47
 */
@Service
public class DsgnFurnitureItemsServiceImpl extends ServiceImpl<DsgnFurnitureItemsMapper, DsgnFurnitureItems> implements IDsgnFurnitureItemsService
{
    @Autowired
    private DsgnFurnitureItemsMapper dsgnFurnitureItemsMapper;

    /**
     * 查询家具素材
     * 
     * @param id 家具素材主键
     * @return 家具素材
     */
    @Override
    public DsgnFurnitureItems selectDsgnFurnitureItemsById(Long id)
    {
        return dsgnFurnitureItemsMapper.selectDsgnFurnitureItemsById(id);
    }

    /**
     * 查询家具素材列表
     * 
     * @param dsgnFurnitureItems 家具素材
     * @return 家具素材
     */
    @Override
    public List<DsgnFurnitureItems> selectDsgnFurnitureItemsList(DsgnFurnitureItems dsgnFurnitureItems)
    {
        return dsgnFurnitureItemsMapper.selectDsgnFurnitureItemsList(dsgnFurnitureItems);
    }

    /**
     * 新增家具素材
     * 
     * @param dsgnFurnitureItems 家具素材
     * @return 结果
     */
    @Override
    public int insertDsgnFurnitureItems(DsgnFurnitureItems dsgnFurnitureItems)
    {
        return dsgnFurnitureItemsMapper.insertDsgnFurnitureItems(dsgnFurnitureItems);
    }

    /**
     * 修改家具素材
     * 
     * @param dsgnFurnitureItems 家具素材
     * @return 结果
     */
    @Override
    public int updateDsgnFurnitureItems(DsgnFurnitureItems dsgnFurnitureItems)
    {
        return dsgnFurnitureItemsMapper.updateDsgnFurnitureItems(dsgnFurnitureItems);
    }

    /**
     * 批量删除家具素材
     * 
     * @param ids 需要删除的家具素材主键
     * @return 结果
     */
    @Override
    public int deleteDsgnFurnitureItemsByIds(Long[] ids)
    {
        return dsgnFurnitureItemsMapper.deleteDsgnFurnitureItemsByIds(ids);
    }

    /**
     * 删除家具素材信息
     * 
     * @param id 家具素材主键
     * @return 结果
     */
    @Override
    public int deleteDsgnFurnitureItemsById(Long id)
    {
        return dsgnFurnitureItemsMapper.deleteDsgnFurnitureItemsById(id);
    }
}
