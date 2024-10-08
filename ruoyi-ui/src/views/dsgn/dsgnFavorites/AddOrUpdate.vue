<template>
  <el-dialog :title="title" :visible.sync="visible" width="500px" append-to-body>
    <el-form ref="form" :model="form" :rules="rules" label-width="80px">
      <el-form-item label="用户ID" prop="userId">
        <el-input v-model="form.userId" placeholder="请输入用户ID" />
      </el-form-item>
      <el-form-item label="设计方案ID" prop="designSchemeId">
        <el-input v-model="form.designSchemeId" placeholder="请输入设计方案ID" />
      </el-form-item>
      <el-form-item label="收藏时间" prop="createdAt">
        <el-date-picker clearable
                        v-model="form.createdAt"
                        type="date"
                        value-format="yyyy-MM-dd"
                        placeholder="请选择收藏时间">
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
import { addDsgnFavorites, updateDsgnFavorites } from "@/api/dsgn/dsgnFavorites";

export default {
  name: "AddOrUpdate",
  props: {
    title: {
      type: String,
      default: ''
    }
  },
  data() {
    return {
      visible: false,
      form: {
        id: null,
        userId: null,
        designSchemeId: null,
        createdAt: null
      },
      rules: {
        userId: [
          { required: true, message: "用户ID不能为空", trigger: "blur" }
        ],
        designSchemeId: [
          { required: true, message: "设计方案ID不能为空", trigger: "blur" }
        ],
      }
    };
  },
  methods: {
    init(data) {
      this.form = { ...data };
      this.visible = true;
    },
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateDsgnFavorites(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.visible = false;
              this.$emit('refreshData');
            });
          } else {
            addDsgnFavorites(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.visible = false;
              this.$emit('refreshData');
            });
          }
        }
      });
    },
    cancel() {
      this.visible = false;
      this.reset();
    },
    reset() {
      this.form = {
        id: null,
        userId: null,
        designSchemeId: null,
        createdAt: null
      };
      this.resetForm("form");
    }
  }
};
</script>
