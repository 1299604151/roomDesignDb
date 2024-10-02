package com.ruoyi.system.service;

import java.util.List;

import com.baomidou.mybatisplus.extension.service.IService;
import com.ruoyi.system.domain.Farmer;
import com.ruoyi.system.domain.Technician;

/**
 * 技术员信息Service接口
 * 
 * @author ruoyi
 * @date 2024-08-25
 */
public interface ITechnicianService extends IService<Technician>
{
    /**
     * 查询技术员信息
     * 
     * @param id 技术员信息主键
     * @return 技术员信息
     */
    public Technician selectTechnicianById(Long id);

    int registerTechnician(Technician technician);

    /**
     * 查询技术员信息列表
     * 
     * @param technician 技术员信息
     * @return 技术员信息集合
     */
    public List<Technician> selectTechnicianList(Technician technician);

    /**
     * 新增技术员信息
     * 
     * @param technician 技术员信息
     * @return 结果
     */
    public int insertTechnician(Technician technician);

    /**
     * 修改技术员信息
     * 
     * @param technician 技术员信息
     * @return 结果
     */
    public int updateTechnician(Technician technician);

    /**
     * 批量删除技术员信息
     * 
     * @param ids 需要删除的技术员信息主键集合
     * @return 结果
     */
    public int deleteTechnicianByIds(Long[] ids);

    /**
     * 删除技术员信息信息
     * 
     * @param id 技术员信息主键
     * @return 结果
     */
    public int deleteTechnicianById(Long id);
}
