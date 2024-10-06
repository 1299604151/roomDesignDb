<template>
  <div class="friend-wrap">
    <div class="friend-box" v-if="!$common.isEmpty($store.state.user)">
      <div class="friend-aside">
        <div>
          <!-- 头像 -->
          <div>
            <el-avatar @click="changeAvatar(1)" class="user-thumb"
                       :src="$store.state.user.avatar"/>
          </div>
          <!-- 聊天 -->
          <div id="chat" class="friend-chat aside-active" @click="isActive($event, 'aside-active', 1)">
            <div>
              <svg viewBox="0 0 1024 1024" width="24" height="24">
                <!-- SVG path data -->
              </svg>
            </div>
            <div class="friend-text">聊天</div>
          </div>
          <!-- 好友 -->
          <div class="friend-chat" @click="isActive($event, 'aside-active', 2)">
            <div>
              <svg viewBox="0 0 1024 1024" width="24" height="24">
                <!-- SVG path data -->
              </svg>
            </div>
            <div class="friend-text">好友</div>
          </div>
          <!-- 群聊 -->
<!--          <div class="friend-chat" @click="isActive($event, 'aside-active', 3)">-->
<!--            <div>-->
<!--              <svg viewBox="0 0 1024 1024" width="24" height="24">-->
<!--                &lt;!&ndash; SVG path data &ndash;&gt;-->
<!--              </svg>-->
<!--            </div>-->
<!--            <div class="friend-text">群聊</div>-->
<!--          </div>-->
        </div>
        <div class="friend-set">
          <!-- 设置 -->
          <div @click.stop="changeAside()">
            <svg viewBox="0 0 1024 1024" width="24" height="24">
              <!-- SVG path data -->
            </svg>
          </div>
        </div>
      </div>
      <div class="friend-bode" id="body-group">
        <div class="body-left" v-show="showBodyLeft">
          <!-- 搜索 -->
          <div>
            <el-input v-model="showFriendValue" round placeholder="搜索" class="im-input"></el-input>
          </div>
          <!-- 聊天 -->
          <div class="aside-list" v-show="type === 1">
            <!-- 系统消息 -->
            <!--            <div class="im-user im-active" @click="isActive($event, 'im-active', null, 1)">-->
            <!--              <div>-->
            <!--                <svg viewBox="0 0 1024 1024" width="40" height="40">-->
            <!--                  &lt;!&ndash; SVG path data &ndash;&gt;-->
            <!--                </svg>-->
            <!--              </div>-->
            <!--              <div class="im-user-right">-->
            <!--                <div>系统消息</div>-->
            <!--              </div>-->
            <!--            </div>-->
            <div style="overflow-y: scroll;height: 100%;">
              <!-- 群聊天 -->
              <div class="im-user im-group-current"
                   v-for="(item, index) in groupChats"
                   :key="index"
                   v-show="groups[item].groupName.includes(showFriendValue) || $common.isEmpty(showFriendValue)"
                   @click="isActive($event, 'im-active', null, 2, item, 1)">
                <div>
                  <el-badge :value="groupMessageBadge[item]" :max="99">
                    <el-avatar
                      :size="40"
                      :src="groups[item].avatar"/>
                  </el-badge>
                </div>
                <div class="im-user-right">
                  <div>{{ groups[item].groupName }}</div>
                  <div class="im-down" v-if="!$common.isEmpty(groupMessages[item])">
                    {{ groupMessages[item][groupMessages[item].length - 1].content.substr(0, 8) }}
                  </div>
                </div>
              </div>
              <!-- 聊天 -->
              <div class="im-user im-user-current"
                   v-for="(item, index) in imChats"
                   :key="index"
                   v-show="friends[item].remark.includes(showFriendValue) || $common.isEmpty(showFriendValue)"
                   @click="isActive($event, 'im-active', null, 2, item, 2)">
                <div>
                  <el-badge :value="imMessageBadge[item]" v-if="imMessageBadge[item]>0" :max="99">
                    <el-avatar
                      :size="40"
                      :src="friends[item].avatar"/>
                  </el-badge>
                  <el-avatar
                    v-else
                    :size="40"
                    :src="friends[item].avatar"/>
                </div>
                <div class="im-user-right">
                  <div>{{ friends[item].remark }}</div>
                  <div class="im-down" v-if="!$common.isEmpty(imMessages[item])">
                    {{ imMessages[item][imMessages[item].length - 1].content.substr(0, 8) }}
                  </div>
                </div>
              </div>
            </div>
          </div>
          <!-- 好友 -->
          <div class="aside-list" v-show="type === 2">
            <!-- 添加好友 -->
