<template>
  <div>
    <!-- 群名称 -->
    <div style="height: 60px;background-color: var(--maxWhite)">
      <span style="line-height: 60px;margin-left: 20px;font-size: 18px">
        {{groups[currentGroupId].groupName}}
      </span>
    </div>

    <!-- 群信息 -->
    <div style="background: var(--midWhite);height: calc(100% - 60px)">
      <!-- 群头像 -->
      <div class="myCenter" style="padding: 50px 0">
        <el-avatar :size="60" :src="groups[currentGroupId].avatar"></el-avatar>
      </div>

      <!-- 群信息 -->
      <div class="myCenter">
        <div style="width: 65%;font-size: 16px">
          <!-- 群名称 -->
          <div style="margin-bottom: 10px">
            <span class="friend-label">群名称</span>
            <span style="margin: 0 5px 0 0">{{groups[currentGroupId].groupName}}</span>
            <span @click="changeDataType(2)"
                  v-if="groups[currentGroupId].masterFlag"
                  style="display: inline-block;vertical-align: sub;cursor: pointer">
              <!-- SVG content -->
            </span>
          </div>

          <!-- 群公告 -->
          <div style="margin-bottom: 10px">
            <span class="friend-label">群公告</span>
            <span style="margin: 0 5px 0 0">{{groups[currentGroupId].notice}}</span>
            <span @click="changeDataType(3)"
                  v-if="groups[currentGroupId].masterFlag"
                  style="display: inline-block;vertical-align: sub;cursor: pointer">
              <!-- SVG content -->
            </span>
          </div>

          <!-- 群简介 -->
          <div style="margin-bottom: 40px">
            <span class="friend-label">群简介</span>
            <span style="margin: 0 5px 0 6px">{{groups[currentGroupId].introduction}}</span>
            <span @click="changeDataType(4)"
                  v-if="groups[currentGroupId].masterFlag"
                  style="display: inline-block;vertical-align: sub;cursor: pointer">
              <!-- SVG content -->
            </span>
          </div>
        </div>
      </div>

      <!-- 群按钮 -->
      <div class="myCenter sendMsg">
        <el-button type="info" @click="sendGroupMessage()">发消息</el-button>
        <template
          v-if="groups[currentGroupId].groupType === 1 || (groups[currentGroupId].groupType === 2 && groups[currentGroupId].masterFlag)">
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <el-button type="primary" @click="groupSetting()">群设置</el-button>
        </template>
      </div>
    </div>

    <!-- 群设置 -->
    <el-drawer
      :visible.sync="activeGroupSet"
      :with-header="false"
      size="300px"
      direction="rtl">
      <el-card style="margin-bottom: 20px">
        <el-tabs v-model="activeTab">
          <!-- 群设置 -->
          <el-tab-pane label="群设置" name="群设置">
            <div>
              <div class="myCenter" style="margin: 15px 0">
                <el-avatar :size="70" :src="groups[currentGroupId].avatar" @click="changeAvatar(2)" class="group-avatar"></el-avatar>
              </div>

              <div class="group-set"
                   v-if="groups[currentGroupId].groupType === 1 && groups[currentGroupId].masterFlag">
                <div>是否需要审核</div>
                <div>
                  <el-switch
                    v-model="groups[currentGroupId].inType"
                    @change="updateInType(currentGroupId, !groups[currentGroupId].inType)">
                  </el-switch>
                </div>
              </div>

              <div style="display: flex;justify-content: space-around;margin-top: 20px">
                <el-button type="warning" @click="exitGroup(currentGroupId)"
                           v-if="groups[currentGroupId].groupType === 1">
                  退出群
                </el-button>

                <template v-if="groups[currentGroupId].masterFlag">
                  <el-button type="danger" @click="dissolveGroup(currentGroupId)">
                    解散群
                  </el-button>
                </template>
              </div>
            </div>
          </el-tab-pane>

          <!-- 成员设置 -->
          <el-tab-pane label="群成员" name="群成员" v-if="groups[currentGroupId].groupType === 1">
            <div class="group-user"
                 v-for="(item, index) in groupUsers"
                 :key="index">
              <!-- 成员信息 -->
              <div style="display: flex;align-items: center">
                <div>
                  <el-avatar :size="40" :src="item.avatar"></el-avatar>
                </div>

                <div style="margin-left: 20px;font-size: 16px">
                  {{item.username}}
                </div>
              </div>

              <!-- 成员设置 -->
              <div style="display: flex;align-items: center">
                <div v-if="item.adminFlag"
                     class="user-tag"
                     style="background-color: var(--themeBackground)">
                  管理员
                </div>

                <div v-if="!item.adminFlag && groups[currentGroupId].adminFlag && item.userStatus === 1"
                     class="user-tag"
                     @click="changeGroupUserStatus(currentGroupId, item, 1, 2)"
                     style="background-color: var(--red);cursor: pointer">
                  禁言
                </div>

                <div v-if="!item.adminFlag && groups[currentGroupId].adminFlag && item.userStatus === 2"
                     class="user-tag"
                     @click="changeGroupUserStatus(currentGroupId, item, 2, 1)"
                     style="background-color: var(--blue);cursor: pointer">
                  解禁
                </div>
              </div>
            </div>
          </el-tab-pane>
        </el-tabs>
      </el-card>
    </el-drawer>
  </div>
