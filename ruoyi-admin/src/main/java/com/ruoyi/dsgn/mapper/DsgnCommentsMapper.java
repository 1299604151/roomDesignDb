package com.ruoyi.dsgn.mapper;

import java.util.List;
import com.ruoyi.dsgn.domain.DsgnComments;

/**
 * 用户评论Mapper接口
 * 
 * @author ruoyi
 * @date 2024-10-07 19:10:47
 */
public interface DsgnCommentsMapper 
{
    /**
     * 查询用户评论
     * 
     * @param id 用户评论主键
     * @return 用户评论
     */
    public DsgnComments selectDsgnCommentsById(Long id);

    /**
     * 查询用户评论列表
     * 
     * @param dsgnComments 用户评论
     * @return 用户评论集合
     */
    public List<DsgnComments> selectDsgnCommentsList(DsgnComments dsgnComments);

    /**
     * 新增用户评论
     * 
     * @param dsgnComments 用户评论
     * @return 结果
     */
    public int insertDsgnComments(DsgnComments dsgnComments);

    /**
     * 修改用户评论
     * 
     * @param dsgnComments 用户评论
     * @return 结果
     */
    public int updateDsgnComments(DsgnComments dsgnComments);

    /**
     * 删除用户评论
     * 
     * @param id 用户评论主键
     * @return 结果
     */
    public int deleteDsgnCommentsById(Long id);

    /**
     * 批量删除用户评论
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteDsgnCommentsByIds(Long[] ids);
}