<!--            <div class="im-user friend-active" @click="isActive($event, 'friend-active', null, 3)">-->
<!--              <div>-->
<!--                <svg viewBox="0 0 1024 1024" width="40" height="40">-->
<!--                  &lt;!&ndash; SVG path data &ndash;&gt;-->
<!--                </svg>-->
<!--              </div>-->
<!--              <div class="im-friend">-->
<!--                好友请求-->
<!--              </div>-->
<!--            </div>-->
            <div style="margin: 0 30px 0 30px">
              <el-divider>
                {{ Object.keys(friends).length }}位联系人
              </el-divider>
            </div>
            <!-- 好友列表 -->
            <div style="overflow-y: scroll;height: calc(100% - 140px)">
              <div class="im-user"
                   v-for="(item, index) in Object.values(friends).reverse()"
                   :key="index"
                   v-show="item.remark.includes(showFriendValue) || $common.isEmpty(showFriendValue)"
                   @click="isActive($event, 'friend-active', null, 4, item)">
                <div>
                  <el-avatar
                    :size="40"
                    :src="item.avatar"/>
                </div>
                <div class="im-friend">
                  {{ item.remark }}
                </div>
              </div>
            </div>
          </div>
          <!-- 群聊 -->
          <div class="aside-list" v-show="type === 3">
            <div style="margin: 0 30px 0 30px">
              <el-divider>
                {{ Object.keys(groups).length }}个群聊
              </el-divider>
            </div>
            <div class="im-user-group"
                 v-for="(item, index) in Object.values(groups).reverse()"
                 :key="index"
                 v-show="item.groupName.includes(showFriendValue) || $common.isEmpty(showFriendValue)"
                 @click="isActive($event, 'im-group', null, 5, item)">
              <div>
                <el-avatar
                  :size="45"
                  :src="item.avatar"/>
              </div>
              <div class="im-user-right">
                <div>{{ item.groupName }}</div>
                <div class="im-down">
                  <span class="group-tag" v-if="item.masterFlag || item.adminFlag">
                    <template v-if="item.masterFlag">
                      群主
                    </template>
                    <template v-else-if="item.adminFlag">
                      管理员
                    </template>
                  </span>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="body-right" v-if="subType === 1">
          <div style="height: 60px;background-color: var(--maxWhite)">
            <span style="line-height: 60px;margin-left: 20px;font-size: 18px">系统消息</span>
          </div>
          <div style="background: var(--midWhite);overflow-y: scroll;height: calc(100% - 60px);">
            <div class="msg-one"
                 v-for="(item, index) in systemMessages"
                 :key="index">
              <!-- 图标 -->
              <div>
                <svg viewBox="0 0 1024 1024" width="50" height="50">
                  <!-- SVG path data -->
                </svg>
              </div>
              <!-- 内容 -->
              <div style="margin-left: 10px">
                <div class="system-date">
                  {{ item.createTime }}
                </div>
                <div class="system-content">
                  {{ item.content }}
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- 聊天 -->
        <chat class="body-right"
              v-if="subType === 2 && (!$common.isEmpty(currentChatFriendId) || !$common.isEmpty(currentChatGroupId))"
              :currentChatFriendId="currentChatFriendId"
              :currentChatGroupId="currentChatGroupId"
              :friends="friends"
              :groups="groups"
              :imageList="imageList"
              :imMessages="imMessages"
              :groupMessages="groupMessages"
              @sendMsg="sendMsg"
        ></chat>
        <div class="body-right" v-if="subType === 3">
