<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="用户ID" prop="userId">
        <el-input
          v-model="queryParams.userId"
          placeholder="请输入用户ID"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="设计方案ID" prop="designSchemeId">
        <el-input
          v-model="queryParams.designSchemeId"
          placeholder="请输入设计方案ID"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="浏览时间" prop="viewedAt">
        <el-date-picker clearable
                        v-model="queryParams.viewedAt"
                        type="date"
                        value-format="yyyy-MM-dd"
                        placeholder="请选择浏览时间">
        </el-date-picker>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['dsgn:dsgnBrowsingHistory:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['dsgn:dsgnBrowsingHistory:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['dsgn:dsgnBrowsingHistory:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['dsgn:dsgnBrowsingHistory:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="dsgnBrowsingHistoryList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="浏览历史ID" align="center" prop="id" />
      <el-table-column label="用户ID" align="center" prop="userId" />
      <el-table-column label="设计方案ID" align="center" prop="designSchemeId" />
      <el-table-column label="浏览时间" align="center" prop="viewedAt" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.viewedAt, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['dsgn:dsgnBrowsingHistory:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['dsgn:dsgnBrowsingHistory:remove']"
          >删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 使用新的 AddOrUpdate 组件 -->
    <AddOrUpdate ref="addOrUpdate" :title="title" @refreshData="getList" />
  </div>
</template>

<script>
import { listDsgnBrowsingHistory, getDsgnBrowsingHistory, delDsgnBrowsingHistory } from "@/api/dsgn/dsgnBrowsingHistory";
import AddOrUpdate from './AddOrUpdate.vue';

export default {
  name: "DsgnBrowsingHistory",
  components: {
    AddOrUpdate
  },
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 用户浏览历史表格数据
      dsgnBrowsingHistoryList: [],
      // 弹出层标题
      title: "",
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        userId: null,
        designSchemeId: null,
        viewedAt: null
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询用户浏览历史列表 */
    getList() {
      this.loading = true;
      listDsgnBrowsingHistory(this.queryParams).then(response => {
        this.dsgnBrowsingHistoryList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.id)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.title = "添加用户浏览历史";
      this.$refs.addOrUpdate.init({});
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.title = "修改用户浏览历史";
      const id = row.id || this.ids
      getDsgnBrowsingHistory(id).then(response => {
        this.$refs.addOrUpdate.init(response.data);
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const ids = row.id || this.ids;
      this.$modal.confirm('是否确认删除用户浏览历史编号为"' + ids + '"的数据项？').then(function() {
        return delDsgnBrowsingHistory(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('dsgn/dsgnBrowsingHistory/export', {
        ...this.queryParams
      }, `dsgnBrowsingHistory_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
