<template>
  <div>
    <!-- Picture上传组件辅助-->
    <el-upload
      class="avatar-uploader"
      :action="getActionUrl"
      name="file"
      :headers="header"
      :show-file-list="false"
      :on-success="uploadSuccess"
      :on-error="uploadError"
      :before-upload="beforeUpload"
    ></el-upload>

    <quill-editor
      class="editor"
      v-model="value"
      ref="myQuillEditor"
      :options="editorOption"
      @blur="onEditorBlur($event)"
      @focus="onEditorFocus($event)"
      @change="onEditorChange($event)"
    ></quill-editor>
  </div>
</template>
<script>
// 工具栏配置
const toolbarOptions = [
  ["bold", "italic", "underline", "strike"], // 加粗 斜体 下划线 delete线
  ["blockquote", "code-block"], // 引用  代码块
  [{ header: 1 }, { header: 2 }], // 1、2 级title
  [{ list: "ordered" }, { list: "bullet" }], // 有序、无序list
  [{ script: "sub" }, { script: "super" }], // 上标/下标
  [{ indent: "-1" }, { indent: "+1" }], // 缩进
  // [{'direction': 'rtl'}],                         // 文本方向
  [{ size: ["small", false, "large", "huge"] }], // 字体大小
  [{ header: [1, 2, 3, 4, 5, 6, false] }], // title
  [{ color: [] }, { background: [] }], // 字体颜色、字体背景颜色
  [{ font: [] }], // 字体种类
  [{ align: [] }], // 对齐mode
  ["clean"], // 清除文本format
  ["link", "image", "video"] // 链接、Picture、视频
];

import { quillEditor } from "vue-quill-editor";
import "quill/dist/quill.core.css";
import "quill/dist/quill.snow.css";
import "quill/dist/quill.bubble.css";

export default {
  props: {
    /*edit器 content*/
    value: {
      type: String
    },
    action: {
      type: String
    },
    /*Picture大小*/
    maxSize: {
      type: Number,
      default: 4000 //kb
    }
  },

  components: {
    quillEditor
  },

  data() {
    return {
      content: this.value,
      quillUpdateImg: false, // 根据Picture上传状态来confirmYesNo显示loading动画，刚开始Yesfalse,不显示
      editorOption: {
        placeholder: "",
        theme: "snow", // or 'bubble'
        modules: {
          toolbar: {
            container: toolbarOptions,
            // container: "#toolbar",
            handlers: {
              image: function(value) {
                if (value) {
                  // 触发input框选择Picturefile
                  document.querySelector(".avatar-uploader input").click();
                } else {
                  this.quill.format("image", false);
                }
              }
              // link: function(value) {
              //   if (value) {
              //     var href = prompt('inputurl');
              //     this.quill.format("link", href);
              //   } else {
              //     this.quill.format("link", false);
              //   }
              // },
            }
          }
        }
      },
      // serverUrl: `${base.url}sys/storage/uploadSwiper?token=${storage.get('token')}`, // 这里写你要上传的Picture服务器地址
      header: {
        // token: sessionStorage.token
       'Token': this.$storage.get("Token")
      } // 有的Picture服务器要求请求头需要有token
    };
  },
  computed: {
    // 计算属性的 getter
    getActionUrl: function() {
      // return this.$base.url + this.action + "?token=" + this.$storage.get("token");
      return `/${this.$base.name}/` + this.action;
    }
  },
  methods: {
    onEditorBlur() {
      //失去焦点事件
    },
    onEditorFocus() {
      //获得焦点事件
    },
    onEditorChange() {
      console.log(this.value);
      //content改变事件
      this.$emit("input", this.value);
    },
    // 富文本Picture上传前
    beforeUpload() {
      // 显示loading动画
      this.quillUpdateImg = true;
    },

    uploadSuccess(res, file) {
      // res为Picture服务器return的数据
      // 获取富文本组件实例
      let quill = this.$refs.myQuillEditor.quill;
      // 如果Upload success
      if (res.code === 0) {
        // 获取光标所在位置
        let length = quill.getSelection().index;
        // 插入Picture  res.url为服务器return的Picture地址
        quill.insertEmbed(length, "image", this.$base.url+ "upload/" +res.file);
        // 调整光标到最后
        quill.setSelection(length + 1);
      } else {
        this.$message.error("Picture insertion failed");
      }
      // loading动画消失
      this.quillUpdateImg = false;
    },
    // 富文本Picture上传失败
    uploadError() {
      // loading动画消失
      this.quillUpdateImg = false;
      this.$message.error("Picture insertion failed");
    }
  }
};
</script> 

