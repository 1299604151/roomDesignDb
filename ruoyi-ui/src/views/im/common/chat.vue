<template>
  <div>
    <!-- title -->
    <div style="height: 60px;background-color: var(--maxWhite)">
      <template v-if="!$common.isEmpty(currentChatFriendId)">
        <span style="line-height: 60px;margin-left: 20px;font-size: 18px">
          {{friends[currentChatFriendId].remark}}
        </span>
      </template>
      <template v-else-if="!$common.isEmpty(currentChatGroupId)">
        <span style="line-height: 60px;margin-left: 20px;font-size: 18px">
          {{groups[currentChatGroupId].groupName}}
        </span>
        <span style="line-height: 60px;margin-left: 20px;font-size: 12px;color: var(--greyFont)">
          当前在线人数：4
        </span>
      </template>
    </div>

    <!-- 聊天记录 -->
    <div class="msg-container">
      <template v-if="!$common.isEmpty(currentChatFriendId)">
        <div v-for="(item, index) in imMessages[currentChatFriendId]"
             :class="['msg-one', item.fromId === $store.state.user.id ? 'message-right' : 'message-left']"
             :key="index">
          <!-- 头像 -->
          <div>
            <el-avatar :size="40"
                       :src="item.avatar"

                       style="cursor: pointer"></el-avatar>
          </div>

          <!-- 文本消息 -->
          <div class="message" v-html="item.content"></div>

          <!-- 时间 -->
          <div class="msg-date" v-if="!$common.isEmpty(item.createTime)">
            {{$common.getDateDiff(item.createTime)}}
          </div>
        </div>
      </template>

      <template v-else-if="!$common.isEmpty(currentChatGroupId)">
        <div v-for="(item, index) in groupMessages[currentChatGroupId]"
             :class="['msg-one', item.fromId === $store.state.user.id ? 'message-right' : 'message-left']"
             :key="index">
          <!-- 头像 -->
          <div>
            <el-avatar :size="40"
                       :src="item.avatar"

                       style="cursor: pointer"></el-avatar>
          </div>

          <!-- 文本消息 -->
          <div class="message" v-html="item.content"
               :style="{'background': (item.fromId !== $store.state.user.id ? $constant.tree_hole_color[item.fromId % $constant.tree_hole_color.length] : '')}">
          </div>

          <div class="msg-user">{{item.username}}</div>

          <!-- 时间 -->
          <div class="msg-date" style="margin-left: 5px;margin-right: 5px"
               v-if="!this.$common.isEmpty(item.createTime)">
            {{$common.getDateDiff(item.createTime)}}
          </div>
        </div>
      </template>
    </div>

    <!-- 输入框 -->
    <div style="height: 180px">
      <!-- 功能栏 -->
      <div style="padding: 10px 15px;display: flex;height: 50px">
        <!-- 表情 -->
        <el-popover
          placement="top-start"
          trigger="click"
          v-model="showEmoji">
          <emoji @addEmoji="addEmoji" :showEmoji="true"></emoji>
          <div class="myEmoji" slot="reference">
            <img src="@/assets/im/svg/emoji.svg" width="25" height="25" alt="Image description">

            <!-- SVG 内容 -->
          </div>
        </el-popover>

        <!-- 图片 -->
        <div class="myEmoji" @click="sendPicture()">
          <img src="@/assets/im/svg/pic.svg" width="25" height="25" alt="Image description">

          <!-- SVG 内容 -->
        </div>

      </div>

      <!-- 输入框 -->
      <textarea @keydown="send($event)"
                v-model="msg"
                maxlength="1000"
                spellcheck="false"
                class="message-content">
      </textarea>
      <!-- 发送 -->
      <div class="message-send">
        <span style="color: var(--greyFont);margin-right: 15px;font-size: 12px">Ctrl+Enter：换行 | Enter：发送</span>
        <el-button @click="doSend()" type="primary">
          发送
        </el-button>
      </div>
    </div>

    <!-- 聊天图片弹出框 -->
<!--    <el-dialog-->
<!--      :visible.sync="showPictureDialog"-->
<!--      width="60%">-->
<!--      <div style="padding: 40px;background: var(&#45;&#45;white);border-radius: 5px;">-->
<!--        <div style="margin: 0 0 25px;text-align: center;font-size: 18px">上传图片</div>-->
<!--        <uploadPicture :prefix="picturePrefix" @addPicture="addPicture" :maxSize="2"-->
<!--                       :maxNumber="1"></uploadPicture>-->
<!--      </div>-->
<!--    </el-dialog>-->


    <el-dialog
      :visible.sync="showPictureDialog"
      width="60%"
      :append-to-body="true"
      destroy-on-close
    >
      <div class="picture-dialog-content">
        <div class="dialog-title">上传图片</div>
        <uploadPicture
          v-if="showPictureDialog"
          :prefix="picturePrefix"
          @addPicture="addPicture"
          :maxSize="2"
          :maxNumber="1"
        ></uploadPicture>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import emoji from "./emoji";
