package com.ruoyi.system.mapper;

import java.util.List;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ruoyi.system.domain.Farmer;

/**
 * 农民信息Mapper接口
 * 
 * @author ruoyi
 * @date 2024-08-25
 */
public interface FarmerMapper extends BaseMapper<Farmer>
{
    /**
     * 查询农民信息
     * 
     * @param id 农民信息主键
     * @return 农民信息
     */
    public Farmer selectFarmerById(Long id);

    /**
     * 查询农民信息列表
     * 
     * @param farmer 农民信息
     * @return 农民信息集合
     */
    public List<Farmer> selectFarmerList(Farmer farmer);

    /**
     * 新增农民信息
     * 
     * @param farmer 农民信息
     * @return 结果
     */
    public int insertFarmer(Farmer farmer);

    /**
     * 修改农民信息
     * 
     * @param farmer 农民信息
     * @return 结果
     */
    public int updateFarmer(Farmer farmer);

    /**
     * 删除农民信息
     * 
     * @param id 农民信息主键
     * @return 结果
     */
    public int deleteFarmerById(Long id);

    /**
     * 批量删除农民信息
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteFarmerByIds(Long[] ids);
}
