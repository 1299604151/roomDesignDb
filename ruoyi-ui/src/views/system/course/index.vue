<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="课程编号" prop="courseId">
        <el-input
          v-model="queryParams.courseId"
          placeholder="请输入课程编号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="课程名称" prop="courseName">
        <el-input
          v-model="queryParams.courseName"
          placeholder="请输入课程名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="授课场地" prop="venue">
        <el-input
          v-model="queryParams.venue"
          placeholder="请输入授课场地"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="授课时间" prop="classTime">
        <el-date-picker
          v-model="form.classTime"
          type="datetime"
          placeholder="选择日期时间"
          value-format="yyyy-MM-dd HH:mm:ss">
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
          v-hasPermi="['system:course:add']"
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
          v-hasPermi="['system:course:edit']"
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
          v-hasPermi="['system:course:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['system:course:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="courseList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="主键ID" align="center" prop="id" />
      <el-table-column label="课程编号" align="center" prop="courseId" />
      <el-table-column label="课程名称" align="center" prop="courseName" />
      <el-table-column label="课程描述" align="center" prop="courseDescription" />
      <el-table-column label="授课场地" align="center" prop="venue" />
      <el-table-column label="授课时间" align="center" prop="classTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.classTime, '{y}-{m}-{d} {h}:{i}:{s}') }}</span>
        </template>
      </el-table-column>

      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['system:course:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleSelectCourse(scope.row)"
            v-if="!myCourseIds.includes(scope.row.courseId)"
            v-hasPermi="['system:course:select']"
          >选课</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleScheduleCourse(scope.row)"
            v-hasPermi="['system:schedule:add']"
          >排课</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:course:remove']"
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

    <!-- 添加或修改课程信息对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="课程编号" prop="courseId">
          <el-input v-model="form.courseId" placeholder="请输入课程编号" />
        </el-form-item>
        <el-form-item label="课程名称" prop="courseName">
          <el-input v-model="form.courseName" placeholder="请输入课程名称" />
        </el-form-item>
        <el-form-item label="课程描述" prop="courseDescription">
          <el-input v-model="form.courseDescription" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="授课场地" prop="venue">
          <el-input v-model="form.venue" placeholder="请输入授课场地" />
        </el-form-item>
        <el-form-item label="授课时间" prop="classTime">
          <el-date-picker
            v-model="form.classTime"
            type="datetime"
            placeholder="选择日期时间"
            value-format="yyyy-MM-dd HH:mm:ss">
          </el-date-picker>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>

    <!-- 新增的排课对话框 -->
    <el-dialog title="排课" :visible.sync="scheduleDialogVisible" width="500px" append-to-body>
      <el-form ref="scheduleForm" :model="scheduleForm" label-width="80px">
        <el-form-item label="课程编号">
          <el-input v-model="scheduleForm.courseId" disabled></el-input>
        </el-form-item>
        <el-form-item label="授课时间">
          <el-input v-model="scheduleForm.classTime" disabled></el-input>
        </el-form-item>
        <el-form-item label="授课场地">
          <el-input v-model="scheduleForm.venueId" disabled></el-input>
        </el-form-item>
        <el-form-item label="技术人员" prop="employeeId">
          <el-select v-model="scheduleForm.employeeId" placeholder="请选择技术人员">
            <el-option
              v-for="item in technicianOptions"
              :key="item.employeeId"
              :label="item.name"
              :value="item.employeeId">
            </el-option>
          </el-select>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="scheduleDialogVisible = false">取 消</el-button>
        <el-button type="primary" @click="submitSchedule">确 定</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listCourse, getCourse, delCourse, addCourse, updateCourse, selectCourse, myCourse } from "@/api/system/course";
import { listTechnicianAll } from "@/api/system/technician";
import { addSchedule } from "@/api/system/schedule";

export default {
  name: "Course",
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
      // 课程信息表格数据
      courseList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        courseId: null,
        courseName: null,
        courseDescription: null,
        venue: null,
        classTime: null
      },
      myCourseIds: [],
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        courseId: [
          { required: true, message: "课程编号不能为空", trigger: "blur" }
        ],
        courseName: [
          { required: true, message: "课程名称不能为空", trigger: "blur" }
        ],
      },
      // 新增的数据
      scheduleDialogVisible: false,
      scheduleForm: {
        courseId: '',
        classTime: '',
        venueId: '',
        employeeId: ''
      },
      technicianOptions: []
    };
  },
  created() {
    this.getList();
    this.getMyCourse();
    this.getTechnicianList();
  },
  methods: {
    /** 查询课程信息列表 */
    getList() {
      this.loading = true;
      listCourse(this.queryParams).then(response => {
        this.courseList = response.rows;
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
        courseId: null,
        courseName: null,
        courseDescription: null,
        venue: null,
        classTime: null,
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
      this.title = "添加课程信息";
    },
    // 获取自己选择的课程
    getMyCourse() {
      myCourse().then(response => {
        this.myCourseIds = []
        let list = []
        list = response.rows;
        list.forEach(item => {
          this.myCourseIds.push(item.courseId)
        })
      });
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getCourse(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改课程信息";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateCourse(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addCourse(this.form).then(response => {
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
      this.$modal.confirm('是否确认删除课程信息编号为"' + ids + '"的数据项？').then(function() {
        return delCourse(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('system/course/export', {
        ...this.queryParams
      }, `course_${new Date().getTime()}.xlsx`)
    },
    /**
     * 选课
     * */
    handleSelectCourse(row) {
      const courseId = row.courseId
      const ids = row.id
      this.$modal.confirm('是否确认选择课程信息编号为"' + courseId + '"的数据项？').then(function () {
        return selectCourse(ids);
      }).then(() => {
        this.getList();
        this.getMyCourse();
        this.$modal.msgSuccess("选择成功");
      }).catch(() => {
      });
    },
    // 获取技术人员列表
    getTechnicianList() {
      listTechnicianAll().then(response => {
        this.technicianOptions = response        .rows;
      });
    },

    // 处理排课
    handleScheduleCourse(row) {
      this.scheduleForm.courseId = row.courseId;
      this.scheduleForm.classTime = row.classTime;
      this.scheduleForm.venueId = row.venue;
      this.scheduleForm.employeeId = '';
      this.scheduleDialogVisible = true;
    },

    // 提交排课
    submitSchedule() {
      this.$refs.scheduleForm.validate((valid) => {
        if (valid) {
          addSchedule(this.scheduleForm).then(response => {
            this.$modal.msgSuccess("排课成功");
            this.scheduleDialogVisible = false;
            this.getList();
          }).catch(() => {
            this.$modal.msgError("排课失败");
          });
        }
      });
    }
  }
};
</script>

