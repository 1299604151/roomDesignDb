package com.ruoyi.dsgn.service.impl;

import java.util.List;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.dsgn.mapper.DsgnIncomeRecordsMapper;
import com.ruoyi.dsgn.domain.DsgnIncomeRecords;
import com.ruoyi.dsgn.service.IDsgnIncomeRecordsService;

/**
 * 收入记录Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-10-07 19:10:47
 */
@Service
public class DsgnIncomeRecordsServiceImpl extends ServiceImpl<DsgnIncomeRecordsMapper, DsgnIncomeRecords> implements IDsgnIncomeRecordsService
{
    @Autowired
    private DsgnIncomeRecordsMapper dsgnIncomeRecordsMapper;

    /**
     * 查询收入记录
     * 
     * @param id 收入记录主键
     * @return 收入记录
     */
    @Override
    public DsgnIncomeRecords selectDsgnIncomeRecordsById(Long id)
    {
        return dsgnIncomeRecordsMapper.selectDsgnIncomeRecordsById(id);
    }

    /**
     * 查询收入记录列表
     * 
     * @param dsgnIncomeRecords 收入记录
     * @return 收入记录
     */
    @Override
    public List<DsgnIncomeRecords> selectDsgnIncomeRecordsList(DsgnIncomeRecords dsgnIncomeRecords)
    {
        return dsgnIncomeRecordsMapper.selectDsgnIncomeRecordsList(dsgnIncomeRecords);
    }

    /**
     * 新增收入记录
     * 
     * @param dsgnIncomeRecords 收入记录
     * @return 结果
     */
    @Override
    public int insertDsgnIncomeRecords(DsgnIncomeRecords dsgnIncomeRecords)
    {
        return dsgnIncomeRecordsMapper.insertDsgnIncomeRecords(dsgnIncomeRecords);
    }

    /**
     * 修改收入记录
     * 
     * @param dsgnIncomeRecords 收入记录
     * @return 结果
     */
    @Override
    public int updateDsgnIncomeRecords(DsgnIncomeRecords dsgnIncomeRecords)
    {
        return dsgnIncomeRecordsMapper.updateDsgnIncomeRecords(dsgnIncomeRecords);
    }

    /**
     * 批量删除收入记录
     * 
     * @param ids 需要删除的收入记录主键
     * @return 结果
     */
    @Override
    public int deleteDsgnIncomeRecordsByIds(Long[] ids)
    {
        return dsgnIncomeRecordsMapper.deleteDsgnIncomeRecordsByIds(ids);
    }

    /**
     * 删除收入记录信息
     * 
     * @param id 收入记录主键
     * @return 结果
     */
    @Override
    public int deleteDsgnIncomeRecordsById(Long id)
    {
        return dsgnIncomeRecordsMapper.deleteDsgnIncomeRecordsById(id);
    }
}
