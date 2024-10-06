<template>
  <div class="app-container home">
    <el-row :gutter="20">
      <el-col :sm="24" :lg="24">
        <h1 class="page-title">欢迎使用农技培训学习管理系统</h1>
      </el-col>
    </el-row>

    <el-row :gutter="20">
      <el-col :sm="24" :lg="8">
        <el-card class="feature-card">
          <div slot="header">
            <span>课程管理</span>
          </div>
          <div class="feature-content">
            <i class="el-icon-reading feature-icon"></i>
            <p>轻松管理农技培训课程，包括课程创建、编辑和安排。</p>
          </div>
        </el-card>
      </el-col>
      <el-col :sm="24" :lg="8">
        <el-card class="feature-card">
          <div slot="header">
            <span>学员管理</span>
          </div>
          <div class="feature-content">
            <i class="el-icon-user feature-icon"></i>
            <p>高效管理学员信息，跟踪学习进度和成绩。</p>
          </div>
        </el-card>
      </el-col>
      <el-col :sm="24" :lg="8">
        <el-card class="feature-card">
          <div slot="header">
            <span>资源中心</span>
          </div>
          <div class="feature-content">
            <i class="el-icon-folder-opened feature-icon"></i>
            <p>集中存储和管理培训资料、视频和文档。</p>
          </div>
        </el-card>
      </el-col>
    </el-row>

    <el-row :gutter="20" style="margin-top: 20px;">
      <el-col :sm="24" :lg="12">
        <el-card class="stat-card">
          <div slot="header">
            <span>系统概况</span>
          </div>
          <div class="stat-content">
<!--            <el-row>-->
<!--              <el-col :span="12">-->
<!--                <div class="stat-item">-->
<!--                  <div class="stat-number">{{ totalCourses }}</div>-->
<!--                  <div class="stat-label">总课程数</div>-->
<!--                </div>-->
<!--              </el-col>-->
<!--              <el-col :span="12">-->
<!--                <div class="stat-item">-->
<!--                  <div class="stat-number">{{ totalStudents }}</div>-->
<!--                  <div class="stat-label">注册学员数</div>-->
<!--                </div>-->
<!--              </el-col>-->
<!--            </el-row>-->
          </div>
        </el-card>
      </el-col>
      <el-col :sm="24" :lg="12">
        <el-card class="quick-start">
          <div slot="header">
            <span>快速入门</span>
          </div>
          <div class="quick-start-content">
            <p>1. 创建新课程</p>
            <p>2. 添加学习资料</p>
            <p>3. 邀请学员加入</p>
            <p>4. 开始培训学习</p>
            <el-button type="primary" @click="startGuide">查看使用指南</el-button>
          </div>
        </el-card>
      </el-col>
    </el-row>

    <el-row :gutter="20" style="margin-top: 20px;">
      <el-col :sm="24">
        <el-card class="about-system">
          <div slot="header">
            <span>关于系统</span>
          </div>
          <div class="about-content">
            <p>农技培训学习管理系统是专为农业技术培训设计的综合性平台。本系统旨在提高农业技术培训的效率和质量，为农业从业者提供便捷的学习途径。</p>
            <p>
              <b>当前版本:</b> <span>v{{ version }}</span>
            </p>
            <p>
              <el-button type="text" @click="showFeedback">反馈建议</el-button>
              <el-button type="text" @click="showContact">联系我们</el-button>
            </p>
          </div>
        </el-card>
      </el-col>
    </el-row>
  </div>
</template>

<script>

export default {
  name: "Home",
  data() {
    return {
      version: "1.0.0",
    };
  },
  created() {
  },
  methods: {

    startGuide() {
      // 实现查看使用指南的逻辑
      this.$message.info("正在开发使用指南功能");
    },
    showFeedback() {
      // 实现显示反馈建议的逻辑
      this.$message.info("正在开发反馈建议功能");
    },
    showContact() {
      // 实现显示联系方式的逻辑
      this.$message.info("正在开发联系我们功能");
    }
  }
};
</script>

<style scoped lang="scss">
.home {
  .page-title {
    text-align: center;
    margin-bottom: 30px;
    color: #409EFF;
  }

  .feature-card, .stat-card, .quick-start, .about-system {
    height: 100%;
    .feature-content, .stat-content, .quick-start-content, .about-content {
      padding: 20px;
    }
  }

  .feature-icon {
    font-size: 48px;
    color: #409EFF;
    margin-bottom: 10px;
  }

  .stat-item {
    text-align: center;
    .stat-number {
      font-size: 36px;
      font-weight: bold;
      color: #409EFF;
    }
    .stat-label {
      font-size: 14px;
      color: #606266;
    }
  }

  .quick-start-content {
    p {
      margin-bottom: 10px;
    }
  }

  .about-content {
    p {
      margin-bottom: 10px;
    }
  }
}
</style>
