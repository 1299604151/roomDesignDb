package com.ruoyi.system.service;

import java.util.List;

import com.baomidou.mybatisplus.extension.service.IService;
import com.ruoyi.system.domain.DsgnFavorites;

/**
 * 用户收藏Service接口
 * 
 * @author ruoyi
 * @date 2024-10-06 16:51:17
 */
public interface IDsgnFavoritesService extends IService<DsgnFavorites>
{
    /**
     * 查询用户收藏
     * 
     * @param id 用户收藏主键
     * @return 用户收藏
     */
    public DsgnFavorites selectDsgnFavoritesById(Long id);

    /**
     * 查询用户收藏列表
     * 
     * @param dsgnFavorites 用户收藏
     * @return 用户收藏集合
     */
    public List<DsgnFavorites> selectDsgnFavoritesList(DsgnFavorites dsgnFavorites);

    /**
     * 新增用户收藏
     * 
     * @param dsgnFavorites 用户收藏
     * @return 结果
     */
    public int insertDsgnFavorites(DsgnFavorites dsgnFavorites);

    /**
     * 修改用户收藏
     * 
     * @param dsgnFavorites 用户收藏
     * @return 结果
     */
    public int updateDsgnFavorites(DsgnFavorites dsgnFavorites);

    /**
     * 批量删除用户收藏
     * 
     * @param ids 需要删除的用户收藏主键集合
     * @return 结果
     */
    public int deleteDsgnFavoritesByIds(Long[] ids);

    /**
     * 删除用户收藏信息
     * 
     * @param id 用户收藏主键
     * @return 结果
     */
    public int deleteDsgnFavoritesById(Long id);
}
