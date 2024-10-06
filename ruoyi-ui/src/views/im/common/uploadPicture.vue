<template>
  <div class="upload-container">
    <el-upload
      class="upload-demo"
      :action="uploadUrl"
      :multiple="maxNumber > 1"
      drag
      :on-remove="handleRemove"
      :limit="maxNumber"
      ref="upload"
      :auto-upload="false"
      :http-request="customUpload"
      :on-change="handleChange"
      :before-upload="beforeUpload"
      :on-success="handleSuccess"
      :on-error="handleError"
      list-type="picture"
      accept="image/*">
      <div class="el-upload__text">
        <img src="@/assets/im/svg/upPic.svg" width="40" height="40" alt="Upload image">
        <div>拖拽上传 / 点击上传</div>
      </div>
      <div class="el-upload__tip" slot="tip">
        一次最多上传{{maxNumber}}张图片，且每张图片不超过{{maxSize}}M！
      </div>
    </el-upload>

    <div class="upload-button">
      <el-button type="success" @click="submitUpload">
        上传
      </el-button>
    </div>
  </div>
</template>

<script>
import { Message } from 'element-ui'
import request from '@/utils/request'

export default {
  props: {
    prefix: {
      type: String,
      default: ""
    },
    maxSize: {
      type: Number,
      default: 5
    },
    maxNumber: {
      type: Number,
      default: 5
    }
  },

  data() {
    return {
      uploadUrl: '/common/upload' // 设置为您的后端上传接口
    }
  },

  created() {
    // 如果需要在组件创建时执行某些操作，可以在这里添加
  },

  methods: {
    submitUpload() {
      this.$refs.upload.submit();
    },

    handleSuccess(response, file, fileList) {
      if (response.code === 200) {
        const url = response.url;
        this.$emit("addPicture", url);
        Message({
          message: '上传成功',
          type: 'success'
        });
      } else {
        this.handleError(response.msg, file, fileList);
      }
    },

    customUpload(options) {
      const formData = new FormData();
      formData.append('file', options.file);

      return request({
        url: this.uploadUrl,
        method: 'post',
        data: formData,
        headers: {
          'Content-Type': 'multipart/form-data'
        }
      });
    },

    handleError(err, file, fileList) {
      Message({
        message: err || '上传失败',
        type: 'error'
      });
    },

    handleRemove(file, fileList) {
      // 处理文件移除逻辑
      console.log('File removed:', file.name);
    },

    beforeUpload(file) {
      // 上传前的处理逻辑
      const isImage = file.type.startsWith('image/');
      if (!isImage) {
        Message({
          message: '只能上传图片文件!',
          type: 'warning'
        });
      }
      return isImage;
    },

    handleChange(file, fileList) {
      let flag = false;

      if (file.size > this.maxSize * 1024 * 1024) {
        Message({
          message: "图片最大为" + this.maxSize + "M！",
          type: 'warning'
        });
        flag = true;
      }

      if (fileList.length > this.maxNumber) {
        flag = true;
      }

      if (flag) {
        fileList.splice(fileList.length - 1, 1);
      }
    }
  }
}
</script>

<style scoped>
.upload-container {
  width: 100%;
  height: 100%;
  display: flex;
  flex-direction: column;
}

.upload-demo {
  flex: 1;
  display: flex;
  flex-direction: column;
}

.el-upload {
  width: 100%;
}

.el-upload-dragger {
  width: 100% !important;
  height: auto !important;
  min-height: 180px;
}

.el-upload__text {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  color: #606266;
  font-size: 14px;
  text-align: center;
}

.el-upload__text img {
  margin-bottom: 8px;
}

.el-upload__tip {
  font-size: 12px;
  color: #606266;
  margin-top: 7px;
}

.upload-button {
  margin-top: 20px;
  text-align: center;
}
</style>
