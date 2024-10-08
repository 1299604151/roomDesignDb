package com.ruoyi.dsgn.service;

import java.util.List;

import com.baomidou.mybatisplus.extension.service.IService;
import com.ruoyi.dsgn.domain.DsgnStyles;

/**
 * 风格Service接口
 * 
 * @author ruoyi
 * @date 2024-10-07 19:10:48
 */
public interface IDsgnStylesService extends IService<DsgnStyles>
{
    /**
     * 查询风格
     * 
     * @param id 风格主键
     * @return 风格
     */
    public DsgnStyles selectDsgnStylesById(Long id);

    /**
     * 查询风格列表
     * 
     * @param dsgnStyles 风格
     * @return 风格集合
     */
    public List<DsgnStyles> selectDsgnStylesList(DsgnStyles dsgnStyles);

    /**
     * 新增风格
     * 
     * @param dsgnStyles 风格
     * @return 结果
     */
    public int insertDsgnStyles(DsgnStyles dsgnStyles);

    /**
     * 修改风格
     * 
     * @param dsgnStyles 风格
     * @return 结果
     */
    public int updateDsgnStyles(DsgnStyles dsgnStyles);

    /**
     * 批量删除风格
     * 
     * @param ids 需要删除的风格主键集合
     * @return 结果
     */
    public int deleteDsgnStylesByIds(Long[] ids);

    /**
     * 删除风格信息
     * 
     * @param id 风格主键
     * @return 结果
     */
    public int deleteDsgnStylesById(Long id);
}
