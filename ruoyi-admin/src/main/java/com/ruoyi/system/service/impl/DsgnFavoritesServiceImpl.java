package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.DsgnFavoritesMapper;
import com.ruoyi.system.domain.DsgnFavorites;
import com.ruoyi.system.service.IDsgnFavoritesService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
/**
 * 用户收藏Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-10-06 16:51:17
 */
@Service
public class DsgnFavoritesServiceImpl extends ServiceImpl<DsgnFavoritesMapper, DsgnFavorites> implements IDsgnFavoritesService
{
    @Autowired
    private DsgnFavoritesMapper dsgnFavoritesMapper;

    /**
     * 查询用户收藏
     * 
     * @param id 用户收藏主键
     * @return 用户收藏
     */
    @Override
    public DsgnFavorites selectDsgnFavoritesById(Long id)
    {
        return dsgnFavoritesMapper.selectDsgnFavoritesById(id);
    }

    /**
     * 查询用户收藏列表
     * 
     * @param dsgnFavorites 用户收藏
     * @return 用户收藏
     */
    @Override
    public List<DsgnFavorites> selectDsgnFavoritesList(DsgnFavorites dsgnFavorites)
    {
        return dsgnFavoritesMapper.selectDsgnFavoritesList(dsgnFavorites);
    }

    /**
     * 新增用户收藏
     * 
     * @param dsgnFavorites 用户收藏
     * @return 结果
     */
    @Override
    public int insertDsgnFavorites(DsgnFavorites dsgnFavorites)
    {
        return dsgnFavoritesMapper.insertDsgnFavorites(dsgnFavorites);
    }

    /**
     * 修改用户收藏
     * 
     * @param dsgnFavorites 用户收藏
     * @return 结果
     */
    @Override
    public int updateDsgnFavorites(DsgnFavorites dsgnFavorites)
    {
        return dsgnFavoritesMapper.updateDsgnFavorites(dsgnFavorites);
    }

    /**
     * 批量删除用户收藏
     * 
     * @param ids 需要删除的用户收藏主键
     * @return 结果
     */
    @Override
    public int deleteDsgnFavoritesByIds(Long[] ids)
    {
        return dsgnFavoritesMapper.deleteDsgnFavoritesByIds(ids);
    }

    /**
     * 删除用户收藏信息
     * 
     * @param id 用户收藏主键
     * @return 结果
     */
    @Override
    public int deleteDsgnFavoritesById(Long id)
    {
        return dsgnFavoritesMapper.deleteDsgnFavoritesById(id);
    }
}
