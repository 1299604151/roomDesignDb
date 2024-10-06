package com.ruoyi.system.service;

import java.util.List;

import com.baomidou.mybatisplus.extension.service.IService;
import com.ruoyi.system.domain.DsgnFurnitureItems;

/**
 * 家具素材Service接口
 * 
 * @author ruoyi
 * @date 2024-10-06 16:51:17
 */
public interface IDsgnFurnitureItemsService extends IService<DsgnFurnitureItems>
{
    /**
     * 查询家具素材
     * 
     * @param id 家具素材主键
     * @return 家具素材
     */
    public DsgnFurnitureItems selectDsgnFurnitureItemsById(Long id);

    /**
     * 查询家具素材列表
     * 
     * @param dsgnFurnitureItems 家具素材
     * @return 家具素材集合
     */
    public List<DsgnFurnitureItems> selectDsgnFurnitureItemsList(DsgnFurnitureItems dsgnFurnitureItems);

    /**
     * 新增家具素材
     * 
     * @param dsgnFurnitureItems 家具素材
     * @return 结果
     */
    public int insertDsgnFurnitureItems(DsgnFurnitureItems dsgnFurnitureItems);

    /**
     * 修改家具素材
     * 
     * @param dsgnFurnitureItems 家具素材
     * @return 结果
     */
    public int updateDsgnFurnitureItems(DsgnFurnitureItems dsgnFurnitureItems);

    /**
     * 批量删除家具素材
     * 
     * @param ids 需要删除的家具素材主键集合
     * @return 结果
     */
    public int deleteDsgnFurnitureItemsByIds(Long[] ids);

    /**
     * 删除家具素材信息
     * 
     * @param id 家具素材主键
     * @return 结果
     */
    public int deleteDsgnFurnitureItemsById(Long id);
}
