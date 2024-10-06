import request from '@/utils/request'
import { Message } from 'element-ui'

export default {
  data() {
    return {
      groups: {},
      currentGroupId: null
    };
  },
  methods: {
    exitGroup(currentGroupId) {
      request({
        url: '/imChatGroupUser/quitGroup',
        method: 'get',
        params: { id: currentGroupId }
      }).then(() => {
        this.$delete(this.groups, currentGroupId);
        this.currentGroupId = null;
        Message({
          message: "退群成功！",
          type: 'success'
        });
      }).catch((error) => {
        Message({
          message: error.message,
          type: 'error'
        });
      });
    },

    dissolveGroup(currentGroupId) {
      request({
        url: '/imChatGroup/deleteGroup',
        method: 'get',
        params: { id: currentGroupId }
      }).then(() => {
        this.$delete(this.groups, currentGroupId);
        this.currentGroupId = null;
        Message({
          message: "解散群成功！",
          type: 'success'
        });
      }).catch((error) => {
        Message({
          message: error.message,
          type: 'error'
        });
      });
    },

    async getImGroup() {
      try {
        const res = await request({
          url: '/imChatGroup/listGroup',
          method: 'get'
        });
        if (!this.$common.isEmpty(res.data)) {
          res.data.forEach(group => {
            this.$set(this.groups, group.id, group);
          });
        }
      } catch (error) {
        Message({
          message: error.message,
          type: 'error'
        });
      }
    },

    addGroupTopic() {
      request({
        url: '/imChatGroup/addGroupTopic',
        method: 'get',
        params: { id: this.currentGroupId }
      }).then(() => {
        // 可能需要在这里添加一些逻辑
      }).catch((error) => {
        Message({
          message: error.message,
          type: 'error'
        });
      });
    }
  }
};
