<template>
  <el-container>
    <el-aside width="300px">
      <el-input
        v-model="searchQuery"
        placeholder="搜索用户"
        @input="searchUsers"
      ></el-input>
      <el-table :data="filteredUsers" style="width: 100%">
        <el-table-column prop="userName" label="用户名"></el-table-column>
        <el-table-column fixed="right" label="操作" width="100">
          <template slot-scope="scope">
            <el-button @click="startChat(scope.row)" type="text" size="small"
            >聊天</el-button
            >
          </template>
        </el-table-column>
      </el-table>
    </el-aside>
    <el-main>
      <div v-if="currentChat">
        <h3>与 {{ currentChat.userName }} 的对话</h3>
        <div class="chat-messages" ref="chatMessages">
          <div v-for="(message, index) in chatMessages" :key="index" class="message" :class="{ 'unread': message.isUnread }">
            <strong>{{ message.sender }}:</strong> {{ message.content }}
          </div>
        </div>
        <el-input
          v-model="newMessage"
          placeholder="输入消息"
          @keyup.enter.native="sendMessage"
        >
          <el-button slot="append" @click="sendMessage">发送</el-button>
        </el-input>
      </div>
      <div v-else>
        <p>选择一个用户开始聊天</p>
      </div>
    </el-main>
  </el-container>
</template>

<script>
import { mapState } from 'vuex'
import { listUser } from '@/api/system/user'
import { getUserConversations, getMessages, sendMessage, markConversationAsRead, initializeWebSocket } from '@/api/chat/chat'

export default {
  data() {
    return {
      users: [],
      filteredUsers: [],
      searchQuery: '',
      currentChat: null,
      chatMessages: [],
      newMessage: '',
      webSocket: null,
      conversations: [],
    }
  },
  computed: {
    ...mapState({
      currentUserId: state => state.user.id,
      currentUserName: state => state.user.name,
    })
  },
  created() {
    this.getUsers()
    this.getConversations()
    this.initWebSocket()
  },
  methods: {
    // 在 methods 中
    initWebSocket() {
      this.stompClient = initializeWebSocket(this.currentUserId, this.handleWebSocketMessage)
    },
    handleWebSocketMessage(data) {
      // 处理接收到的消息
      if (this.currentChat && data.senderId === this.currentChat.userId) {
        this.chatMessages.push({
          sender: this.currentChat.userName,
          content: data.content,
          isUnread: true
        })
        this.scrollToBottom()
      }
      // 更新会话列表中的最后一条消息
      this.updateConversationLastMessage(data.senderId, data.content)
    },
    updateConversationLastMessage(senderId, content) {
      const conversation = this.conversations.find(c => c.user1Id === senderId || c.user2Id === senderId)
      if (conversation) {
        conversation.lastMessage = content
        conversation.unreadCount += 1
      }
    },
    async getUsers() {
      try {
        const response = await listUser({ pageNum: 1, pageSize: 100 })
        this.users = response.rows.filter(user => user.userId !== this.currentUserId)
        this.filteredUsers = this.users
      } catch (error) {
        console.error('获取用户列表失败:', error)
      }
    },
    async getConversations() {
      try {
        this.conversations = await getUserConversations(this.currentUserId)
      } catch (error) {
        console.error('获取会话列表失败:', error)
      }
    },
    searchUsers() {
      this.filteredUsers = this.users.filter(user =>
        user.userName.toLowerCase().includes(this.searchQuery.toLowerCase())
      )
    },
    async startChat(user) {
      this.currentChat = user
      try {
        const conversation = this.conversations.find(c =>
          c.user1Id === user.userId || c.user2Id === user.userId
        )
        if (conversation) {
          const messages = await getMessages(conversation.id)
          this.chatMessages = messages.map(m => ({
            sender: m.senderId === this.currentUserId ? '我' : user.userName,
            content: m.content,
            isUnread: !m.isRead && m.senderId !== this.currentUserId
          }))
          await markConversationAsRead(conversation.id, this.currentUserId)
          conversation.unreadCount = 0
        } else {
          this.chatMessages = []
        }
        this.$nextTick(() => {
          this.scrollToBottom()
        })
      } catch (error) {
        console.error('获取聊天记录失败:', error)
      }
    },
    async sendMessage() {
      if (!this.newMessage.trim()) return

      try {
        const sentMessage = await sendMessage({
          senderId: this.currentUserId,
          receiverId: this.currentChat.userId,
          content: this.newMessage
        })
        this.chatMessages.push({
          sender: '我',
          content: this.newMessage,
          isUnread: false
        })
        this.newMessage = ''
        this.$nextTick(() => {
          this.scrollToBottom()
        })
        // 更新会话列表中的最后一条消息
        this.updateConversationLastMessage(this.currentUserId, sentMessage.content)
      } catch (error) {
        console.error('发送消息失败:', error)
      }
    },
    scrollToBottom() {
      const chatMessages = this.$refs.chatMessages
      chatMessages.scrollTop = chatMessages.scrollHeight
    }
  },
  // 在 beforeDestroy 钩子中
  beforeDestroy() {
    if (this.stompClient) {
      this.stompClient.disconnect()
    }
  }
}
</script>

<style scoped>
.chat-messages {
  height: 400px;
  overflow-y: auto;
  border: 1px solid #dcdfe6;
  padding: 10px;
  margin-bottom: 10px;
}
.message {
  margin-bottom: 10px;
}
.unread {
  font-weight: bold;
}
</style>
