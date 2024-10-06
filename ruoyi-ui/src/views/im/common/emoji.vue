<template>
  <div>
    <transition name="body">
      <div v-show="showEmoji" class="emoji-body">
        <span class="emoji-item"
              v-for="(value, key, index) in emojiListURL"
              :key="index"
              @click="addEmoji(key)">
          <img loading="lazy" class="emoji" :src="value"  :title="key" width="30" height="30"/>
        </span>
      </div>
    </transition>
  </div>
</template>

<script>
import constant from '@/utils/im/constant';
export default {
  props: {
    showEmoji: {
      type: Boolean,
      default: false
    }
  },
  data() {
    return {
      emojiList: constant.emojiList,
      emojiListURL: {}
    };
  },
  created() {
    this.emojiListURL = this.getEmojiList(this.emojiList);
  },
  methods: {
    addEmoji(key) {
      this.$emit("addEmoji", key);
    },
    getEmojiList(emojiList) {
      let result = {};
      for (let i = 0; i < emojiList.length; i++) {
        let emojiName = "[" + emojiList[i] + "]";
        let j = i + 1;
        let url = constant.webStaticResourcePrefix + "common/preview/q" + j + ".png";
        result[emojiName] = url;
      }
      return result;
    }
  }
}
</script>

<style scoped>
.emoji-body {
  max-width: 400px;
}

.emoji-item {
  cursor: pointer;
  display: inline-block;
}

.emoji-item:hover {
  transition: all 0.2s;
  border-radius: 0.25rem;
  background: var(--lightGray);
}

.emoji {
  margin: 0.25rem;
  vertical-align: middle;
}

.body-enter-active, .body-leave-active {
  transition: all 0.3s;
}

.body-enter, .body-leave-to {
  opacity: 0;
  transform: scale(0.5);
}
</style>
