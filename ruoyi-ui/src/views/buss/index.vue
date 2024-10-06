<template>
  <div id="app">
    <el-header>
      <div class="header-content">
        <h1>奢华现代风格室内设计</h1>
        <p class="tagline">优雅与舒适的完美融合</p>
      </div>
    </el-header>

    <el-main>
      <el-image :src="mainImage" fit="cover" class="main-image"></el-image>

      <el-row :gutter="20" class="design-info">
        <el-col :span="12">
          <el-card class="info-card">
            <h2>设计概览</h2>
            <p><strong>风格：</strong>奢华现代</p>
            <p><strong>适用空间：</strong>大型客厅</p>
            <p><strong>推荐面积：</strong>40-60平方米</p>
            <p><strong>预算范围：</strong>￥150,000 - ￥300,000</p>
          </el-card>
        </el-col>
        <el-col :span="12">
          <el-card class="info-card">
            <h2>色彩方案</h2>
            <div class="color-scheme">
              <div class="color-swatch" style="background-color: #1a1a1a;"></div>
              <div class="color-swatch" style="background-color: #f8f8f8;"></div>
              <div class="color-swatch" style="background-color: #d4af37;"></div>
            </div>
            <p>深邃黑色、纯净白色与金色的完美搭配，营造出奢华而不失现代感的氛围。</p>
          </el-card>
        </el-col>
      </el-row>

      <h2>精选家具</h2>
      <el-row :gutter="20" class="furniture-grid">
        <el-col :span="8" v-for="item in furnitureItems" :key="item.id">
          <el-card class="furniture-item" :body-style="{ padding: '0px' }">
            <el-image :src="item.image" fit="cover" class="furniture-image"></el-image>
            <div style="padding: 14px;">
              <h3>{{ item.title }}</h3>
              <p>{{ item.description }}</p>
            </div>
          </el-card>
        </el-col>
      </el-row>

      <h2>设计预览</h2>
      <div class="preview-grid">
        <div v-for="(image, index) in previewImages" :key="index" class="preview-item">
          <el-image
            :src="image"
            fit="cover"
            :preview-src-list="previewImages"
          ></el-image>
        </div>
      </div>

      <div style="text-align: center; margin-top: 50px;">
        <h2>想要打造您的奢华空间？</h2>
        <el-button type="primary" size="large">联系我们的设计师</el-button>
      </div>

      <h2>用户评论</h2>
      <div class="comments-section">
        <div v-for="comment in comments" :key="comment.id" class="comment">
          <div class="comment-header">
            <el-avatar :src="comment.avatar"></el-avatar>
            <div class="comment-info">
              <h3>{{ comment.user }}</h3>
              <span class="comment-date">{{ comment.date }}</span>
            </div>
          </div>
          <p class="comment-content">{{ comment.content }}</p>
          <el-button size="small" @click="showReplyForm(comment.id)">回复</el-button>
          <div v-if="comment.replies && comment.replies.length > 0" class="replies">
            <div v-for="reply in comment.replies" :key="reply.id" class="reply">
              <div class="comment-header">
                <el-avatar :src="reply.avatar"></el-avatar>
                <div class="comment-info">
                  <h4>{{ reply.user }}</h4>
                  <span class="comment-date">{{ reply.date }}</span>
                </div>
              </div>
              <p class="comment-content">{{ reply.content }}</p>
            </div>
          </div>
          <el-form v-if="replyingTo === comment.id" @submit.native.prevent="addReply(comment.id)" class="reply-form">
            <el-input v-model="replyContent" placeholder="输入您的回复"></el-input>
            <el-button type="primary" @click="addReply(comment.id)">提交回复</el-button>
          </el-form>
        </div>
      </div>

      <h3>添加评论</h3>
      <el-form @submit.native.prevent="addComment" class="comment-form">
        <el-input v-model="newComment" type="textarea" :rows="3" placeholder="输入您的评论"></el-input>
        <el-button type="primary" @click="addComment">提交评论</el-button>
      </el-form>
    </el-main>

    <el-footer>
      <p>&copy; 2024 奢华室内设计工作室. 保留所有权利。</p>
    </el-footer>
  </div>
</template>

