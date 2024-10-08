package com.ruoyi.dsgn.service.impl;

import java.util.List;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.dsgn.mapper.DsgnDesignSchemesMapper;
import com.ruoyi.dsgn.domain.DsgnDesignSchemes;
import com.ruoyi.dsgn.service.IDsgnDesignSchemesService;

/**
 * 设计方案Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-10-08 10:20:31
 */
@Service
public class DsgnDesignSchemesServiceImpl extends ServiceImpl<DsgnDesignSchemesMapper, DsgnDesignSchemes> implements IDsgnDesignSchemesService
{
    @Autowired
    private DsgnDesignSchemesMapper dsgnDesignSchemesMapper;

    /**
     * 查询设计方案
     * 
     * @param id 设计方案主键
     * @return 设计方案
     */
    @Override
    public DsgnDesignSchemes selectDsgnDesignSchemesById(Long id)
    {
        return dsgnDesignSchemesMapper.selectDsgnDesignSchemesById(id);
    }

    /**
     * 查询设计方案列表
     * 
     * @param dsgnDesignSchemes 设计方案
     * @return 设计方案
     */
    @Override
    public List<DsgnDesignSchemes> selectDsgnDesignSchemesList(DsgnDesignSchemes dsgnDesignSchemes)
    {
        return dsgnDesignSchemesMapper.selectDsgnDesignSchemesList(dsgnDesignSchemes);
    }

    /**
     * 新增设计方案
     * 
     * @param dsgnDesignSchemes 设计方案
     * @return 结果
     */
    @Override
    public int insertDsgnDesignSchemes(DsgnDesignSchemes dsgnDesignSchemes)
    {
        return dsgnDesignSchemesMapper.insertDsgnDesignSchemes(dsgnDesignSchemes);
    }

    /**
     * 修改设计方案
     * 
     * @param dsgnDesignSchemes 设计方案
     * @return 结果
     */
    @Override
    public int updateDsgnDesignSchemes(DsgnDesignSchemes dsgnDesignSchemes)
    {
        return dsgnDesignSchemesMapper.updateDsgnDesignSchemes(dsgnDesignSchemes);
    }

    /**
     * 批量删除设计方案
     * 
     * @param ids 需要删除的设计方案主键
     * @return 结果
     */
    @Override
    public int deleteDsgnDesignSchemesByIds(Long[] ids)
    {
        return dsgnDesignSchemesMapper.deleteDsgnDesignSchemesByIds(ids);
    }

    /**
     * 删除设计方案信息
     * 
     * @param id 设计方案主键
     * @return 结果
     */
    @Override
    public int deleteDsgnDesignSchemesById(Long id)
    {
        return dsgnDesignSchemesMapper.deleteDsgnDesignSchemesById(id);
    }
}
