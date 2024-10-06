package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.DsgnIncomeRecords;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
/**
 * 收入记录Mapper接口
 * 
 * @author ruoyi
 * @date 2024-10-06 16:51:17
 */
public interface DsgnIncomeRecordsMapper extends BaseMapper<DsgnIncomeRecords>
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
     * 删除收入记录
     * 
     * @param id 收入记录主键
     * @return 结果
     */
    public int deleteDsgnIncomeRecordsById(Long id);

    /**
     * 批量删除收入记录
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteDsgnIncomeRecordsByIds(Long[] ids);
}
