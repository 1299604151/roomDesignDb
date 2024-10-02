<template>
  <div class="register">
    <el-form ref="registerForm" :model="registerForm" :rules="registerRules" class="register-form">
      <h3 class="title">农户注册</h3>
      <el-form-item prop="studentId">
        <el-input v-model="registerForm.studentId" type="text" auto-complete="off" placeholder="学号">
          <svg-icon slot="prefix" icon-class="user" class="el-input__icon input-icon" />
        </el-input>
      </el-form-item>
      <el-form-item prop="name">
        <el-input v-model="registerForm.name" type="text" auto-complete="off" placeholder="姓名">
          <svg-icon slot="prefix" icon-class="user" class="el-input__icon input-icon" />
        </el-input>
      </el-form-item>
      <el-form-item prop="password">
        <el-input v-model="registerForm.password" type="password" auto-complete="off" placeholder="密码">
          <svg-icon slot="prefix" icon-class="password" class="el-input__icon input-icon" />
        </el-input>
      </el-form-item>
      <el-form-item prop="confirmPassword">
        <el-input v-model="registerForm.confirmPassword" type="password" auto-complete="off" placeholder="确认密码">
          <svg-icon slot="prefix" icon-class="password" class="el-input__icon input-icon" />
        </el-input>
      </el-form-item>
      <el-form-item prop="gender">
        <el-radio-group v-model="registerForm.gender">
          <el-radio :label="0">男</el-radio>
          <el-radio :label="1">女</el-radio>
        </el-radio-group>
      </el-form-item>
      <el-form-item prop="age">
        <el-input v-model.number="registerForm.age" type="number" auto-complete="off" placeholder="年龄">
          <svg-icon slot="prefix" icon-class="user" class="el-input__icon input-icon" />
        </el-input>
      </el-form-item>
      <el-form-item prop="groupId">
        <el-select v-model="registerForm.groupId" placeholder="请选择所属学习小组">
          <el-option
            v-for="item in groupList"
            :key="item.groupId"
            :label="item.groupName"
            :value="item.groupId"
          >
          </el-option>
        </el-select>
      </el-form-item>
      <el-form-item style="width:100%;">
        <el-button :loading="loading" size="medium" type="primary" style="width:100%;" @click.native.prevent="handleRegister">
          <span v-if="!loading">注 册</span>
          <span v-else>注 册 中...</span>
        </el-button>
      </el-form-item>
      <el-form-item style="width:100%;">
        <el-button  size="medium"  style="width:100%;" @click.native.prevent="handleLogin">
          <span >去 登 录</span>
        </el-button>
      </el-form-item>
    </el-form>
    <!--  底部  -->
    <div class="el-login-footer">
      <span>Copyright © 2018-2024 ------------------</span>
    </div>
  </div>
</template>

<script>
import { registerFarmer } from "@/api/system/farmer";
import { listGroupAll } from "@/api/system/group";

export default {
  name: "Register",
  data() {
    const validateConfirmPassword = (rule, value, callback) => {
      if (value !== this.registerForm.password) {
        callback(new Error('两次输入的密码不一致'));
      } else {
        callback();
      }
    };
    return {
      registerForm: {
        studentId: "",
        name: "",
        password: "",
        confirmPassword: "",
        gender: 0,
        age: "",
        groupId: ""
      },
      registerRules: {
        studentId: [
          { required: true, trigger: "blur", message: "请输入学号" }
        ],
        name: [
          { required: true, trigger: "blur", message: "请输入姓名" }
        ],
        password: [
          { required: true, trigger: "blur", message: "请输入密码" },
          { min: 6, max: 20, message: '密码长度必须在 6 到 20 个字符之间', trigger: 'blur' }
        ],
        confirmPassword: [
          { required: true, trigger: "blur", message: "请确认密码" },
          { validator: validateConfirmPassword, trigger: 'blur' }
        ],
        gender: [
          { required: true, trigger: "change", message: "请选择性别" }
        ],
        age: [
          { required: true, trigger: "blur", message: "请输入年龄" },
          { type: 'number', message: '年龄必须为数字' }
        ],
        groupId: [
          { required: true, trigger: "change", message: "请选择所属学习小组" }
        ]
      },
      groupList: [],
      loading: false
    };
  },
  created() {
    this.getGroupList();
  },
  methods: {
    // 跳转登录
    handleLogin() {
      this.$router.push("/login");
    },
    handleRegister() {
      this.$refs.registerForm.validate(valid => {
        if (valid) {
          this.loading = true;
          registerFarmer(this.registerForm).then(() => {
            this.$message.success("注册成功");
            this.$router.push("/login");
          }).catch(() => {
            this.loading = false;
          });
        }
      });
    },
    // 获取组列表
    getGroupList() {
      listGroupAll().then(response => {
        this.groupList = response.rows;
      });
    }
  }
};
</script>

<style rel="stylesheet/scss" lang="scss">
.register {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100%;
  background-image: url("../assets/images/login-background.jpg");
  background-size: cover;
}
.title {
  margin: 0px auto 30px auto;
  text-align: center;
  color: #707070;
}

.register-form {
  border-radius: 6px;
  background: #ffffff;
  width: 400px;
  padding: 25px 25px 5px 25px;
  .el-input {
    height: 38px;
    input {
      height: 38px;
    }
  }
  .input-icon {
    height: 39px;
    width: 14px;
    margin-left: 2px;
  }
}
.el-login-footer {
  height: 40px;
  line-height: 40px;
  position: fixed;
  bottom: 0;
  width: 100%;
  text-align: center;
  color: #fff;
  font-family: Arial;
  font-size: 12px;
  letter-spacing: 1px;
}
</style>