import uploadPicture from "./uploadPicture";
import constant from "@/utils/im/constant";
export default {
  components: {
    uploadPicture,
    emoji
  },
  props: {
    currentChatFriendId: Number,
    currentChatGroupId: Number,
    friends: Object,
    groups: Object,
    imMessages: Object,
    groupMessages: Object,
    imageList: Array
  },
  data() {
    return {
      msg: '',
      constant,
      showPictureDialog: false,
      picturePrefix: '',
      showPopoverImage: false,
      showEmoji: false
    }
  },
  methods: {
    sendPicture() {
      if (!this.$common.isEmpty(this.currentChatFriendId)) {
        this.picturePrefix = 'im/friendMessage';
        this.showPictureDialog = true;
      } else if (!this.$common.isEmpty(this.currentChatGroupId)) {
        this.picturePrefix = 'im/groupMessage';
        this.showPictureDialog = true;
      }
    },
    addPicture(res) {
      this.msg += "[" + this.$store.state.user.name + "," + res + "]";
      this.showPictureDialog = false;
    },

    addEmoji(key) {
      this.msg += key;
    },
    sendImage(url) {
      this.msg += "[" + this.$store.state.user.name + "," + url + "]";
      this.showPopoverImage = false;
      this.doSend();
    },



    send(e) {
      if (e && (e.ctrlKey || e.shiftKey) && e.keyCode === 13) {
        e.returnValue = false;
        this.msg = this.msg + '\n';
      } else if (e && e.keyCode === 13) {
        e.returnValue = false;
        this.doSend();
      }
    },
    doSend() {
      if (this.$common.isEmpty(this.msg)) {
        return;
      }

      if (!this.$common.isEmpty(this.currentChatFriendId)) {
        let message = {
          messageType: 1,
          content: this.msg,
          fromId: this.$store.state.user.id,
          toId: this.currentChatFriendId,
          avatar: this.$store.state.user.avatar
        }
        this.$emit("sendMsg", JSON.stringify(message), (success) => {
          if (success) {
            this.msg = '';
          }
        });
      } else if (!this.$common.isEmpty(this.currentChatGroupId)) {
        let message = {
          messageType: 2,
          content: this.msg,
          fromId: this.$store.state.user.id,
          groupId: this.currentChatGroupId,
          avatar: this.$store.state.user.avatar,
          username: this.$store.state.user.name
        }
        this.$emit("sendMsg", JSON.stringify(message), (success) => {
          if (success) {
            this.msg = '';
          }
        });
      }
    }
  }
}
</script>


<style scoped>

.picture-dialog-content {
  padding: 20px;
  background: var(--white);
  border-radius: 5px;
}

.dialog-title {
  margin-bottom: 20px;
  text-align: center;
  font-size: 18px;
}

/* 确保弹窗内容不会溢出 */
::v-deep .el-dialog__body {
  max-height: 70vh;
  overflow-y: auto;
}


  .msg-container {
    background: var(--midWhite);
    overflow-y: scroll;
    height: calc(100% - 240px);
  }

  .msg-one {
    margin: 15px 20px;
    display: flex;
    align-items: flex-start;
  }

  .message {
    max-width: 50%;
    padding: 5px 10px;
    line-height: 25px;
    word-break: break-all;
    position: relative;
    color: var(--black);
    margin: 0 12px 0 12px;
  }

  .message::before {
    content: "";
    position: absolute;
    width: 0;
    height: 0;
    border: 3px solid;
    top: 0;
  }

  .message-left .message {
    background-color: var(--white);
    border-radius: 0 4px 4px 4px;
  }

  .message-left .message::before {
    left: -6px;
    border-color: var(--white) var(--white) transparent transparent;
  }

  .message-right {
    flex-direction: row-reverse;
  }

  .message-right .message {
    background-color: var(--messageColor);
    border-radius: 4px 0 4px 4px;
  }

  .message-right .message::before {
    right: -6px;
    border-color: var(--messageColor) transparent transparent var(--messageColor);
  }

  .msg-date, .msg-user {
    font-size: 12px;
    color: var(--greyFont);
  }

  .myEmoji {
    transition: all 0.5s;
    margin-right: 15px;
    cursor: pointer;
  }

  .myEmoji:hover {
    transform: scale(1.2);
  }

  .message-content {
    width: calc(100% - 30px);
    margin: 0 15px;
    box-sizing: border-box;
    height: calc(100% - 100px);
    display: block;
    border: none;
    outline: none;
    box-shadow: none;
    resize: none;
    font-size: 18px;
  }

  .message-send {
    float: right;
    padding: 10px 30px 15px;
  }

  .message-send .n-button {
    height: 30px;
    padding: 10px 25px;
  }

  .image-list {
    overflow: auto;
    max-width: 400px;
    max-height: 200px;
    display: flex;
    flex-flow: wrap;
    gap: 10px;
  }


  @media screen and (max-width: 400px) {
    .msg-one {
      margin: 15px 10px;
    }

    .image-list {
      max-width: 230px !important;
    }
  }
</style>
