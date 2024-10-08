package com.ruoyi.dsgn.service;

import java.util.List;

import com.baomidou.mybatisplus.extension.service.IService;
import com.ruoyi.dsgn.domain.DsgnDesignSchemeMaterials;

/**
 * 设计方案-材料关联Service接口
 * 
 * @author ruoyi
 * @date 2024-10-07 19:10:47
 */
public interface IDsgnDesignSchemeMaterialsService extends IService<DsgnDesignSchemeMaterials>
{
    /**
     * 查询设计方案-材料关联
     * 
     * @param id 设计方案-材料关联主键
     * @return 设计方案-材料关联
     */
    public DsgnDesignSchemeMaterials selectDsgnDesignSchemeMaterialsById(Long id);

    /**
     * 查询设计方案-材料关联列表
     * 
     * @param dsgnDesignSchemeMaterials 设计方案-材料关联
     * @return 设计方案-材料关联集合
     */
    public List<DsgnDesignSchemeMaterials> selectDsgnDesignSchemeMaterialsList(DsgnDesignSchemeMaterials dsgnDesignSchemeMaterials);

    /**
     * 新增设计方案-材料关联
     * 
     * @param dsgnDesignSchemeMaterials 设计方案-材料关联
     * @return 结果
     */
    public int insertDsgnDesignSchemeMaterials(DsgnDesignSchemeMaterials dsgnDesignSchemeMaterials);

    /**
     * 修改设计方案-材料关联
     * 
     * @param dsgnDesignSchemeMaterials 设计方案-材料关联
     * @return 结果
     */
    public int updateDsgnDesignSchemeMaterials(DsgnDesignSchemeMaterials dsgnDesignSchemeMaterials);

    /**
     * 批量删除设计方案-材料关联
     * 
     * @param ids 需要删除的设计方案-材料关联主键集合
     * @return 结果
     */
    public int deleteDsgnDesignSchemeMaterialsByIds(Long[] ids);

    /**
     * 删除设计方案-材料关联信息
     * 
     * @param id 设计方案-材料关联主键
     * @return 结果
     */
    public int deleteDsgnDesignSchemeMaterialsById(Long id);
}
