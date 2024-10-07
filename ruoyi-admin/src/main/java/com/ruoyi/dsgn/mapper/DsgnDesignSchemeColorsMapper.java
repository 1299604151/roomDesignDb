package com.ruoyi.dsgn.mapper;

import java.util.List;
import com.ruoyi.dsgn.domain.DsgnDesignSchemeColors;

/**
 * 设计方案-色彩关联Mapper接口
 * 
 * @author ruoyi
 * @date 2024-10-07 19:10:47
 */
public interface DsgnDesignSchemeColorsMapper 
{
    /**
     * 查询设计方案-色彩关联
     * 
     * @param id 设计方案-色彩关联主键
     * @return 设计方案-色彩关联
     */
    public DsgnDesignSchemeColors selectDsgnDesignSchemeColorsById(Long id);

    /**
     * 查询设计方案-色彩关联列表
     * 
     * @param dsgnDesignSchemeColors 设计方案-色彩关联
     * @return 设计方案-色彩关联集合
     */
    public List<DsgnDesignSchemeColors> selectDsgnDesignSchemeColorsList(DsgnDesignSchemeColors dsgnDesignSchemeColors);

    /**
     * 新增设计方案-色彩关联
     * 
     * @param dsgnDesignSchemeColors 设计方案-色彩关联
     * @return 结果
     */
    public int insertDsgnDesignSchemeColors(DsgnDesignSchemeColors dsgnDesignSchemeColors);

    /**
     * 修改设计方案-色彩关联
     * 
     * @param dsgnDesignSchemeColors 设计方案-色彩关联
     * @return 结果
     */
    public int updateDsgnDesignSchemeColors(DsgnDesignSchemeColors dsgnDesignSchemeColors);

    /**
     * 删除设计方案-色彩关联
     * 
     * @param id 设计方案-色彩关联主键
     * @return 结果
     */
    public int deleteDsgnDesignSchemeColorsById(Long id);

    /**
     * 批量删除设计方案-色彩关联
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteDsgnDesignSchemeColorsByIds(Long[] ids);
}
