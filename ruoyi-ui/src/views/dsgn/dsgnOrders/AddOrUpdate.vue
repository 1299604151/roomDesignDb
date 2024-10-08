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
          <el-form-item label="设计方案ID" prop="designSchemeId">
            <el-input v-model="form.designSchemeId" placeholder="请输入设计方案ID" />
          </el-form-item>
        </el-col>
      </el-row>
      <el-row>
        <el-col :span="12">
          <el-form-item label="订单编号" prop="orderNumber">
            <el-input v-model="form.orderNumber" placeholder="请输入订单编号" />
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="订单金额" prop="amount">
            <el-input v-model="form.amount" placeholder="请输入订单金额" />
          </el-form-item>
        </el-col>
      </el-row>
      <el-row>
        <el-col :span="12">
          <el-form-item label="支付方式" prop="paymentMethod">
            <el-input v-model="form.paymentMethod" placeholder="请输入支付方式" />
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="订单状态" prop="status">
            <el-select v-model="form.status" placeholder="请选择订单状态">
              <el-option label="待支付" value="pending" />
              <el-option label="已支付" value="paid" />
              <el-option label="已取消" value="cancelled" />
            </el-select>
          </el-form-item>
        </el-col>
      </el-row>
      <el-row>
        <el-col :span="12">
          <el-form-item label="创建时间" prop="createdAt">
            <el-date-picker
              v-model="form.createdAt"
              type="date"
              placeholder="选择日期"
              value-format="yyyy-MM-dd">
            </el-date-picker>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="更新时间" prop="updatedAt">
            <el-date-picker
              v-model="form.updatedAt"
              type="date"
              placeholder="选择日期"
              value-format="yyyy-MM-dd">
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
import { addDsgnOrders, updateDsgnOrders } from "@/api/dsgn/dsgnOrders";

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
        designSchemeId: [
          { required: true, message: "设计方案ID不能为空", trigger: "blur" }
        ],
        orderNumber: [
          { required: true, message: "订单编号不能为空", trigger: "blur" }
        ],
        amount: [
          { required: true, message: "订单金额不能为空", trigger: "blur" }
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
            updateDsgnOrders(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.visible = false;
              this.$emit('refreshData');
            });
          } else {
            addDsgnOrders(this.form).then(response => {
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
        orderNumber: null,
        amount: null,
        status: null,
        paymentMethod: null,
        createdAt: null,
        updatedAt: null
      };
      this.resetForm("form");
    }
  }
};
</script>
