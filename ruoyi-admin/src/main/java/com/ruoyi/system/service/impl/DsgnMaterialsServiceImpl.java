package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.DsgnMaterialsMapper;
import com.ruoyi.system.domain.DsgnMaterials;
import com.ruoyi.system.service.IDsgnMaterialsService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
/**
 * 材料Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-10-06 16:51:17
 */
@Service
public class DsgnMaterialsServiceImpl extends ServiceImpl<DsgnMaterialsMapper, DsgnMaterials> implements IDsgnMaterialsService
{
    @Autowired
    private DsgnMaterialsMapper dsgnMaterialsMapper;

    /**
     * 查询材料
     * 
     * @param id 材料主键
     * @return 材料
     */
    @Override
    public DsgnMaterials selectDsgnMaterialsById(Long id)
    {
        return dsgnMaterialsMapper.selectDsgnMaterialsById(id);
    }

    /**
     * 查询材料列表
     * 
     * @param dsgnMaterials 材料
     * @return 材料
     */
    @Override
    public List<DsgnMaterials> selectDsgnMaterialsList(DsgnMaterials dsgnMaterials)
    {
        return dsgnMaterialsMapper.selectDsgnMaterialsList(dsgnMaterials);
    }

    /**
     * 新增材料
     * 
     * @param dsgnMaterials 材料
     * @return 结果
     */
    @Override
    public int insertDsgnMaterials(DsgnMaterials dsgnMaterials)
    {
        return dsgnMaterialsMapper.insertDsgnMaterials(dsgnMaterials);
    }

    /**
     * 修改材料
     * 
     * @param dsgnMaterials 材料
     * @return 结果
     */
    @Override
    public int updateDsgnMaterials(DsgnMaterials dsgnMaterials)
    {
        return dsgnMaterialsMapper.updateDsgnMaterials(dsgnMaterials);
    }

    /**
     * 批量删除材料
     * 
     * @param ids 需要删除的材料主键
     * @return 结果
     */
    @Override
    public int deleteDsgnMaterialsByIds(Long[] ids)
    {
        return dsgnMaterialsMapper.deleteDsgnMaterialsByIds(ids);
    }

    /**
     * 删除材料信息
     * 
     * @param id 材料主键
     * @return 结果
     */
    @Override
    public int deleteDsgnMaterialsById(Long id)
    {
        return dsgnMaterialsMapper.deleteDsgnMaterialsById(id);
    }
}
