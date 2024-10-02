import request from '@/utils/request'
import { getToken } from '@/utils/auth'
// 获取用户的对话列表
export function getUserConversations(userId) {
  return request({
    url: '/api/chat/conversations/' + userId,
    method: 'get'
  })
}

// 获取特定对话的消息
export function getMessages(conversationId, page = 0, size = 20) {
  return request({
    url: '/api/chat/messages/' + conversationId,
    method: 'get',
    params: { page, size }
  })
}

// 发送消息
export function sendMessage(data) {
  return request({
    url: '/api/chat/messages',
    method: 'post',
    data: data
  })
}

// 将对话标记为已读
export function markConversationAsRead(conversationId, userId) {
  return request({
    url: `/api/chat/conversations/${conversationId}/read`,
    method: 'put',
    params: { userId }
  })
}

// 初始化WebSocket连接
export function initializeWebSocket(userId, onMessageReceived) {
  const socket = new WebSocket('ws://localhost:8080/ws?userId='+userId);

  socket.onopen = function(event) {
    console.log('WebSocket is connected.');
    // 发送订阅消息
    const subscribeMsg = JSON.stringify({
      command: 'SUBSCRIBE',
      destination: `/user/${userId}/queue/messages`
    });
    socket.send(subscribeMsg);
  };

  socket.onmessage = function(event) {
    const data = JSON.parse(event.data);
    onMessageReceived(data);
  };

  socket.onerror = function(error) {
    console.error('WebSocket Error: ', error);
  };

  socket.onclose = function(event) {
    console.log('WebSocket is closed. Reconnect will be attempted in 5 seconds.', event.reason);
    setTimeout(function() {
      initializeWebSocket(userId, onMessageReceived);
    }, 5000);
  };

  return socket;
}


