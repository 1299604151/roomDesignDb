<template>
  <el-dialog :title="title" :visible.sync="visible" width="500px" append-to-body>
    <el-form ref="form" :model="form" :rules="rules" label-width="80px">
      <el-form-item label="家具名称" prop="title">
        <el-input v-model="form.title" placeholder="请输入家具名称" />
      </el-form-item>
      <el-form-item label="家具描述" prop="description">
        <el-input v-model="form.description" type="textarea" placeholder="请输入内容" />
      </el-form-item>
      <el-form-item label="家具图片URL" prop="imageUrl">
        <el-input v-model="form.imageUrl" placeholder="请输入家具图片URL" />
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
import { addDsgnFurnitureItems, updateDsgnFurnitureItems } from "@/api/dsgn/dsgnFurnitureItems";

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
        title: null,
        description: null,
        imageUrl: null,
        createdAt: null,
        updatedAt: null
      },
      rules: {
        title: [
          { required: true, message: "家具名称不能为空", trigger: "blur" }
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
            updateDsgnFurnitureItems(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.visible = false;
              this.$emit('refreshData');
            });
          } else {
            addDsgnFurnitureItems(this.form).then(response => {
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
        title: null,
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
