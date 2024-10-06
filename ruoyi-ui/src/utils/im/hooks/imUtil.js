import request from '@/utils/request'
import { Message } from 'element-ui'

export default {
  data() {
    return {
      showBodyLeft: true,
      systemMessages: [],
      imageList: []
    };
  },
  methods: {
    changeAside() {
      this.showBodyLeft = !this.showBodyLeft;
      this.mobileRight();
    },

    mobileRight() {
      if (this.showBodyLeft && this.$common.mobile()) {
        $(".body-right").addClass("mobile-right");
      } else if (!this.showBodyLeft && this.$common.mobile()) {
        $(".body-right").removeClass("mobile-right");
      }
    },

    getSystemMessages() {
      request({
        url: '/imChatUserMessage/listSystemMessage',
        method: 'get'
      }).then((res) => {
        if (!this.$common.isEmpty(res.data) && !this.$common.isEmpty(res.data.records)) {
          this.systemMessages = res.data.records;
        }
      }).catch((error) => {
        Message.error(error.message);
      });
    },

    hiddenBodyLeft() {
      if (this.$common.mobile()) {
        $(".body-right").click(() => {
          this.showBodyLeft = false;
          this.mobileRight();
        });
      }
    },

    imgShow() {
      $(".message img").click(function () {
        let src = $(this).attr("src");
        $("#bigImg").attr("src", src);

        $("<img/>").attr("src", src).load(function () {
          let windowW = $(window).width();
          let windowH = $(window).height();
          let realWidth = this.width;
          let realHeight = this.height;
          let imgWidth, imgHeight;
          let scale = 0.8;

          if (realHeight > windowH * scale) {
            imgHeight = windowH * scale;
            imgWidth = imgHeight / realHeight * realWidth;
            if (imgWidth > windowW * scale) {
              imgWidth = windowW * scale;
            }
          } else if (realWidth > windowW * scale) {
            imgWidth = windowW * scale;
            imgHeight = imgWidth / realWidth * realHeight;
          } else {
            imgWidth = realWidth;
            imgHeight = realHeight;
          }
          $("#bigImg").css("width", imgWidth);

          let w = (windowW - imgWidth) / 2;
          let h = (windowH - imgHeight) / 2;
          $("#innerImg").css({"top": h, "left": w});
          $("#outerImg").fadeIn("fast");
        });

        $("#outerImg").click(function () {
          $(this).fadeOut("fast");
        });
      });
    },

    getImageList() {
      request({
        url: '/resource/getImageList',
        method: 'get'
      }).then((res) => {
        if (!this.$common.isEmpty(res.data)) {
          this.imageList = res.data;
        }
      }).catch((error) => {
        Message.error(error.message);
      });
    },

    parseMessage(content) {
      content = content.replace(/\n{2,}/g, '<div style="height: 12px"></div>');
      content = content.replace(/\n/g, '<br/>');
      content = this.$common.faceReg(content);
      content = this.$common.pictureReg(content);
      return content;
    },

    initMobileEvents() {
      if (this.$common.mobile()) {
        $(".friend-aside").click(() => {
          this.showBodyLeft = true;
          this.mobileRight();
        });

        $(".body-right").click(() => {
          this.showBodyLeft = false;
          this.mobileRight();
        });
      }
      this.mobileRight();
    }
  },
  mounted() {
    this.initMobileEvents();
  }
};
