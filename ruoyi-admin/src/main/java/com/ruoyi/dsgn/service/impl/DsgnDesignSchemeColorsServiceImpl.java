package com.ruoyi.dsgn.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.dsgn.mapper.DsgnDesignSchemeColorsMapper;
import com.ruoyi.dsgn.domain.DsgnDesignSchemeColors;
import com.ruoyi.dsgn.service.IDsgnDesignSchemeColorsService;

/**
 * 设计方案-色彩关联Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-10-07 19:10:47
 */
@Service
public class DsgnDesignSchemeColorsServiceImpl implements IDsgnDesignSchemeColorsService 
{
    @Autowired
    private DsgnDesignSchemeColorsMapper dsgnDesignSchemeColorsMapper;

    /**
     * 查询设计方案-色彩关联
     * 
     * @param id 设计方案-色彩关联主键
     * @return 设计方案-色彩关联
     */
    @Override
    public DsgnDesignSchemeColors selectDsgnDesignSchemeColorsById(Long id)
    {
        return dsgnDesignSchemeColorsMapper.selectDsgnDesignSchemeColorsById(id);
    }

    /**
     * 查询设计方案-色彩关联列表
     * 
     * @param dsgnDesignSchemeColors 设计方案-色彩关联
     * @return 设计方案-色彩关联
     */
    @Override
    public List<DsgnDesignSchemeColors> selectDsgnDesignSchemeColorsList(DsgnDesignSchemeColors dsgnDesignSchemeColors)
    {
        return dsgnDesignSchemeColorsMapper.selectDsgnDesignSchemeColorsList(dsgnDesignSchemeColors);
    }

    /**
     * 新增设计方案-色彩关联
     * 
     * @param dsgnDesignSchemeColors 设计方案-色彩关联
     * @return 结果
     */
    @Override
    public int insertDsgnDesignSchemeColors(DsgnDesignSchemeColors dsgnDesignSchemeColors)
    {
        return dsgnDesignSchemeColorsMapper.insertDsgnDesignSchemeColors(dsgnDesignSchemeColors);
    }

    /**
     * 修改设计方案-色彩关联
     * 
     * @param dsgnDesignSchemeColors 设计方案-色彩关联
     * @return 结果
     */
    @Override
    public int updateDsgnDesignSchemeColors(DsgnDesignSchemeColors dsgnDesignSchemeColors)
    {
        return dsgnDesignSchemeColorsMapper.updateDsgnDesignSchemeColors(dsgnDesignSchemeColors);
    }

    /**
     * 批量删除设计方案-色彩关联
     * 
     * @param ids 需要删除的设计方案-色彩关联主键
     * @return 结果
     */
    @Override
    public int deleteDsgnDesignSchemeColorsByIds(Long[] ids)
    {
        return dsgnDesignSchemeColorsMapper.deleteDsgnDesignSchemeColorsByIds(ids);
    }

    /**
     * 删除设计方案-色彩关联信息
     * 
     * @param id 设计方案-色彩关联主键
     * @return 结果
     */
    @Override
    public int deleteDsgnDesignSchemeColorsById(Long id)
    {
        return dsgnDesignSchemeColorsMapper.deleteDsgnDesignSchemeColorsById(id);
    }
}
