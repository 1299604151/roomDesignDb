package com.ruoyi.dsgn.service;

import java.util.List;
import com.ruoyi.dsgn.domain.DsgnColors;

/**
 * 色彩Service接口
 * 
 * @author ruoyi
 * @date 2024-10-07 19:10:47
 */
public interface IDsgnColorsService 
{
    /**
     * 查询色彩
     * 
     * @param id 色彩主键
     * @return 色彩
     */
    public DsgnColors selectDsgnColorsById(Long id);

    /**
     * 查询色彩列表
     * 
     * @param dsgnColors 色彩
     * @return 色彩集合
     */
    public List<DsgnColors> selectDsgnColorsList(DsgnColors dsgnColors);

    /**
     * 新增色彩
     * 
     * @param dsgnColors 色彩
     * @return 结果
     */
    public int insertDsgnColors(DsgnColors dsgnColors);

    /**
     * 修改色彩
     * 
     * @param dsgnColors 色彩
     * @return 结果
     */
    public int updateDsgnColors(DsgnColors dsgnColors);

    /**
     * 批量删除色彩
     * 
     * @param ids 需要删除的色彩主键集合
     * @return 结果
     */
    public int deleteDsgnColorsByIds(Long[] ids);

    /**
     * 删除色彩信息
     * 
     * @param id 色彩主键
     * @return 结果
     */
    public int deleteDsgnColorsById(Long id);
}
