package com.ruoyi.dsgn.mapper;

import java.util.List;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ruoyi.dsgn.domain.DsgnDesignSchemeFurniture;

/**
 * 家具素材-设计方案关联Mapper接口
 * 
 * @author ruoyi
 * @date 2024-10-07 19:10:47
 */
public interface DsgnDesignSchemeFurnitureMapper extends BaseMapper<DsgnDesignSchemeFurniture>
{
    /**
     * 查询家具素材-设计方案关联
     * 
     * @param id 家具素材-设计方案关联主键
     * @return 家具素材-设计方案关联
     */
    public DsgnDesignSchemeFurniture selectDsgnDesignSchemeFurnitureById(Long id);

    /**
     * 查询家具素材-设计方案关联列表
     * 
     * @param dsgnDesignSchemeFurniture 家具素材-设计方案关联
     * @return 家具素材-设计方案关联集合
     */
    public List<DsgnDesignSchemeFurniture> selectDsgnDesignSchemeFurnitureList(DsgnDesignSchemeFurniture dsgnDesignSchemeFurniture);

    /**
     * 新增家具素材-设计方案关联
     * 
     * @param dsgnDesignSchemeFurniture 家具素材-设计方案关联
     * @return 结果
     */
    public int insertDsgnDesignSchemeFurniture(DsgnDesignSchemeFurniture dsgnDesignSchemeFurniture);

    /**
     * 修改家具素材-设计方案关联
     * 
     * @param dsgnDesignSchemeFurniture 家具素材-设计方案关联
     * @return 结果
     */
    public int updateDsgnDesignSchemeFurniture(DsgnDesignSchemeFurniture dsgnDesignSchemeFurniture);

    /**
     * 删除家具素材-设计方案关联
     * 
     * @param id 家具素材-设计方案关联主键
     * @return 结果
     */
    public int deleteDsgnDesignSchemeFurnitureById(Long id);

    /**
     * 批量删除家具素材-设计方案关联
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteDsgnDesignSchemeFurnitureByIds(Long[] ids);
}
