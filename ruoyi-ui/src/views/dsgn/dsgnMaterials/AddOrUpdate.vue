<template>
  <el-dialog :title="title" :visible.sync="visible" width="500px" append-to-body>
    <el-form ref="form" :model="form" :rules="rules" label-width="80px">
      <el-form-item label="材料名称" prop="name">
        <el-input v-model="form.name" placeholder="请输入材料名称" />
      </el-form-item>
      <el-form-item label="材料描述" prop="description">
        <el-input v-model="form.description" type="textarea" placeholder="请输入内容" />
      </el-form-item>
      <el-form-item label="材料图片URL" prop="imageUrl">
        <el-input v-model="form.imageUrl" placeholder="请输入材料图片URL" />
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
import { addDsgnMaterials, updateDsgnMaterials } from "@/api/dsgn/dsgnMaterials";

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
        name: null,
        description: null,
        imageUrl: null,
        createdAt: null,
        updatedAt: null
      },
      rules: {
        name: [
          { required: true, message: "材料名称不能为空", trigger: "blur" }
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
            updateDsgnMaterials(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.visible = false;
              this.$emit('refreshData');
            });
          } else {
            addDsgnMaterials(this.form).then(response => {
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
        name: null,
        description: null,
        imageUrl: null,
        createdAt: null,
        updatedAt: null
      };
      this.resetForm("form");
    }
  }
};
</script>
