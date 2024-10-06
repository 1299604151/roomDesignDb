package com.ruoyi.im.http.controller;


import com.baomidou.mybatisplus.extension.conditions.query.LambdaQueryChainWrapper;

import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.core.domain.model.LoginUser;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.im.http.entity.ImChatUserFriend;
import com.ruoyi.im.http.service.ImChatUserFriendService;
import com.ruoyi.im.http.vo.UserFriendVO;
import com.ruoyi.im.websocket.ImConfigConst;


import com.ruoyi.system.service.ISysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 * 好友 前端控制器
 * </p>
 *
 * @author sara
 * @since 2021-12-02
 */
@RestController
@RequestMapping("/imChatUserFriend")
public class ImChatUserFriendController {

    @Autowired
    private ImChatUserFriendService userFriendService;
    @Autowired
    ISysUserService userService;
    @Value("${staticPath}")
    private String staticPath;

    /**
     * 添加好友申请
     */
    @GetMapping("/addFriend")
    
    public AjaxResult addFriend(@RequestParam("friendId") Long friendId, @RequestParam(value = "remark", required = false) String remark) {
        SysUser friend = userService.selectUserById(friendId);

        if (friend == null) {
            return AjaxResult.error("用户不存在！");
        }

        // 获取当前登录的用户
        LoginUser loginUser = SecurityUtils.getLoginUser();
        Long userId = loginUser.getUserId();

        Long count = userFriendService.lambdaQuery()
                .and(wrapper -> wrapper.eq(ImChatUserFriend::getUserId, userId).eq(ImChatUserFriend::getFriendId, friendId))
                .or(wrapper -> wrapper.eq(ImChatUserFriend::getFriendId, userId).eq(ImChatUserFriend::getUserId, friendId))
                .count();
        if (count > 0) {
            return AjaxResult.success();
        }

        ImChatUserFriend imChatFriend = new ImChatUserFriend();
        imChatFriend.setUserId(friendId);
        imChatFriend.setFriendId(userId);
        imChatFriend.setFriendStatus(ImConfigConst.FRIEND_STATUS_NOT_VERIFY);
        imChatFriend.setRemark(remark);
        userFriendService.save(imChatFriend);
        return AjaxResult.success();
    }

    /**
     * 查询好友
     */
    @GetMapping("/getFriend")
    
    public AjaxResult getFriend(@RequestParam(value = "friendStatus", required = false) Integer friendStatus) {
        LoginUser loginUser = SecurityUtils.getLoginUser();
        Long userId = loginUser.getUserId();
        LambdaQueryChainWrapper<ImChatUserFriend> wrapper = userFriendService.lambdaQuery().eq(ImChatUserFriend::getUserId, userId);
        if (friendStatus != null) {
            wrapper.eq(ImChatUserFriend::getFriendStatus, friendStatus);
        }

        List<ImChatUserFriend> userFriends = wrapper.orderByDesc(ImChatUserFriend::getCreateTime).list();
        List<UserFriendVO> userFriendVOS = new ArrayList<>(userFriends.size());
        userFriends.forEach(userFriend -> {
            SysUser friend = userService.selectUserById(userFriend.getFriendId());
//            User friend = commonQuery.getUser(userFriend.getFriendId());
            if (friend != null) {
                UserFriendVO userFriendVO = new UserFriendVO();
                userFriendVO.setId(userFriend.getId());
                userFriendVO.setUserId(userFriend.getUserId());
                userFriendVO.setFriendId(userFriend.getFriendId());
                userFriendVO.setCreateTime(userFriend.getCreateTime());
                userFriendVO.setRemark(StringUtils.hasText(userFriend.getRemark()) ? userFriend.getRemark() : friend.getUserName());
                userFriendVO.setFriendStatus(userFriend.getFriendStatus());
                userFriendVO.setUsername(friend.getUserName());
                userFriendVO.setAvatar(staticPath+friend.getAvatar());
                userFriendVO.setGender(friend.getSex());
                userFriendVO.setIntroduction(friend.getRemark());
                userFriendVOS.add(userFriendVO);
            }
        });
        return AjaxResult.success(userFriendVOS);
    }

    /**
     * 修改好友
     * <p>
     * 朋友状态[-1:审核不通过或者删除好友，0:未审核，1:审核通过]
     */
    @GetMapping("/changeFriend")
    
    public AjaxResult changeFriend(@RequestParam("friendId") Long friendId,
                                     @RequestParam(value = "friendStatus", required = false) Integer friendStatus,
                                     @RequestParam(value = "remark", required = false) String remark) {
        LoginUser loginUser = SecurityUtils.getLoginUser();
        Long userId = loginUser.getUserId();
        ImChatUserFriend userFriend = userFriendService.lambdaQuery()
                .eq(ImChatUserFriend::getUserId, userId)
                .eq(ImChatUserFriend::getFriendId, friendId).one();

        if (userFriend == null) {
            return AjaxResult.error("好友不存在！");
        }

        if (friendStatus != null) {
            if (friendStatus == ImConfigConst.FRIEND_STATUS_PASS) {
                userFriendService.lambdaUpdate()
                        .set(ImChatUserFriend::getFriendStatus, friendStatus)
                        .eq(ImChatUserFriend::getId, userFriend.getId()).update();

                ImChatUserFriend imChatFriend = new ImChatUserFriend();
                imChatFriend.setUserId(friendId);
                imChatFriend.setFriendId(userId);
                imChatFriend.setFriendStatus(ImConfigConst.FRIEND_STATUS_PASS);
                userFriendService.save(imChatFriend);
            }

            if (friendStatus == ImConfigConst.FRIEND_STATUS_BAN) {
                userFriendService.removeById(userFriend.getId());
                userFriendService.lambdaUpdate()
                        .eq(ImChatUserFriend::getUserId, friendId)
                        .eq(ImChatUserFriend::getFriendId, userId).remove();
            }
        }

        if (StringUtils.hasText(remark)) {
            userFriendService.lambdaUpdate()
                    .set(ImChatUserFriend::getRemark, remark)
                    .eq(ImChatUserFriend::getId, userFriend.getId()).update();
        }


        return AjaxResult.success();
    }
}

