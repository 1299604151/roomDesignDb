package com.ruoyi.system.service;

import java.util.List;

import com.baomidou.mybatisplus.extension.service.IService;
import com.ruoyi.system.domain.DsgnDesignSchemes;

/**
 * 设计方案Service接口
 * 
 * @author ruoyi
 * @date 2024-10-06 16:51:17
 */
public interface IDsgnDesignSchemesService extends IService<DsgnDesignSchemes>
{
    /**
     * 查询设计方案
     * 
     * @param id 设计方案主键
     * @return 设计方案
     */
    public DsgnDesignSchemes selectDsgnDesignSchemesById(Long id);

    /**
     * 查询设计方案列表
     * 
     * @param dsgnDesignSchemes 设计方案
     * @return 设计方案集合
     */
    public List<DsgnDesignSchemes> selectDsgnDesignSchemesList(DsgnDesignSchemes dsgnDesignSchemes);

    /**
     * 新增设计方案
     * 
     * @param dsgnDesignSchemes 设计方案
     * @return 结果
     */
    public int insertDsgnDesignSchemes(DsgnDesignSchemes dsgnDesignSchemes);

    /**
     * 修改设计方案
     * 
     * @param dsgnDesignSchemes 设计方案
     * @return 结果
     */
    public int updateDsgnDesignSchemes(DsgnDesignSchemes dsgnDesignSchemes);

    /**
     * 批量删除设计方案
     * 
     * @param ids 需要删除的设计方案主键集合
     * @return 结果
     */
    public int deleteDsgnDesignSchemesByIds(Long[] ids);

    /**
     * 删除设计方案信息
     * 
     * @param id 设计方案主键
     * @return 结果
     */
    public int deleteDsgnDesignSchemesById(Long id);
}