<!--          <div style="height: 60px;background-color: var(&#45;&#45;maxWhite)">-->
<!--            <span style="line-height: 60px;margin-left: 20px;font-size: 18px">-->
<!--              好友请求-->
<!--            </span>-->
<!--          </div>-->
          <div class="friend-request">
            <div style="margin: 20px;display: flex"
                 v-for="(item, index) in friendRequests"
                 :key="index">
              <!-- 图标 -->
              <div>
                <el-avatar
                  :size="50"
                  :src="item.avatar"/>
              </div>
              <!-- 内容 -->
              <div style="display: flex;flex: 1">
                <div style="margin-left: 10px">
                  <div style="font-size: 16px;margin-bottom: 4px">
                    {{ item.username }}
                  </div>
                  <div style="font-size: 12px;color: var(--greyFont)">
                    {{ item.remark }}&nbsp;&nbsp;|&nbsp;&nbsp;{{ item.createTime }}
                  </div>
                </div>
                <div class="request-status">
                  <el-button @click="changeFriendStatus(item.friendId, 1, index)" size="small" type="primary"
                             style="margin-right: 10px">
                    通过
                  </el-button>
                  <el-button @click="changeFriendStatus(item.friendId, -1, index)" size="small" type="danger">
                    拒绝
                  </el-button>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="body-right" v-if="subType === 4 && !$common.isEmpty(currentFriendId)">
          <div style="height: 60px;background-color: var(--maxWhite)">
            <span style="line-height: 60px;margin-left: 20px;font-size: 18px">
              {{ friends[currentFriendId].remark }}
            </span>
          </div>
          <div style="background: var(--midWhite);height: calc(100% - 60px)">
            <div class="myCenter">
              <div class="friend-info">
                <div style="display: flex;align-items: center">
                  <el-avatar
                    :size="60"
                    :src="friends[currentFriendId].avatar"/>
                  <span style="margin: 0 5px 0 15px;font-size: 16px">{{ friends[currentFriendId].remark }}</span>
                  <span style="cursor: pointer;margin-top: 6px" @click="changeDataType(1)">
                    <svg viewBox="0 0 1024 1024" width="20" height="20">
                      <!-- SVG path data -->
                    </svg>
                  </span>
                </div>
                <div style="margin-top: 4px;cursor: pointer" @click="removeFriend(currentFriendId)">
                  <span style="vertical-align: -4px;margin-right: 2px">
                    <svg viewBox="0 0 1024 1024" width="20" height="20">
                      <!-- SVG path data -->
                    </svg>
                  </span>
                  <span style="color: var(--greyFont)">删除好友</span>
                </div>
              </div>
            </div>
            <el-divider></el-divider>
            <div class="myCenter">
              <div style="width: 65%;font-size: 16px">
                <div style="margin-bottom: 10px">
                  <span class="friend-label">用户名</span>
                  <span>{{ friends[currentFriendId].username }}</span>
                </div>
                <div style="margin-bottom: 10px">
                  <span class="friend-label">
                    性&nbsp;&nbsp;&nbsp;别
                  </span>
                  <span>
                    <template v-if="friends[currentFriendId].gender === 1">
                      男
                    </template>
                    <template v-else-if="friends[currentFriendId].gender === 2">
                      女
                    </template>
                    <template v-else>
                      薛定谔的猫
                    </template>
                  </span>
                </div>
                <div>
                  <span class="friend-label">简&nbsp;&nbsp;&nbsp;介</span>
                  <span>{{ $common.isEmpty(friends[currentFriendId].introduction) ? '暂无简介' : friends[currentFriendId].introduction }}</span>
                </div>
              </div>
            </div>
            <el-divider></el-divider>
            <div class="myCenter sendMsg">
              <el-button @click="sendFriendMessage()" type="info">
                发消息
              </el-button>
            </div>
          </div>
        </div>
        <!-- 群 -->
        <groupInfo class="body-right"
                   v-if="subType === 5 && !$common.isEmpty(currentGroupId)"
                   :groups="groups"
                   :currentGroupId="currentGroupId"
                   @exitGroup="exitGroup"
                   @dissolveGroup="dissolveGroup"
                   @changeDataType="changeDataType"
                   @sendGroupMessage="sendGroupMessage"
                   @changeAvatar="changeAvatar"></groupInfo>

        <!-- 头像修改弹出框 -->
        <el-dialog :visible.sync="showAvatarDialog">
          <div style="padding: 40px;background: var(--white);border-radius: 5px;width: 20%">
            <div style="margin: 0 0 25px;text-align: center;font-size: 18px">上传图片</div>
            <uploadPicture :prefix="avatarPrefix" @addPicture="submitAvatar" :maxSize="1"
                           :maxNumber="1"></uploadPicture>
          </div>
        </el-dialog>

        <!-- 修改信息 -->
        <el-dialog :visible.sync="changeModal">
          <div style="background-color: var(--white);padding: 20px;border-radius: 5px">
            <div style="text-align: center;font-size: 20px;padding: 20px">
              修改信息
            </div>
            <div>
              <el-input v-model="changeData" maxlength="30" show-word-limit clearable/>
            </div>
            <div class="myCenter" style="margin-top: 30px">
              <el-button @click="submitChange()" type="primary">
                提交
              </el-button>
            </div>
          </div>
        </el-dialog>
      </div>
    </div>

    <div id="outerImg">
      <div id="innerImg" style="position:absolute">
        <img id="bigImg" src=""/>
      </div>
    </div>
  </div>