</template>

<script>
import request from '@/utils/request'
export default {
  props: {
    currentGroupId: Number,
    groups: Object
  },
  data() {
    return {
      groupUsers: [],
      activeGroupSet: false,
      activeTab: '群设置'
    }
  },
  methods: {
    updateInType(currentGroupId, inType) {
      request({
        url: '/imChatGroup/updateGroup',
        method: 'post',
        data: {
          id: this.groups[currentGroupId].id,
          inType: inType
        }
      }).then((res) => {
        this.$message({
          message: "修改成功！",
          type: 'success'
        });
      }).catch((error) => {
        this.$message({
          message: error.message,
          type: 'error'
        });
      });
    },

    changeDataType(type) {
      this.$emit("changeDataType", type);
    },
    sendGroupMessage() {
      this.$emit("sendGroupMessage");
    },
    groupSetting() {
      this.activeGroupSet = true;
      if (this.groups[this.currentGroupId].groupType === 1) {
        this.getGroupUser(this.currentGroupId);
      }
    },
    getGroupUser(groupId, current = 1, size = 9999) {
      request({
        url: '/imChatGroupUser/getGroupUser',
        method: 'get',
        params: {
          groupId: groupId,
          current: current,
          size: size
        }
      }).then((res) => {
        if (!this.$common.isEmpty(res.data) && !this.$common.isEmpty(res.data.records)) {
          this.groupUsers = res.data.records;
        }
      }).catch((error) => {
        this.$message({
          message: error.message,
          type: 'error'
        });
      });
    },
    exitGroup(currentGroupId) {
      this.$emit("exitGroup", currentGroupId);
    },
    dissolveGroup(currentGroupId) {
      this.$emit("dissolveGroup", currentGroupId);
    },
    changeGroupUserStatus(groupId, item, oldUserStatus, userStatus) {
      request({
        url: '/imChatGroupUser/changeUserStatus',
        method: 'get',
        params: {
          groupId: groupId,
          userId: item.userId,
          oldUserStatus: oldUserStatus,
          userStatus: userStatus
        }
      }).then((res) => {
        item.userStatus = userStatus;
        this.$message({
          message: "修改成功！",
          type: 'success'
        });
      }).catch((error) => {
        this.$message({
          message: error.message,
          type: 'error'
        });
      });
    },

    changeAvatar(type) {
      this.$emit("changeAvatar", type);
    }
  }
}
</script>



<style scoped>

  .friend-label {
    color: var(--greyFont);
    margin-right: 30px;
  }

  .sendMsg .n-button {
    height: 35px;
    padding: 15px 25px;
  }

  .group-set {
    display: flex;
    justify-content: space-between;
    padding: 10px;
  }

  .group-set:first-child {
    font-size: 16px;
  }

  .user-tag {
    color: var(--white);
    border-radius: 3px;
    font-size: 12px;
    padding: 0 6px;
    margin: 0 6px;
    height: 22px;
    line-height: 22px;
    letter-spacing: 2px;
  }

  .group-user {
    display: flex;
    padding: 10px;
    height: 60px;
    justify-content: space-between;
    box-sizing: border-box;
  }

  .group-avatar {
    cursor: pointer;
    transition: all 0.3s;
    user-select: none;
  }

  .group-avatar:hover {
    transform: rotate(360deg);
  }
</style>
