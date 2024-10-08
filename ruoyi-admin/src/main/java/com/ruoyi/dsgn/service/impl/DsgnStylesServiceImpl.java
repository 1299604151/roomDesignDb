package com.ruoyi.dsgn.service.impl;

import java.util.List;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.dsgn.mapper.DsgnStylesMapper;
import com.ruoyi.dsgn.domain.DsgnStyles;
import com.ruoyi.dsgn.service.IDsgnStylesService;

/**
 * 风格Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-10-07 19:10:48
 */
@Service
public class DsgnStylesServiceImpl extends ServiceImpl<DsgnStylesMapper, DsgnStyles> implements IDsgnStylesService
{
    @Autowired
    private DsgnStylesMapper dsgnStylesMapper;

    /**
     * 查询风格
     * 
     * @param id 风格主键
     * @return 风格
     */
    @Override
    public DsgnStyles selectDsgnStylesById(Long id)
    {
        return dsgnStylesMapper.selectDsgnStylesById(id);
    }

    /**
     * 查询风格列表
     * 
     * @param dsgnStyles 风格
     * @return 风格
     */
    @Override
    public List<DsgnStyles> selectDsgnStylesList(DsgnStyles dsgnStyles)
    {
        return dsgnStylesMapper.selectDsgnStylesList(dsgnStyles);
    }

    /**
     * 新增风格
     * 
     * @param dsgnStyles 风格
     * @return 结果
     */
    @Override
    public int insertDsgnStyles(DsgnStyles dsgnStyles)
    {
        return dsgnStylesMapper.insertDsgnStyles(dsgnStyles);
    }

    /**
     * 修改风格
     * 
     * @param dsgnStyles 风格
     * @return 结果
     */
    @Override
    public int updateDsgnStyles(DsgnStyles dsgnStyles)
    {
        return dsgnStylesMapper.updateDsgnStyles(dsgnStyles);
    }

    /**
     * 批量删除风格
     * 
     * @param ids 需要删除的风格主键
     * @return 结果
     */
    @Override
    public int deleteDsgnStylesByIds(Long[] ids)
    {
        return dsgnStylesMapper.deleteDsgnStylesByIds(ids);
    }

    /**
     * 删除风格信息
     * 
     * @param id 风格主键
     * @return 结果
     */
    @Override
    public int deleteDsgnStylesById(Long id)
    {
        return dsgnStylesMapper.deleteDsgnStylesById(id);
    }
}