</template>

<script>
import Im from "@/utils/im/im";
import friend from "@/utils/im/hooks/friend";
import group from "@/utils/im/hooks/group";
import imUtil from "@/utils/im/hooks/imUtil";
import changeData from "@/utils/im/hooks/changeData";
import constant from "@/utils/im/constant";
import proButton from "./common/proButton";
import commentBox from "./common/commentBox";
import uploadPicture from "./common/uploadPicture";
import chat from "./common/chat";
import groupInfo from "./common/groupInfo";
import request from '@/utils/request'
import im from "@/utils/im/im";

export default {
  mixins: [friend, group, imUtil, changeData],
  components: {
    proButton,
    commentBox,
    uploadPicture,
    chat,
    groupInfo
  },
  data() {
    return {
      constant,
      imMessages: {},
      imMessageBadge: {},
      imChats: [],
      imChatsInit:[],
      currentChatFriendId: null,
      groupMessages: {},
      groupMessageBadge: {},
      groupChats: [],
      currentChatGroupId: null,
      type: 1,
      subType: 1,
      showFriendValue: '',
      systemMessages: [],
      showBodyLeft: true,
      imageList: [],
      friends: {},
      currentFriendId: null,
      friendRequests: [],
      groups: {},
      currentGroupId: null,
      changeData: '',
      changeType: null,
      changeModal: false,
      avatarType: null,
      avatarPrefix: '',
      showAvatarDialog: false,
    }
  },
  methods: {
    async getFriendAndGroup() {
      await this.getImFriend();
      await this.getImGroup();
      await this.$nextTick();
      this.getIm();
    },
    getIm() {
      this.im = new Im();
      this.im.initWs();
      this.im.tio.ws.onmessage = (event) => {
        let message = JSON.parse(event.data);
        message.content = this.parseMessage(message.content);
        if (message.messageType === 1) {
          this.handleFriendMessage(message);
        } else if (message.messageType === 2 && (this.groups[message.groupId] !== null && this.groups[message.groupId] !== undefined)) {
          this.handleGroupMessage(message);
        }
      }
    },
    handleFriendMessage(message) {
      if (message.fromId === this.$store.state.user.id && (this.friends[message.toId] !== null && this.friends[message.toId] !== undefined)) {
        if (this.imMessages[message.toId] === null || this.imMessages[message.toId] === undefined) {
          this.$set(this.imMessages, message.toId, []);
        }
        this.imMessages[message.toId].push(message);

        const index = this.imChats.indexOf(message.toId);
        if (index > -1) {
          this.imChats.splice(index, 1);
        }
        this.imChats.unshift(message.toId);
        this.isActive(document.getElementsByClassName('im-user-current')[0], 'im-active', null, 2, message.toId, 2);
      } else if (message.fromId !== this.$store.state.user.id && (this.friends[message.fromId] !== null && this.friends[message.fromId] !== undefined)) {
        if (this.imMessages[message.fromId] === null || this.imMessages[message.fromId] === undefined) {
          const index = this.imChats.indexOf(message.fromId);
          if (index > -1) {
            this.imChats.splice(index, 1);
          }
          this.imChats.unshift(message.fromId);
          this.$set(this.imMessages, message.fromId, []);
          this.$set(this.imChatsInit, message.fromId, false);
        }
        this.imMessages[message.fromId].push(message);

        if (this.subType !== 2 || this.currentChatFriendId !== message.fromId) {
          debugger
          if(!message.messageStatus){
            if (this.imMessageBadge[message.fromId] === null || this.imMessageBadge[message.fromId] === undefined) {
              this.$set(this.imMessageBadge, message.fromId, 1);
            } else {
              this.imMessageBadge[message.fromId]++;
            }
          }
        }
      }

      this.$nextTick(() => {
        let msgContainer = document.getElementsByClassName('msg-container');
        if (msgContainer && msgContainer.length > 0) {
          msgContainer[0].scrollTop = msgContainer[0].scrollHeight;
        }
        this.imgShow();
      });
    },
    handleGroupMessage(message) {
      if (this.groupMessages[message.groupId] === null || this.groupMessages[message.groupId] === undefined) {
        this.$set(this.groupMessages, message.groupId, []);
      }
      this.groupMessages[message.groupId].push(message);

      if (message.fromId === this.$store.state.user.id || this.groupMessages[message.groupId] === null || this.groupMessages[message.groupId] === undefined) {
        const index = this.groupChats.indexOf(message.groupId);
        if (index > -1) {
          this.groupChats.splice(index, 1);
        }
        this.groupChats.unshift(message.groupId);
        this.isActive(document.getElementsByClassName('im-group-current')[0], 'im-active', null, 2, message.groupId, 1);
      }

      if ((this.subType !== 2 || this.currentChatGroupId !== message.groupId) && message.fromId !== this.$store.state.user.id) {
        if (this.groupMessageBadge[message.groupId] === null || this.groupMessageBadge[message.groupId] === undefined) {
          this.$set(this.groupMessageBadge, message.groupId, 1);
        } else {
          this.groupMessageBadge[message.groupId]++;
        }
      }

      this.$nextTick(() => {
        let msgContainer = document.getElementsByClassName('msg-container');
        if (msgContainer && msgContainer.length > 0) {
          msgContainer[0].scrollTop = msgContainer[0].scrollHeight;
        }
        this.imgShow();
      });
    },
    sendMsg(msg, callback) {
      let success = this.im.sendMsg(msg);
      callback(success);
    },
    isActive(e, className, type, subType, current, imType) {

      if (!this.$common.isEmpty(type)) {
        this.type = type;
        let actives = ["im-active", "friend-active", "im-group"];
        for (let activeClass of actives) {
          for (let tab of document.getElementsByClassName(activeClass)) {
            tab.classList.remove(activeClass);
          }
        }
      }

      if (!this.$common.isEmpty(subType)) {
        this.subType = subType;
        if (subType === 4 && !this.$common.isEmpty(current)) {
          this.currentFriendId = current.friendId;
        }
        if (subType === 5 && !this.$common.isEmpty(current)) {
          this.currentGroupId = current.id;
        }

        if (subType === 2 && !this.$common.isEmpty(current) && !this.$common.isEmpty(imType)) {
          if (imType === 1) {

            this.currentChatFriendId = null;
            this.currentChatGroupId = current;
            this.$set(this.groupMessageBadge, current, 0);
          } else if (imType === 2) {
            if(!this.imChatsInit[current]){
              this.imChatsInit[current] = true;
              this.getMessagesNo(current)
            }
            this.currentChatGroupId = null;
            this.currentChatFriendId = current;
            this.$set(this.imMessageBadge, current, 0);
          }
        }
        this.$nextTick(() => {
          let msgContainer = document.getElementsByClassName('msg-container');
          if (msgContainer && msgContainer.length > 0) {
            msgContainer[0].scrollTop = msgContainer[0].scrollHeight;
          }
          this.imgShow();
          this.mobileRight();
          this.hiddenBodyLeft();
        });
      }

      for (const tab of document.getElementsByClassName(className)) {
        tab.classList.remove(className);
      }

      if (e instanceof HTMLElement) {
        e.classList.add(className);
      } else {
        let node = e.currentTarget;
        node.classList.add(className);
      }
    },
    async sendFriendMessage() {
      const index = this.imChats.indexOf(this.currentFriendId);
      if (index > -1) {
        this.imChats.splice(index, 1);
      }
      this.imChats.unshift(this.currentFriendId);
      await this.$nextTick();
      this.isActive(document.getElementById('chat'), 'aside-active', 1);
      this.isActive(document.getElementsByClassName('im-user-current')[0], 'im-active', null, 2, this.currentFriendId, 2);
      this.getMessages(this.currentFriendId);
    },
    async sendGroupMessage() {
      const index = this.groupChats.indexOf(this.currentGroupId);
      if (index > -1) {
        this.groupChats.splice(index, 1);
      }
      this.groupChats.unshift(this.currentGroupId);
      await this.$nextTick();
      this.isActive(document.getElementById('chat'), 'aside-active', 1);
      this.isActive(document.getElementsByClassName('im-group-current')[0], 'im-active', null, 2, this.currentGroupId, 1);
      this.getGroupMessages(this.currentGroupId);
      if (this.groups[this.currentGroupId].groupType === 2) {
        this.addGroupTopic();
      }
    },
    getMessagesNo(friendId, current = 1, size = 100) {
      request({
        url: '/imChatUserMessage/listFriendMessage',
        method: 'get',
        params: {
          friendId: friendId,
          current: current,
          size: size
        }
      }).then((res) => {
        if (!this.$common.isEmpty(res.data) && !this.$common.isEmpty(res.data.records)) {
          res.data.records.forEach(message => {
            message.content = this.parseMessage(message.content);
          });
          this.$set(this.imMessages, friendId, res.data.records);
        } else {
          this.$set(this.imMessages, friendId, []);
        }
        this.$nextTick(() => {
          let msgContainer = document.getElementsByClassName('msg-container');
          if (msgContainer && msgContainer.length > 0) {
            msgContainer[0].scrollTop = msgContainer[0].scrollHeight;
          }
          this.imgShow();
        });
      }).catch((error) => {
        this.$message.error(error.message);
      });

    },
    getMessages(friendId, current = 1, size = 100) {
      if (!this.imMessages.hasOwnProperty(friendId)) {
        request({
          url: '/imChatUserMessage/listFriendMessage',
          method: 'get',
          params: {
            friendId: friendId,
            current: current,
            size: size
          }
        }).then((res) => {
          if (!this.$common.isEmpty(res.data) && !this.$common.isEmpty(res.data.records)) {
            res.data.records.forEach(message => {
              message.content = this.parseMessage(message.content);
            });
            this.$set(this.imMessages, friendId, res.data.records);
          } else {
            this.$set(this.imMessages, friendId, []);
          }
          this.$nextTick(() => {
            let msgContainer = document.getElementsByClassName('msg-container');
            if (msgContainer && msgContainer.length > 0) {
              msgContainer[0].scrollTop = msgContainer[0].scrollHeight;
            }
            this.imgShow();
          });
        }).catch((error) => {
          this.$message.error(error.message);
        });
      }
    },
    getGroupMessages(groupId, current = 1, size = 100) {
      if (!this.groupMessages.hasOwnProperty(groupId)) {
        request({
          url: '/imChatUserGroupMessage/listGroupMessage',
          method: 'get',
          params: {
            groupId: groupId,
            current: current,
            size: size
          }
        }).then((res) => {
          if (!this.$common.isEmpty(res.data) && !this.$common.isEmpty(res.data.records)) {
            res.data.records.forEach(message => {
              message.content = this.parseMessage(message.content);
            });
            this.$set(this.groupMessages, groupId, res.data.records);
          } else {
            this.$set(this.groupMessages, groupId, []);
          }
          this.$nextTick(() => {
            let msgContainer = document.getElementsByClassName('msg-container');
            if (msgContainer && msgContainer.length > 0) {
              msgContainer[0].scrollTop = msgContainer[0].scrollHeight;
            }
            this.imgShow();
          });
        }).catch((error) => {
          this.$message.error(error.message);
        });
      }
    },
    handleBeforeUnload() {
      if (this.im !== null && this.im !== undefined) {
        this.im.disconnect();
      }
    },
  },
  created() {
    if (!this.$common.isEmpty(this.$store.state.user)) {
      // todo
      // this.getImageList();
      this.getSystemMessages();
      this.getFriendRequests();
      this.getFriendAndGroup();
      // this.getSysConfig();
    }
  },
  mounted() {
    window.addEventListener('beforeunload', this.handleBeforeUnload);
    if (this.$common.mobile()) {
      $(".friend-aside").click(() => {
        this.showBodyLeft = true;
        this.mobileRight();
      });

      $(".body-right").click(() => {
        this.showBodyLeft = false;
        this.mobileRight();
      });
    }
    this.mobileRight();
  },
  destroyed() {
    if (this.im !== null && this.im !== undefined) {
      this.im.disconnect();
    }
  }
}
</script>


