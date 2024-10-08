<template>
  <el-dialog :title="title" :visible.sync="visible" width="500px" append-to-body>
    <el-form ref="form" :model="form" :rules="rules" label-width="80px">
      <el-row>
        <el-col :span="24">
          <el-form-item label="用户ID" prop="userId">
            <el-input v-model="form.userId" placeholder="请输入用户ID" />
          </el-form-item>
        </el-col>
      </el-row>
      <el-row>
        <el-col :span="24">
          <el-form-item label="偏好色彩ID列表" prop="colorIds">
            <el-input v-model="form.colorIds" type="textarea" placeholder="请输入偏好色彩ID列表，逗号分隔" />
          </el-form-item>
        </el-col>
      </el-row>
      <el-row>
        <el-col :span="24">
          <el-form-item label="偏好材料ID列表" prop="materialIds">
            <el-input v-model="form.materialIds" type="textarea" placeholder="请输入偏好材料ID列表，逗号分隔" />
          </el-form-item>
        </el-col>
      </el-row>
      <el-row>
        <el-col :span="24">
          <el-form-item label="偏好风格ID列表" prop="styleIds">
            <el-input v-model="form.styleIds" type="textarea" placeholder="请输入偏好风格ID列表，逗号分隔" />
          </el-form-item>
        </el-col>
      </el-row>
    </el-form>
    <div slot="footer" class="dialog-footer">
      <el-button type="primary" @click="submitForm">确 定</el-button>
      <el-button @click="cancel">取 消</el-button>
    </div>
  </el-dialog>
</template>

<script>
import { addDsgnPreferences, updateDsgnPreferences } from "@/api/dsgn/dsgnPreferences";

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
      form: {},
      rules: {
        userId: [
          { required: true, message: "用户ID不能为空", trigger: "blur" }
        ],
      }
    };
  },
  methods: {
    init(form) {
      this.form = form;
      this.visible = true;
    },
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateDsgnPreferences(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.visible = false;
              this.$emit('refreshData');
            });
          } else {
            addDsgnPreferences(this.form).then(response => {
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
        colorIds: null,
        materialIds: null,
        styleIds: null,
        createdAt: null,
        updatedAt: null
      };
      this.resetForm("form");
    }
  }
};
</script>
