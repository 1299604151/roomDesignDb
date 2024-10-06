import { Message } from "element-ui";
import request from '@/utils/request'

export default {
  data() {
    return {
      changeDataData: {
        changeData: '',
        changeType: null,
        changeModal: false,
        avatarType: null,
        avatarPrefix: '',
        showAvatarDialog: false
      }
    };
  },
  methods: {
    closeModal() {
      this.changeDataData.avatarType = null;
      this.changeDataData.avatarPrefix = '';
      this.changeDataData.changeData = '';
      this.changeDataData.changeType = null;
    },
    changeAvatar(type) {
      if (type === 1 || (type === 2 && this.groups[this.currentGroupId].masterFlag)) {
        this.closeModal();
        this.changeDataData.showAvatarDialog = true;
        this.changeDataData.avatarType = type;
        if (type === 1) {
          this.changeDataData.avatarPrefix = 'userAvatar';
        } else if (type === 2) {
          this.changeDataData.avatarPrefix = 'im/groupAvatar';
        }
      }
    },
    changeDataType(type) {
      this.closeModal();
      this.changeDataData.changeType = type;
      this.changeDataData.changeModal = true;
    },
    submitAvatar(avatar) {
      if (this.$common.isEmpty(avatar)) {
        Message({
          message: "请上传头像！",
          type: 'warning'
        });
        return;
      }
      if (this.changeDataData.avatarType === 1) {
        let user = {
          avatar: avatar
        };
        request({
          url: '/user/updateUserInfo',
          method: 'post',
          data: user
        }).then((res) => {
          if (!this.$common.isEmpty(res.data)) {
            Message({
              message: "修改成功！",
              type: 'success'
            });
            this.$store.commit("loadCurrentUser", res.data);
            this.closeModal();
            this.changeDataData.showAvatarDialog = false;
          }
        }).catch((error) => {
          Message({
            message: error.message,
            type: 'error'
          });
        });
      } else if (this.changeDataData.avatarType === 2) {
        request({
          url: '/imChatGroup/updateGroup',
          method: 'post',
          data: {
            id: this.currentGroupId,
            avatar: avatar
          }
        }).then(() => {
          Message({
            message: "修改成功！",
            type: 'success'
          });
          this.$set(this.groups[this.currentGroupId], 'avatar', avatar);
          this.closeModal();
          this.changeDataData.showAvatarDialog = false;
        }).catch((error) => {
          Message({
            message: error.message,
            type: 'error'
          });
        });
      }
    },
    submitChange() {
      if (this.changeDataData.changeType === 1) {
        this.submitFriendChange();
      } else if (this.changeDataData.changeType === 2) {
        this.submitGroupNameChange();
      } else if (this.changeDataData.changeType === 3) {
        this.submitGroupNoticeChange();
      } else if (this.changeDataData.changeType === 4) {
        this.submitGroupIntroductionChange();
      }
    },
    submitFriendChange() {
      if (this.$common.isEmpty(this.changeDataData.changeData)) {
        Message({
          message: "请输入备注！",
          type: 'warning'
        });
        return;
      }
      request({
        url: '/imChatUserFriend/changeFriend',
        method: 'get',
        params: {
          friendId: this.currentFriendId,
          remark: this.changeDataData.changeData
        }
      }).then(() => {
        Message({
          message: "修改成功！",
          type: 'success'
        });
        this.$set(this.friends[this.currentFriendId], 'remark', this.changeDataData.changeData);
        this.closeModal();
        this.changeDataData.changeModal = false;
      }).catch((error) => {
        Message({
          message: error.message,
          type: 'error'
        });
      });
    },
    submitGroupNameChange() {
      if (this.$common.isEmpty(this.changeDataData.changeData)) {
        Message({
          message: "请输入群名称！",
          type: 'warning'
        });
        return;
      }
      request({
        url: '/imChatGroup/updateGroup',
        method: 'post',
        data: {
          id: this.currentGroupId,
          groupName: this.changeDataData.changeData
        }
      }).then(() => {
        Message({
          message: "修改成功！",
          type: 'success'
        });
        this.$set(this.groups[this.currentGroupId], 'groupName', this.changeDataData.changeData);
        this.closeModal();
        this.changeDataData.changeModal = false;
      }).catch((error) => {
        Message({
          message: error.message,
          type: 'error'
        });
      });
    },
    submitGroupNoticeChange() {
      if (this.$common.isEmpty(this.changeDataData.changeData)) {
        Message({
          message: "请输入群公告！",
          type: 'warning'
        });
        return;
      }
      request({
        url: '/imChatGroup/updateGroup',
        method: 'post',
        data: {
          id: this.currentGroupId,
          notice: this.changeDataData.changeData
        }
      }).then(() => {
        Message({
          message: "修改成功！",
          type: 'success'
        });
        this.$set(this.groups[this.currentGroupId], 'notice', this.changeDataData.changeData);
        this.closeModal();
        this.changeDataData.changeModal = false;
      }).catch((error) => {
        Message({
          message: error.message,
          type: 'error'
        });
      });
    },
    submitGroupIntroductionChange() {
      if (this.$common.isEmpty(this.changeDataData.changeData)) {
        Message({
          message: "请输入群简介！",
          type: 'warning'
        });
        return;
      }
      request({
        url: '/imChatGroup/updateGroup',
        method: 'post',
        data: {
          id: this.currentGroupId,
          introduction: this.changeDataData.changeData
        }
      }).then(() => {
        Message({
          message: "修改成功！",
          type: 'success'
        });
        this.$set(this.groups[this.currentGroupId], 'introduction', this.changeDataData.changeData);
        this.closeModal();
        this.changeDataData.changeModal = false;
      }).catch((error) => {
        Message({
          message: error.message,
          type: 'error'
        });
      });
    }
  }
};