<script>
export default {
  data() {
    return {
      mainImage: 'https://images.unsplash.com/photo-1618221195710-dd6b41faaea6?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2000&q=80',
      furnitureItems: [
        {
          id: 1,
          title: '意大利进口真皮沙发',
          description: '优雅曲线，触感细腻，尽显高贵品质。',
          image: 'https://images.unsplash.com/photo-1567016432779-094069958ea5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=800&q=80'
        },
        {
          id: 2,
          title: '现代大理石茶几',
          description: '天然大理石面，金色不锈钢架，彰显品味。',
          image: 'https://images.unsplash.com/photo-1533090368676-1fd25485db88?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=800&q=80'
        },
        {
          id: 3,
          title: '奢华水晶吊灯',
          description: '多层次设计，光影交错，为空间增添华贵感。',
          image: 'https://images.unsplash.com/photo-1513506003901-1e6a229e2d15?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=800&q=80'
        }
      ],
      previewImages: [
        'https://images.unsplash.com/photo-1618219908412-a29a1bb7b86e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=700&q=80',
        'https://images.unsplash.com/photo-1600210492493-0946911123ea?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=700&q=80',
        'https://images.unsplash.com/photo-1600607687939-ce8a6c25118c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=700&q=80',
        'https://images.unsplash.com/photo-1600121848594-d8644e57abab?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=700&q=80',
        'https://images.unsplash.com/photo-1618219908412-a29a1bb7b86e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=700&q=80',
        'https://images.unsplash.com/photo-1600210492493-0946911123ea?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=700&q=80',
        'https://images.unsplash.com/photo-1600607687939-ce8a6c25118c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=700&q=80',
        'https://images.unsplash.com/photo-1600121848594-d8644e57abab?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=700&q=80',
        'https://images.unsplash.com/photo-1618219908412-a29a1bb7b86e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=700&q=80',
        'https://images.unsplash.com/photo-1600210492493-0946911123ea?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=700&q=80',
        'https://images.unsplash.com/photo-1600607687939-ce8a6c25118c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=700&q=80',
        'https://images.unsplash.com/photo-1600121848594-d8644e57abab?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=700&q=80',
      ],
      comments: [
        {
          id: 1,
          user: '张三',
          avatar: 'https://randomuser.me/api/portraits/men/1.jpg',
          content: '这个设计太棒了！我很喜欢这种奢华的风格。',
          date: '2023-06-01',
          replies: [
            {
              id: 101,
              user: '设计师李',
              avatar: 'https://randomuser.me/api/portraits/women/1.jpg',
              content: '谢谢您的喜欢，我们一直致力于打造高品质的室内设计。',
              date: '2023-06-02'
            }
          ]
        },
        {
          id: 2,
          user: '李四',
          avatar: 'https://randomuser.me/api/portraits/men/2.jpg',
          content: '请问这种风格适合小户型吗？',
          date: '2023-06-03',
          replies: []
        }
      ],
      newComment: '',
      replyingTo: null,
      replyContent: ''
    }
  },
  methods: {
    showReplyForm(commentId) {
      this.replyingTo = commentId;
    },
    addComment() {
      if (this.newComment.trim()) {
        this.comments.push({
          id: this.comments.length + 1,
          user: '匿名用户',
          avatar: 'https://randomuser.me/api/portraits/lego/1.jpg',
          content: this.newComment,
          date: new Date().toISOString().split('T')[0],
          replies: []
        });
        this.newComment = '';
      }
    },
    addReply(commentId) {
      if (this.replyContent.trim()) {
        const comment = this.comments.find(c => c.id === commentId);
        if (comment) {
          comment.replies.push({
            id: comment.replies.length + 1,
            user: '匿名用户',
            avatar: 'https://randomuser.me/api/portraits/lego/2.jpg',
            content: this.replyContent,
            date: new Date().toISOString().split('T')[0]
          });
          this.replyContent = '';
          this.replyingTo = null;
        }
      }
    }
  }
}
</script>

<style>
body {
  font-family: 'Roboto', sans-serif;
  line-height: 1.6;
  color: #333;
  margin: 0;
  padding: 0;
}

.el-header {
  background-color: #1a1a1a;
  color: #fff;
  padding: 20px 0;
}

.header-content {
  max-width: 1200px;
  margin: 0 auto;
  text-align: center;
}

.el-header h1 {
  margin: 0;
  font-size: 2.5em;
  font-weight: 300;
  letter-spacing: 2px;
}

.tagline {
  color: #d4af37;
  font-style: italic;
  margin-top: 10px;
  font-size: 1.2em;
}

.el-main {
  max-width: 1200px;
  margin: 0 auto;
  padding: 20px;
}

.main-image {
  width: 100%;
  height: 70vh;
  margin-bottom: 30px;
}

.design-info {
  margin-bottom: 30px;
}

.info-card {
  height: 100%;
}

.color-scheme {
  display: flex;
  justify-content: space-around;
  margin-top: 20px;
}

.color-swatch {
  width: 50px;
  height: 50px;
  border-radius: 50%;
  box-shadow: 0 1px 3px rgba(0,0,0,0.12), 0 1px 2px rgba(0,0,0,0.24);
}

.furniture-grid {
  margin-bottom: 30px;
}

.furniture-image {
  width: 100%;
  height: 200px;
  object-fit: cover;
}

.preview-grid {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 20px;
  margin-top: 20px;
}

.preview-item {
  position: relative;
  width: 100%;
  padding-top: 100%; /* 1:1 Aspect Ratio */
}

.preview-item .el-image {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.preview-item:nth-child(3n-1) {
  transform: translateY(50%);
}

.comments-section {
  margin-top: 30px;
}

.comment {
  margin-bottom: 20px;
  padding: 20px;
  background-color: #f9f9f9;
  border-radius: 10px;
  box-shadow: 0 2px 4px rgba(0,0,0,0.1);
}

.comment-header {
  display: flex;
  align-items: center;
  margin-bottom: 10px;
}

.comment-info {
  margin-left: 15px;
}

.comment-info h3, .comment-info h4 {
  margin: 0;
  font-weight: 600;
}

.comment-date {
  font-size: 0.8em;
  color: #888;
}

.comment-content {
  margin-top: 10px;
  margin-bottom: 15px;
}

.replies {
  margin-left: 40px;
  margin-top: 15px;
}

.reply {
  background-color: #f0f0f0;
  border-radius: 8px;
  padding: 15px;
  margin-bottom: 10px;
}

.reply-form, .comment-form {
  margin-top: 15px;
}

.reply-form .el-input, .comment-form .el-input {
  margin-bottom: 10px;
}

.el-footer {
  background-color: #1a1a1a;
  color: #fff;
  text-align: center;
  padding: 20px 0;
  margin-top: 50px;
}

@media (max-width: 768px) {
  .el-row {
    flex-direction: column;
  }
  .el-col {
    width: 100% !important;
  }
  .preview-grid {
    grid-template-columns: repeat(2, 1fr);
  }
  .preview-item:nth-child(3n-1) {
    transform: none;
  }
  .preview-item:nth-child(even) {
    transform: translateY(50%);
  }
  .replies {
    margin-left: 20px;
  }
}
</style>
