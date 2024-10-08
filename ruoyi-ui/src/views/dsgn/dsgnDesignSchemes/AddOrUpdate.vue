<template>
  <el-dialog :title="title" :visible.sync="visible" width="800px" append-to-body>
    <el-form ref="form" :model="form" :rules="rules" label-width="100px">
      <el-row :gutter="20">
        <el-col :span="12">
          <el-form-item label="设计方案标题" prop="title">
            <el-input v-model="form.title" placeholder="请输入设计方案标题" />
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="标语" prop="tagline">
            <el-input v-model="form.tagline" placeholder="请输入标语" />
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="价格" prop="price">
            <el-input v-model="form.price" placeholder="请输入价格" />
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="风格ID" prop="styleId">
            <el-input v-model="form.styleId" placeholder="请输入风格ID" />
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="推荐面积下限" prop="recommendedAreaMin">
            <el-input v-model="form.recommendedAreaMin" placeholder="请输入推荐面积下限" />
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="推荐面积上限" prop="recommendedAreaMax">
            <el-input v-model="form.recommendedAreaMax" placeholder="请输入推荐面积上限" />
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="预算范围下限" prop="budgetRangeMin">
            <el-input v-model="form.budgetRangeMin" placeholder="请输入预算范围下限" />
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="预算上限" prop="budgetRangeMax">
            <el-input v-model="form.budgetRangeMax" placeholder="请输入预算上限" />
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="主图URL" prop="mainImageUrl">
            <el-input v-model="form.mainImageUrl" placeholder="请输入主图URL" />
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="设计师ID" prop="designerId">
            <el-input v-model="form.designerId" placeholder="请输入设计师ID" />
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="发布日期" prop="publishDate">
            <el-date-picker
              v-model="form.publishDate"
              type="date"
              value-format="yyyy-MM-dd"
              placeholder="请选择发布日期">
            </el-date-picker>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="查看次数" prop="viewCount">
            <el-input v-model="form.viewCount" placeholder="请输入查看次数" />
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="点赞次数" prop="likeCount">
            <el-input v-model="form.likeCount" placeholder="请输入点赞次数" />
          </el-form-item>
        </el-col>
      </el-row>
      <el-row>
        <el-col :span="24">
          <el-form-item label="预览图URL列表" prop="previewImages">
            <el-input v-model="form.previewImages" type="textarea" placeholder="请输入预览图URL列表，以逗号分隔" />
          </el-form-item>
        </el-col>
      </el-row>
      <el-row>
        <el-col :span="24">
          <el-form-item label="色彩方案描述" prop="colorSchemeDescription">
            <el-input v-model="form.colorSchemeDescription" type="textarea" placeholder="请输入色彩方案描述" />
          </el-form-item>
        </el-col>
      </el-row>
      <el-row>
        <el-col :span="24">
          <el-form-item label="设计理念" prop="designConcept">
            <el-input v-model="form.designConcept" type="textarea" placeholder="请输入设计理念" />
          </el-form-item>
        </el-col>
      </el-row>
      <el-row>
        <el-col :span="24">
          <el-form-item label="设计特点" prop="features">
            <el-input v-model="form.features" type="textarea" placeholder="请输入设计特点" />
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
import { addDsgnDesignSchemes, updateDsgnDesignSchemes } from "@/api/dsgn/dsgnDesignSchemes";

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
        title: [
          { required: true, message: "设计方案标题不能为空", trigger: "blur" }
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
            updateDsgnDesignSchemes(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.visible = false;
              this.$emit('refreshData');
            });
          } else {
            addDsgnDesignSchemes(this.form).then(response => {
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
      };
      this.resetForm("form");
    }
  }
};
</script>
