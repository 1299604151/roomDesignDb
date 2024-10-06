package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.DsgnColorsMapper;
import com.ruoyi.system.domain.DsgnColors;
import com.ruoyi.system.service.IDsgnColorsService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
/**
 * 色彩Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-10-06 16:51:17
 */
@Service
public class DsgnColorsServiceImpl extends ServiceImpl<DsgnColorsMapper, DsgnColors> implements IDsgnColorsService
{
    @Autowired
    private DsgnColorsMapper dsgnColorsMapper;

    /**
     * 查询色彩
     * 
     * @param id 色彩主键
     * @return 色彩
     */
    @Override
    public DsgnColors selectDsgnColorsById(Long id)
    {
        return dsgnColorsMapper.selectDsgnColorsById(id);
    }

    /**
     * 查询色彩列表
     * 
     * @param dsgnColors 色彩
     * @return 色彩
     */
    @Override
    public List<DsgnColors> selectDsgnColorsList(DsgnColors dsgnColors)
    {
        return dsgnColorsMapper.selectDsgnColorsList(dsgnColors);
    }

    /**
     * 新增色彩
     * 
     * @param dsgnColors 色彩
     * @return 结果
     */
    @Override
    public int insertDsgnColors(DsgnColors dsgnColors)
    {
        return dsgnColorsMapper.insertDsgnColors(dsgnColors);
    }

    /**
     * 修改色彩
     * 
     * @param dsgnColors 色彩
     * @return 结果
     */
    @Override
    public int updateDsgnColors(DsgnColors dsgnColors)
    {
        return dsgnColorsMapper.updateDsgnColors(dsgnColors);
    }

    /**
     * 批量删除色彩
     * 
     * @param ids 需要删除的色彩主键
     * @return 结果
     */
    @Override
    public int deleteDsgnColorsByIds(Long[] ids)
    {
        return dsgnColorsMapper.deleteDsgnColorsByIds(ids);
    }

    /**
     * 删除色彩信息
     * 
     * @param id 色彩主键
     * @return 结果
     */
    @Override
    public int deleteDsgnColorsById(Long id)
    {
        return dsgnColorsMapper.deleteDsgnColorsById(id);
    }
}
