<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="设计方案标题" prop="title">
        <el-input
          v-model="queryParams.title"
          placeholder="请输入设计方案标题"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>

      <el-form-item label="价格" prop="price">
        <el-input
          v-model="queryParams.price"
          placeholder="请输入价格"
          clearable
          @keyup.enter.native="handleQuery"
        />
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
          v-hasPermi="['dsgn:dsgnDesignSchemes:add']"
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
          v-hasPermi="['dsgn:dsgnDesignSchemes:edit']"
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
          v-hasPermi="['dsgn:dsgnDesignSchemes:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['dsgn:dsgnDesignSchemes:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="dsgnDesignSchemesList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="设计方案标题" align="center" prop="title" />
      <el-table-column label="价格" align="center" prop="price" />
      <el-table-column label="适用空间" align="center" prop="spaceType" />
      <el-table-column label="发布日期" align="center" prop="publishDate" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.publishDate, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="查看次数" align="center" prop="viewCount" />
      <el-table-column label="点赞次数" align="center" prop="likeCount" />
      <el-table-column label="创建时间" align="center" prop="createdAt" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.createdAt, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="更新时间" align="center" prop="updatedAt" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.updatedAt, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['dsgn:dsgnDesignSchemes:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['dsgn:dsgnDesignSchemes:remove']"
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
import { listDsgnDesignSchemes, getDsgnDesignSchemes, delDsgnDesignSchemes } from "@/api/dsgn/dsgnDesignSchemes";
import AddOrUpdate from './AddOrUpdate.vue';

export default {
  name: "DsgnDesignSchemes",
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
      // 设计方案表格数据
      dsgnDesignSchemesList: [],
      // 弹出层标题
      title: "",
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        title: null,
        tagline: null,
        price: null,
        styleId: null,
        spaceType: null,
        recommendedAreaMin: null,
        recommendedAreaMax: null,
        budgetRangeMin: null,
        budgetRangeMax: null,
        mainImageUrl: null,
        previewImages: null,
        colorSchemeDescription: null,
        designConcept: null,
        features: null,
        designerId: null,
        status: null,
        publishDate: null,
        viewCount: null,
        likeCount: null,
        createdAt: null,
        updatedAt: null
      },
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询设计方案列表 */
    getList() {
      this.loading = true;
      listDsgnDesignSchemes(this.queryParams).then(response => {
        this.dsgnDesignSchemesList = response.rows;
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
      this.title = "添加设计方案";
      this.$refs.addOrUpdate.init({});
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.title = "修改设计方案";
      const id = row.id || this.ids
      getDsgnDesignSchemes(id).then(response => {
        this.$refs.addOrUpdate.init(response.data);
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const ids = row.id || this.ids;
      this.$modal.confirm('是否确认删除设计方案编号为"' + ids + '"的数据项？').then(function() {
        return delDsgnDesignSchemes(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('dsgn/dsgnDesignSchemes/export', {
        ...this.queryParams
      }, `dsgnDesignSchemes_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
