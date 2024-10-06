package com.ruoyi.system.service;

import java.util.List;

import com.baomidou.mybatisplus.extension.service.IService;
import com.ruoyi.system.domain.DsgnIncomeRecords;

/**
 * 收入记录Service接口
 * 
 * @author ruoyi
 * @date 2024-10-06 16:51:17
 */
public interface IDsgnIncomeRecordsService extends IService<DsgnIncomeRecords>
{
    /**
     * 查询收入记录
     * 
     * @param id 收入记录主键
     * @return 收入记录
     */
    public DsgnIncomeRecords selectDsgnIncomeRecordsById(Long id);

    /**
     * 查询收入记录列表
     * 
     * @param dsgnIncomeRecords 收入记录
     * @return 收入记录集合
     */
    public List<DsgnIncomeRecords> selectDsgnIncomeRecordsList(DsgnIncomeRecords dsgnIncomeRecords);

    /**
     * 新增收入记录
     * 
     * @param dsgnIncomeRecords 收入记录
     * @return 结果
     */
    public int insertDsgnIncomeRecords(DsgnIncomeRecords dsgnIncomeRecords);

    /**
     * 修改收入记录
     * 
     * @param dsgnIncomeRecords 收入记录
     * @return 结果
     */
    public int updateDsgnIncomeRecords(DsgnIncomeRecords dsgnIncomeRecords);

    /**
     * 批量删除收入记录
     * 
     * @param ids 需要删除的收入记录主键集合
     * @return 结果
     */
    public int deleteDsgnIncomeRecordsByIds(Long[] ids);

    /**
     * 删除收入记录信息
     * 
     * @param id 收入记录主键
     * @return 结果
     */
    public int deleteDsgnIncomeRecordsById(Long id);
}
