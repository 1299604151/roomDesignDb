package com.ruoyi.dsgn.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.dsgn.mapper.DsgnDesignSchemeFurnitureMapper;
import com.ruoyi.dsgn.domain.DsgnDesignSchemeFurniture;
import com.ruoyi.dsgn.service.IDsgnDesignSchemeFurnitureService;

/**
 * 家具素材-设计方案关联Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-10-07 19:10:47
 */
@Service
public class DsgnDesignSchemeFurnitureServiceImpl implements IDsgnDesignSchemeFurnitureService 
{
    @Autowired
    private DsgnDesignSchemeFurnitureMapper dsgnDesignSchemeFurnitureMapper;

    /**
     * 查询家具素材-设计方案关联
     * 
     * @param id 家具素材-设计方案关联主键
     * @return 家具素材-设计方案关联
     */
    @Override
    public DsgnDesignSchemeFurniture selectDsgnDesignSchemeFurnitureById(Long id)
    {
        return dsgnDesignSchemeFurnitureMapper.selectDsgnDesignSchemeFurnitureById(id);
    }

    /**
     * 查询家具素材-设计方案关联列表
     * 
     * @param dsgnDesignSchemeFurniture 家具素材-设计方案关联
     * @return 家具素材-设计方案关联
     */
    @Override
    public List<DsgnDesignSchemeFurniture> selectDsgnDesignSchemeFurnitureList(DsgnDesignSchemeFurniture dsgnDesignSchemeFurniture)
    {
        return dsgnDesignSchemeFurnitureMapper.selectDsgnDesignSchemeFurnitureList(dsgnDesignSchemeFurniture);
    }

    /**
     * 新增家具素材-设计方案关联
     * 
     * @param dsgnDesignSchemeFurniture 家具素材-设计方案关联
     * @return 结果
     */
    @Override
    public int insertDsgnDesignSchemeFurniture(DsgnDesignSchemeFurniture dsgnDesignSchemeFurniture)
    {
        return dsgnDesignSchemeFurnitureMapper.insertDsgnDesignSchemeFurniture(dsgnDesignSchemeFurniture);
    }

    /**
     * 修改家具素材-设计方案关联
     * 
     * @param dsgnDesignSchemeFurniture 家具素材-设计方案关联
     * @return 结果
     */
    @Override
    public int updateDsgnDesignSchemeFurniture(DsgnDesignSchemeFurniture dsgnDesignSchemeFurniture)
    {
        return dsgnDesignSchemeFurnitureMapper.updateDsgnDesignSchemeFurniture(dsgnDesignSchemeFurniture);
    }

    /**
     * 批量删除家具素材-设计方案关联
     * 
     * @param ids 需要删除的家具素材-设计方案关联主键
     * @return 结果
     */
    @Override
    public int deleteDsgnDesignSchemeFurnitureByIds(Long[] ids)
    {
        return dsgnDesignSchemeFurnitureMapper.deleteDsgnDesignSchemeFurnitureByIds(ids);
    }

    /**
     * 删除家具素材-设计方案关联信息
     * 
     * @param id 家具素材-设计方案关联主键
     * @return 结果
     */
    @Override
    public int deleteDsgnDesignSchemeFurnitureById(Long id)
    {
        return dsgnDesignSchemeFurnitureMapper.deleteDsgnDesignSchemeFurnitureById(id);
    }
}
