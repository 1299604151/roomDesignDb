package com.ruoyi.dsgn.service.impl;

import java.util.List;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.dsgn.mapper.DsgnCommentsMapper;
import com.ruoyi.dsgn.domain.DsgnComments;
import com.ruoyi.dsgn.service.IDsgnCommentsService;

/**
 * 用户评论Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-10-07 19:10:47
 */
@Service
public class DsgnCommentsServiceImpl extends ServiceImpl<DsgnCommentsMapper,DsgnComments> implements IDsgnCommentsService
{
    @Autowired
    private DsgnCommentsMapper dsgnCommentsMapper;

    /**
     * 查询用户评论
     * 
     * @param id 用户评论主键
     * @return 用户评论
     */
    @Override
    public DsgnComments selectDsgnCommentsById(Long id)
    {
        return dsgnCommentsMapper.selectDsgnCommentsById(id);
    }

    /**
     * 查询用户评论列表
     * 
     * @param dsgnComments 用户评论
     * @return 用户评论
     */
    @Override
    public List<DsgnComments> selectDsgnCommentsList(DsgnComments dsgnComments)
    {
        return dsgnCommentsMapper.selectDsgnCommentsList(dsgnComments);
    }

    /**
     * 新增用户评论
     * 
     * @param dsgnComments 用户评论
     * @return 结果
     */
    @Override
    public int insertDsgnComments(DsgnComments dsgnComments)
    {
        return dsgnCommentsMapper.insertDsgnComments(dsgnComments);
    }

    /**
     * 修改用户评论
     * 
     * @param dsgnComments 用户评论
     * @return 结果
     */
    @Override
    public int updateDsgnComments(DsgnComments dsgnComments)
    {
        return dsgnCommentsMapper.updateDsgnComments(dsgnComments);
    }

    /**
     * 批量删除用户评论
     * 
     * @param ids 需要删除的用户评论主键
     * @return 结果
     */
    @Override
    public int deleteDsgnCommentsByIds(Long[] ids)
    {
        return dsgnCommentsMapper.deleteDsgnCommentsByIds(ids);
    }

    /**
     * 删除用户评论信息
     * 
     * @param id 用户评论主键
     * @return 结果
     */
    @Override
    public int deleteDsgnCommentsById(Long id)
    {
        return dsgnCommentsMapper.deleteDsgnCommentsById(id);
    }
}
