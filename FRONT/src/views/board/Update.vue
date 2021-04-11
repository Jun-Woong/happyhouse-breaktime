<template>
  <div>
    <br />
    <h2 class="text-center">공지사항</h2>
    <br />
    <b-container class="bv-example-row">
      <b-col>
        <div class="form-group">
          <label for="writer">작성자</label>
          <input
            type="text"
            class="form-control"
            id="writer"
            ref="writer"
            placeholder="작성자를 입력하세요"
            v-model="writer"
            readonly
          />
        </div>
        <div class="form-group">
          <label for="title">제목</label>
          <input
            type="text"
            class="form-control"
            id="title"
            ref="title"
            placeholder="제목을 입력하세요"
            v-model="title"
          />
        </div>
        <div class="form-group">
          <label for="content">내용</label>
          <textarea
            type="text"
            class="form-control"
            id="contnet"
            ref="content"
            placeholder="내용을 입력하세요"
            v-model="content"
          ></textarea>
        </div>
        <div class="text-right">
          <button id="upd" class="btn btn-success" @click="checkHandler">
            수정
          </button>
          <button class="btn btn-info" @click="moveList">목록</button>
        </div>
      </b-col>
    </b-container>
  </div>
</template>
<script>
import axios from "axios";
export default {
  data() {
    return {
      no: "",
      regtime: "",
      writer: "",
      title: "",
      content: ""
    };
  },
  created() {
    axios
      .get(`http://localhost:9999/vue/api/board/${this.$route.query.no}`)
      .then(({ data }) => {
        this.no = data.no;
        this.regtime = data.regtime;
        this.writer = data.writer;
        this.title = data.title;
        this.content = data.content;
      });
  },
  methods: {
    moveList() {
      this.$router.push("/board");
    },
    checkHandler() {
      let err = true;
      let msg = "";
      !this.writer &&
        ((msg = "작성자를 입력해주세요"),
        (err = false),
        this.$refs.writer.focus());
      err &&
        !this.title &&
        ((msg = "제목 입력해주세요"), (err = false), this.$refs.title.focus());
      err &&
        !this.content &&
        ((msg = "내용 입력해주세요"),
        (err = false),
        this.$refs.content.focus());
      if (!err) alert(msg);
      else this.updateHandler();
    },
    updateHandler() {
      axios
        .put(`http://localhost:9999/vue/api/board/${this.$route.query.no}`, {
          no: this.no,
          regtime: this.regtime,
          writer: this.writer,
          title: this.title,
          content: this.content
        })
        .then(({ data }) => {
          let msg = "수정 처리시 문제가 발생했습니다.";
          if (data === "success") {
            msg = "수정이 완료되었습니다.";
          }
          alert(msg);
          this.$router.push("/board");
        });
    }
  }
};
</script>
<style></style>
