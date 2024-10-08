package com.ruoyi.dsgn.service;

import java.util.List;

import com.baomidou.mybatisplus.extension.service.IService;
import com.ruoyi.dsgn.domain.DsgnDesignSchemeFurniture;

/**
 * 家具素材-设计方案关联Service接口
 * 
 * @author ruoyi
 * @date 2024-10-07 19:10:47
 */
public interface IDsgnDesignSchemeFurnitureService extends IService<DsgnDesignSchemeFurniture>
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
     * 批量删除家具素材-设计方案关联
     * 
     * @param ids 需要删除的家具素材-设计方案关联主键集合
     * @return 结果
     */
    public int deleteDsgnDesignSchemeFurnitureByIds(Long[] ids);

    /**
     * 删除家具素材-设计方案关联信息
     * 
     * @param id 家具素材-设计方案关联主键
     * @return 结果
     */
    public int deleteDsgnDesignSchemeFurnitureById(Long id);
}
