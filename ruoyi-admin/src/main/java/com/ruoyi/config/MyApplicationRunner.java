package com.ruoyi.config;

import com.ruoyi.im.websocket.TioUtil;
import com.ruoyi.im.websocket.TioWebsocketStarter;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.stereotype.Component;

@Component
public class MyApplicationRunner implements ApplicationRunner {

    @Override
    public void run(ApplicationArguments args) throws Exception {
        // 在这里执行您的初始化逻辑
        System.out.println("MyApplicationRunner is executing...");
        // 启动tio  websocket
        TioUtil.buildTio();
        TioWebsocketStarter websocketStarter = TioUtil.getTio();
        if (websocketStarter != null) {
            websocketStarter.start();
        }
    }
}