<style scoped>

.friend-wrap {
  background: var(--imBackground) center center / cover no-repeat;
  width: 100vw;
  //height: 100vh;
}

.friend-box {
  display: flex;
  background-color: var(--white);
  border-radius: 10px;
  position: absolute;
  width: 70vw;
  max-width: 1000px;
  height: 80vh;
  top: 50%;
  left: 50%;
  transform: translateX(-50%) translateY(-50%);
  overflow: hidden;
}

.friend-aside {
  width: 60px;
  border-right: 1px solid var(--maxLightGray);
  display: flex;
  flex-direction: column;
  justify-content: space-between;
}

.friend-bode {
  flex: 1;
  display: flex;
}

.body-left {
  width: 260px;
  box-shadow: 3px 0 6px var(--maxLightGray);
}

.body-right {
  flex: 1;
  position: relative;
}

.user-thumb {
  width: 36px;
  height: 36px;
  margin-top: 15px;
  margin-left: 12px;
  cursor: pointer;
}

.friend-chat {
  margin-top: 25px;
  text-align: center;
  cursor: pointer;
}

.friend-text {
  font-size: 13px;
}

.friend-set {
  text-align: center;
  margin-bottom: 20px;
  cursor: pointer;
}

.im-input {
  margin: 13px;
  width: 240px;
}

