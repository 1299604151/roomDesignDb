package com.ruoyi.dsgn.mapper;

import java.util.List;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ruoyi.dsgn.domain.DsgnStyles;

/**
 * 风格Mapper接口
 * 
 * @author ruoyi
 * @date 2024-10-07 19:10:48
 */
public interface DsgnStylesMapper extends BaseMapper<DsgnStyles>
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
     * 删除风格
     * 
     * @param id 风格主键
     * @return 结果
     */
    public int deleteDsgnStylesById(Long id);

    /**
     * 批量删除风格
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteDsgnStylesByIds(Long[] ids);
}
