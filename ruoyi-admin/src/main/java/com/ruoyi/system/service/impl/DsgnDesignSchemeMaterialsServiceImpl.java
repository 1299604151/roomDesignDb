package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.DsgnDesignSchemeMaterialsMapper;
import com.ruoyi.system.domain.DsgnDesignSchemeMaterials;
import com.ruoyi.system.service.IDsgnDesignSchemeMaterialsService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
/**
 * 设计方案-材料关联Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-10-06 16:51:17
 */
@Service
public class DsgnDesignSchemeMaterialsServiceImpl extends ServiceImpl<DsgnDesignSchemeMaterialsMapper, DsgnDesignSchemeMaterials> implements IDsgnDesignSchemeMaterialsService
{
    @Autowired
    private DsgnDesignSchemeMaterialsMapper dsgnDesignSchemeMaterialsMapper;

    /**
     * 查询设计方案-材料关联
     * 
     * @param id 设计方案-材料关联主键
     * @return 设计方案-材料关联
     */
    @Override
    public DsgnDesignSchemeMaterials selectDsgnDesignSchemeMaterialsById(Long id)
    {
        return dsgnDesignSchemeMaterialsMapper.selectDsgnDesignSchemeMaterialsById(id);
    }

    /**
     * 查询设计方案-材料关联列表
     * 
     * @param dsgnDesignSchemeMaterials 设计方案-材料关联
     * @return 设计方案-材料关联
     */
    @Override
    public List<DsgnDesignSchemeMaterials> selectDsgnDesignSchemeMaterialsList(DsgnDesignSchemeMaterials dsgnDesignSchemeMaterials)
    {
        return dsgnDesignSchemeMaterialsMapper.selectDsgnDesignSchemeMaterialsList(dsgnDesignSchemeMaterials);
    }

    /**
     * 新增设计方案-材料关联
     * 
     * @param dsgnDesignSchemeMaterials 设计方案-材料关联
     * @return 结果
     */
    @Override
    public int insertDsgnDesignSchemeMaterials(DsgnDesignSchemeMaterials dsgnDesignSchemeMaterials)
    {
        return dsgnDesignSchemeMaterialsMapper.insertDsgnDesignSchemeMaterials(dsgnDesignSchemeMaterials);
    }

    /**
     * 修改设计方案-材料关联
     * 
     * @param dsgnDesignSchemeMaterials 设计方案-材料关联
     * @return 结果
     */
    @Override
    public int updateDsgnDesignSchemeMaterials(DsgnDesignSchemeMaterials dsgnDesignSchemeMaterials)
    {
        return dsgnDesignSchemeMaterialsMapper.updateDsgnDesignSchemeMaterials(dsgnDesignSchemeMaterials);
    }

    /**
     * 批量删除设计方案-材料关联
     * 
     * @param ids 需要删除的设计方案-材料关联主键
     * @return 结果
     */
    @Override
    public int deleteDsgnDesignSchemeMaterialsByIds(Long[] ids)
    {
        return dsgnDesignSchemeMaterialsMapper.deleteDsgnDesignSchemeMaterialsByIds(ids);
    }

    /**
     * 删除设计方案-材料关联信息
     * 
     * @param id 设计方案-材料关联主键
     * @return 结果
     */
    @Override
    public int deleteDsgnDesignSchemeMaterialsById(Long id)
    {
        return dsgnDesignSchemeMaterialsMapper.deleteDsgnDesignSchemeMaterialsById(id);
    }
}
