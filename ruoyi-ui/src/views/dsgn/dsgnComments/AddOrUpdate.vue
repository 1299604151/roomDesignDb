<template>
  <el-dialog :title="title" :visible.sync="visible" width="500px" append-to-body @close="$emit('update:visible', false)">
    <el-form ref="form" :model="form" :rules="rules" label-width="80px">
      <el-form-item label="设计方案ID" prop="designSchemeId">
        <el-input v-model="form.designSchemeId" placeholder="请输入设计方案ID" />
      </el-form-item>
      <el-form-item label="用户名" prop="userName">
        <el-input v-model="form.userName" placeholder="请输入用户名" />
      </el-form-item>
      <el-form-item label="用户头像URL" prop="avatarUrl">
        <el-input v-model="form.avatarUrl" placeholder="请输入用户头像URL" />
      </el-form-item>
      <el-form-item label="评论内容">
        <editor v-model="form.content" :min-height="192"/>
      </el-form-item>
      <el-form-item label="父评论ID，用于回复" prop="parentId">
        <el-input v-model="form.parentId" placeholder="请输入父评论ID，用于回复" />
      </el-form-item>
      <el-form-item label="创建时间" prop="createdAt">
        <el-date-picker clearable
                        v-model="form.createdAt"
                        type="date"
                        value-format="yyyy-MM-dd"
                        placeholder="请选择创建时间">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="更新时间" prop="updatedAt">
        <el-date-picker clearable
                        v-model="form.updatedAt"
                        type="date"
                        value-format="yyyy-MM-dd"
                        placeholder="请选择更新时间">
        </el-date-picker>
      </el-form-item>
    </el-form>
    <div slot="footer" class="dialog-footer">
      <el-button type="primary" @click="submitForm">确 定</el-button>
      <el-button @click="cancel">取 消</el-button>
    </div>
  </el-dialog>
</template>

<script>
export default {
  name: "AddOrUpdate",
  props: {
    visible: {
      type: Boolean,
      default: false
    },
    title: {
      type: String,
      default: ""
    },
    form: {
      type: Object,
      default: () => ({})
    }
  },
  data() {
    return {
      rules: {
        designSchemeId: [
          { required: true, message: "设计方案ID不能为空", trigger: "blur" }
        ],
        userName: [
          { required: true, message: "用户名不能为空", trigger: "blur" }
        ],
        content: [
          { required: true, message: "评论内容不能为空", trigger: "blur" }
        ],
      }
    };
  },
  methods: {
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          this.$emit('submitForm', this.form);
        }
      });
    },
    cancel() {
      this.$emit('cancel');
    }
  }
};
</script>