.im-user {
  display: flex;
  padding: 10px;
  cursor: pointer;
  height: 60px;
  box-sizing: border-box;
}

.im-user-group {
  display: flex;
  padding: 10px;
  cursor: pointer;
  height: 65px;
  box-sizing: border-box;
}

.im-active, .friend-active, .im-group {
  background: var(--imBG);
}

.im-user-right {
  flex: 1;
  margin-left: 20px;
}

.aside-list {
  height: calc(100% - 60px);
}

.im-down {
  margin-top: 3px;
  font-size: 12px;
  color: var(--greyFont);
}

.aside-active {
  color: var(--blue);
  font-weight: 800;
}

.im-friend {
  margin-left: 20px;
  align-self: center;
  font-size: 15px;
}

.body-left >>> .n-divider .n-divider__title {
  color: var(--greyFont);
  font-size: 12px;
  letter-spacing: 2px;
}

.group-tag {
  border-radius: 2px;
  padding: 2px;
  background: var(--themeBackground);
  color: var(--white);
  margin-right: 12px;
}

.msg-one {
  margin: 15px 20px;
  display: flex;
  align-items: flex-start;
}

/* 滚动条 */
.friend-box ::-webkit-scrollbar {
  width: 8px;
  height: 8px;
}

.friend-box ::-webkit-scrollbar-thumb {
  border-radius: 5px;
  background-color: var(--lowGray);
}

