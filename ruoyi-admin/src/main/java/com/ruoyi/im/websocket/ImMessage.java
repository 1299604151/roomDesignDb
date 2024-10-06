package com.ruoyi.im.websocket;

import lombok.Data;

@Data
public class ImMessage {

    private Integer messageType;

    private String content;

    private Long fromId;

    private Long toId;

    private Integer groupId;

    private String avatar;

    private String username;


    /**
     * 已读 true
     * 未读  false
     * */
    private Boolean messageStatus;
}
