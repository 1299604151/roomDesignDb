<template>
  <el-dialog :title="title" :visible.sync="visible" width="500px" append-to-body>
    <el-form ref="form" :model="form" :rules="rules" label-width="80px">
      <el-row>
        <el-col :span="12">
          <el-form-item label="用户ID" prop="userId">
            <el-input v-model="form.userId" placeholder="请输入用户ID" />
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="主题" prop="subject">
            <el-input v-model="form.subject" placeholder="请输入主题" />
          </el-form-item>
        </el-col>
      </el-row>
      <el-row>
        <el-col :span="24">
          <el-form-item label="问题描述" prop="description">
            <el-input v-model="form.description" type="textarea" placeholder="请输入内容" />
          </el-form-item>
        </el-col>
      </el-row>
      <el-row>
        <el-col :span="12">
          <el-form-item label="状态" prop="status">
            <el-select v-model="form.status" placeholder="请选择状态">
              <el-option label="待处理" value="pending"></el-option>
              <el-option label="处理中" value="processing"></el-option>
              <el-option label="已完成" value="completed"></el-option>
            </el-select>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="优先级" prop="priority">
            <el-select v-model="form.priority" placeholder="请选择优先级">
              <el-option label="低" value="low"></el-option>
              <el-option label="中" value="medium"></el-option>
              <el-option label="高" value="high"></el-option>
            </el-select>
          </el-form-item>
        </el-col>
      </el-row>
      <el-row>
        <el-col :span="12">
          <el-form-item label="创建时间" prop="createdAt">
            <el-date-picker clearable
                            v-model="form.createdAt"
                            type="date"
                            value-format="yyyy-MM-dd"
                            placeholder="请选择创建时间">
            </el-date-picker>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="更新时间" prop="updatedAt">
            <el-date-picker clearable
                            v-model="form.updatedAt"
                            type="date"
                            value-format="yyyy-MM-dd"
                            placeholder="请选择更新时间">
            </el-date-picker>
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
import { addDsgnTickets, updateDsgnTickets } from "@/api/dsgn/dsgnTickets";

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
        subject: [
          { required: true, message: "主题不能为空", trigger: "blur" }
        ],
        description: [
          { required: true, message: "问题描述不能为空", trigger: "blur" }
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
            updateDsgnTickets(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.visible = false;
              this.$emit('refreshData');
            });
          } else {
            addDsgnTickets(this.form).then(response => {
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
        subject: null,
        description: null,
        status: null,
        priority: null,
        createdAt: null,
        updatedAt: null
      };
      this.resetForm("form");
    }
  }
};
</script>
