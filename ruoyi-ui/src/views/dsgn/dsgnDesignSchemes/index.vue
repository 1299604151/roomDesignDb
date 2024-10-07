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
      <el-form-item label="标语" prop="tagline">
        <el-input
          v-model="queryParams.tagline"
          placeholder="请输入标语"
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
      <el-form-item label="风格ID" prop="styleId">
        <el-input
          v-model="queryParams.styleId"
          placeholder="请输入风格ID"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="推荐面积" prop="recommendedArea">
        <el-input
          v-model="queryParams.recommendedArea"
          placeholder="请输入推荐面积"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="预算范围" prop="budgetRange">
        <el-input
          v-model="queryParams.budgetRange"
          placeholder="请输入预算范围"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="主图URL" prop="mainImageUrl">
        <el-input
          v-model="queryParams.mainImageUrl"
          placeholder="请输入主图URL"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="设计师ID" prop="designerId">
        <el-input
          v-model="queryParams.designerId"
          placeholder="请输入设计师ID"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="发布日期" prop="publishDate">
        <el-date-picker clearable
          v-model="queryParams.publishDate"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="请选择发布日期">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="查看次数" prop="viewCount">
        <el-input
          v-model="queryParams.viewCount"
          placeholder="请输入查看次数"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="点赞次数" prop="likeCount">
        <el-input
          v-model="queryParams.likeCount"
          placeholder="请输入点赞次数"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="创建时间" prop="createdAt">
        <el-date-picker clearable
          v-model="queryParams.createdAt"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="请选择创建时间">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="更新时间" prop="updatedAt">
        <el-date-picker clearable
          v-model="queryParams.updatedAt"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="请选择更新时间">
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
      <el-table-column label="设计方案ID" align="center" prop="id" />
      <el-table-column label="设计方案标题" align="center" prop="title" />
      <el-table-column label="标语" align="center" prop="tagline" />
      <el-table-column label="价格" align="center" prop="price" />
      <el-table-column label="风格ID" align="center" prop="styleId" />
      <el-table-column label="适用空间" align="center" prop="spaceType" />
      <el-table-column label="推荐面积" align="center" prop="recommendedArea" />
      <el-table-column label="预算范围" align="center" prop="budgetRange" />
      <el-table-column label="主图URL" align="center" prop="mainImageUrl" />
      <el-table-column label="预览图URL列表，以逗号分隔" align="center" prop="previewImages" />
      <el-table-column label="色彩方案描述" align="center" prop="colorSchemeDescription" />
      <el-table-column label="设计理念" align="center" prop="designConcept" />
      <el-table-column label="设计特点" align="center" prop="features" />
      <el-table-column label="设计师ID" align="center" prop="designerId" />
      <el-table-column label="状态：草稿、已发布、已归档" align="center" prop="status" />
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

    <!-- 添加或修改设计方案对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="设计方案标题" prop="title">
          <el-input v-model="form.title" placeholder="请输入设计方案标题" />
        </el-form-item>
        <el-form-item label="标语" prop="tagline">
          <el-input v-model="form.tagline" placeholder="请输入标语" />
        </el-form-item>
        <el-form-item label="价格" prop="price">
          <el-input v-model="form.price" placeholder="请输入价格" />
        </el-form-item>
        <el-form-item label="风格ID" prop="styleId">
          <el-input v-model="form.styleId" placeholder="请输入风格ID" />
        </el-form-item>
        <el-form-item label="推荐面积" prop="recommendedArea">
          <el-input v-model="form.recommendedArea" placeholder="请输入推荐面积" />
        </el-form-item>
        <el-form-item label="预算范围" prop="budgetRange">
          <el-input v-model="form.budgetRange" placeholder="请输入预算范围" />
        </el-form-item>
        <el-form-item label="主图URL" prop="mainImageUrl">
          <el-input v-model="form.mainImageUrl" placeholder="请输入主图URL" />
        </el-form-item>
        <el-form-item label="预览图URL列表，以逗号分隔" prop="previewImages">
          <el-input v-model="form.previewImages" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="色彩方案描述" prop="colorSchemeDescription">
          <el-input v-model="form.colorSchemeDescription" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="设计理念" prop="designConcept">
          <el-input v-model="form.designConcept" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="设计特点" prop="features">
          <el-input v-model="form.features" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="设计师ID" prop="designerId">
          <el-input v-model="form.designerId" placeholder="请输入设计师ID" />
        </el-form-item>
        <el-form-item label="发布日期" prop="publishDate">
          <el-date-picker clearable
            v-model="form.publishDate"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择发布日期">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="查看次数" prop="viewCount">
          <el-input v-model="form.viewCount" placeholder="请输入查看次数" />
        </el-form-item>
        <el-form-item label="点赞次数" prop="likeCount">
          <el-input v-model="form.likeCount" placeholder="请输入点赞次数" />
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
  </div>
</template>

<script>
import { listDsgnDesignSchemes, getDsgnDesignSchemes, delDsgnDesignSchemes, addDsgnDesignSchemes, updateDsgnDesignSchemes } from "@/api/dsgn/dsgnDesignSchemes";

export default {
  name: "DsgnDesignSchemes",
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
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        title: null,
        tagline: null,
        price: null,
        styleId: null,
        spaceType: null,
        recommendedArea: null,
        budgetRange: null,
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
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        title: [
          { required: true, message: "设计方案标题不能为空", trigger: "blur" }
        ],
      }
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
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        id: null,
        title: null,
        tagline: null,
        price: null,
        styleId: null,
        spaceType: null,
        recommendedArea: null,
        budgetRange: null,
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
      };
      this.resetForm("form");
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
      this.reset();
      this.open = true;
      this.title = "添加设计方案";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getDsgnDesignSchemes(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改设计方案";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateDsgnDesignSchemes(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addDsgnDesignSchemes(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
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
