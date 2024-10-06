package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.DsgnFurnitureItems;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
/**
 * 家具素材Mapper接口
 * 
 * @author ruoyi
 * @date 2024-10-06 16:51:17
 */
public interface DsgnFurnitureItemsMapper extends BaseMapper<DsgnFurnitureItems>
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
     * 删除家具素材
     * 
     * @param id 家具素材主键
     * @return 结果
     */
    public int deleteDsgnFurnitureItemsById(Long id);

    /**
     * 批量删除家具素材
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteDsgnFurnitureItemsByIds(Long[] ids);
}