.sendMsg .n-button {
  height: 35px;
  padding: 15px 25px;
}

.system-date {
  font-size: 12px;
  color: var(--greyFont);
  margin-bottom: 5px;
}

.system-content {
  background-color: var(--messageColor);
  border-radius: 4px;
  max-width: 80%;
  padding: 5px 10px;
  line-height: 25px;
  word-break: break-all;
  color: var(--black);
}

.friend-request {
  background: var(--midWhite);
  overflow-y: scroll;
  height: calc(100% - 60px);
}

.request-status {
  font-size: 16px;
  color: var(--greyFont);
  flex: 1;
  display: flex;
  justify-content: right;
  align-items: center;
}

.friend-label {
  color: var(--greyFont);
  margin-right: 30px;
}

.friend-info {
  display: flex;
  justify-content: space-between;
  align-items: center;
  width: 65%;
  padding-top: 50px;
}

.body-right .n-card.n-card--bordered {
  border: none;
}

#outerImg {
  position: fixed;
  top: 0;
  left: 0;
  background: rgba(0, 0, 0, 0.6);
  z-index: 10;
  width: 100%;
  height: 100%;
  display: none;
}

.mobile-right::before {
  content: "👈";
  position: absolute;
  width: 100%;
  height: 100%;
  font-size: 40px;
  color: var(--white);
  top: 0;
  left: 0;
  background: var(--maxGreyFont);
  z-index: 100;
  display: flex;
  align-items: center;
  cursor: pointer;
}

.pagination-wrap {
  display: flex;
  justify-content: center;
  height: 35px;
  margin-top: 15px;
  margin-bottom: 10px;
}


.weiyan-edit {
  width: 350px;
  background-color: var(--background);
  border-radius: 10px;
  padding: 20px;
}


@media screen and (max-width: 1200px) {
  .friend-box {
    width: 95vw;
    height: 95vh;
  }
}

@media screen and (max-width: 850px) {
  .friend-box {
    width: 100vw;
    height: 100vh;
    border-radius: unset;
  }

  .friend-bode {
    max-width: calc(100vw - 60px);
  }

  .body-right {
    max-width: calc(100vw - 60px);
  }
}

@media screen and (max-width: 400px) {
  .msg-one {
    margin: 15px 10px;
  }

  .friend-model {
    width: 90% !important;
  }
}
</style>
