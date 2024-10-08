package com.ruoyi.dsgn.service;

import java.util.List;

import com.baomidou.mybatisplus.extension.service.IService;
import com.ruoyi.dsgn.domain.DsgnComments;

/**
 * 用户评论Service接口
 * 
 * @author ruoyi
 * @date 2024-10-07 19:10:47
 */
public interface IDsgnCommentsService extends IService<DsgnComments>
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
     * 批量删除用户评论
     * 
     * @param ids 需要删除的用户评论主键集合
     * @return 结果
     */
    public int deleteDsgnCommentsByIds(Long[] ids);

    /**
     * 删除用户评论信息
     * 
     * @param id 用户评论主键
     * @return 结果
     */
    public int deleteDsgnCommentsById(Long id);
}
