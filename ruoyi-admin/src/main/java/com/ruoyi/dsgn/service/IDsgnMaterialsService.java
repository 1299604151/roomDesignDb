package com.ruoyi.dsgn.service;

import java.util.List;

import com.baomidou.mybatisplus.extension.service.IService;
import com.ruoyi.dsgn.domain.DsgnMaterials;

/**
 * 材料Service接口
 * 
 * @author ruoyi
 * @date 2024-10-07 19:10:47
 */
public interface IDsgnMaterialsService extends IService<DsgnMaterials>
{
    /**
     * 查询材料
     * 
     * @param id 材料主键
     * @return 材料
     */
    public DsgnMaterials selectDsgnMaterialsById(Long id);

    /**
     * 查询材料列表
     * 
     * @param dsgnMaterials 材料
     * @return 材料集合
     */
    public List<DsgnMaterials> selectDsgnMaterialsList(DsgnMaterials dsgnMaterials);

    /**
     * 新增材料
     * 
     * @param dsgnMaterials 材料
     * @return 结果
     */
    public int insertDsgnMaterials(DsgnMaterials dsgnMaterials);

    /**
     * 修改材料
     * 
     * @param dsgnMaterials 材料
     * @return 结果
     */
    public int updateDsgnMaterials(DsgnMaterials dsgnMaterials);

    /**
     * 批量删除材料
     * 
     * @param ids 需要删除的材料主键集合
     * @return 结果
     */
    public int deleteDsgnMaterialsByIds(Long[] ids);

    /**
     * 删除材料信息
     * 
     * @param id 材料主键
     * @return 结果
     */
    public int deleteDsgnMaterialsById(Long id);
}