<style>
.editor {
  line-height: normal !important;
}
.ql-snow .ql-tooltip[data-mode="link"]::before {
  content: "Input link address:";
}
.ql-snow .ql-tooltip.ql-editing a.ql-action::after {
  border-right: 0px;
  content: "save";
  padding-right: 0px;
}

.ql-snow .ql-tooltip[data-mode="video"]::before {
  content: "Input video address:";
}
.ql-container {
	height: 400px;
}

.ql-snow .ql-picker.ql-size .ql-picker-label::before,
.ql-snow .ql-picker.ql-size .ql-picker-item::before {
  content: "14px";
}
.ql-snow .ql-picker.ql-size .ql-picker-label[data-value="small"]::before,
.ql-snow .ql-picker.ql-size .ql-picker-item[data-value="small"]::before {
  content: "10px";
}
.ql-snow .ql-picker.ql-size .ql-picker-label[data-value="large"]::before,
.ql-snow .ql-picker.ql-size .ql-picker-item[data-value="large"]::before {
  content: "18px";
}
.ql-snow .ql-picker.ql-size .ql-picker-label[data-value="huge"]::before,
.ql-snow .ql-picker.ql-size .ql-picker-item[data-value="huge"]::before {
  content: "32px";
}

.ql-snow .ql-picker.ql-header .ql-picker-label::before,
.ql-snow .ql-picker.ql-header .ql-picker-item::before {
  content: "文本";
}
.ql-snow .ql-picker.ql-header .ql-picker-label[data-value="1"]::before,
.ql-snow .ql-picker.ql-header .ql-picker-item[data-value="1"]::before {
  content: "title1";
}
.ql-snow .ql-picker.ql-header .ql-picker-label[data-value="2"]::before,
.ql-snow .ql-picker.ql-header .ql-picker-item[data-value="2"]::before {
  content: "title2";
}
.ql-snow .ql-picker.ql-header .ql-picker-label[data-value="3"]::before,
.ql-snow .ql-picker.ql-header .ql-picker-item[data-value="3"]::before {
  content: "title3";
}
.ql-snow .ql-picker.ql-header .ql-picker-label[data-value="4"]::before,
.ql-snow .ql-picker.ql-header .ql-picker-item[data-value="4"]::before {
  content: "title4";
}
.ql-snow .ql-picker.ql-header .ql-picker-label[data-value="5"]::before,
.ql-snow .ql-picker.ql-header .ql-picker-item[data-value="5"]::before {
  content: "title5";
}
.ql-snow .ql-picker.ql-header .ql-picker-label[data-value="6"]::before,
.ql-snow .ql-picker.ql-header .ql-picker-item[data-value="6"]::before {
  content: "title6";
}

.ql-snow .ql-picker.ql-font .ql-picker-label::before,
.ql-snow .ql-picker.ql-font .ql-picker-item::before {
  content: "Standard font";
}
.ql-snow .ql-picker.ql-font .ql-picker-label[data-value="serif"]::before,
.ql-snow .ql-picker.ql-font .ql-picker-item[data-value="serif"]::before {
  content: "Serif font";
}
.ql-snow .ql-picker.ql-font .ql-picker-label[data-value="monospace"]::before,
.ql-snow .ql-picker.ql-font .ql-picker-item[data-value="monospace"]::before {
  content: "Equal-width font";
}
</style>