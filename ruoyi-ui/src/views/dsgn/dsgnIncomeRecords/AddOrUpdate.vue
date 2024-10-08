<template>
  <el-dialog :title="title" :visible.sync="visible" width="500px" append-to-body>
    <el-form ref="form" :model="form" :rules="rules" label-width="80px">
      <el-form-item label="关联订单ID" prop="orderId">
        <el-input v-model="form.orderId" placeholder="请输入关联订单ID" />
      </el-form-item>
      <el-form-item label="收入金额" prop="amount">
        <el-input v-model="form.amount" placeholder="请输入收入金额" />
      </el-form-item>
      <el-form-item label="记录时间" prop="recordedAt">
        <el-date-picker clearable
                        v-model="form.recordedAt"
                        type="date"
                        value-format="yyyy-MM-dd"
                        placeholder="请选择记录时间">
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
import { addDsgnIncomeRecords, updateDsgnIncomeRecords } from "@/api/dsgn/dsgnIncomeRecords";

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
        orderId: null,
        amount: null,
        recordedAt: null
      },
      rules: {
        orderId: [
          { required: true, message: "关联订单ID不能为空", trigger: "blur" }
        ],
        amount: [
          { required: true, message: "收入金额不能为空", trigger: "blur" }
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
            updateDsgnIncomeRecords(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.visible = false;
              this.$emit('refreshData');
            });
          } else {
            addDsgnIncomeRecords(this.form).then(response => {
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
        orderId: null,
        amount: null,
        recordedAt: null
      };
      this.resetForm("form");
    }
  }
};
</script>
