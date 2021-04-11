<template>
  <div>
    <br />
    <h2 class="text-center">질문과 답변</h2>
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
          <label for="title">질문</label>
          <input
            type="text"
            class="form-control"
            id="title"
            ref="title"
            placeholder="질문을 입력하세요"
            v-model="title"
          />
        </div>
        <div class="form-group" style="display : none">
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
          <button id="reg" class="btn btn-success" @click="checkHandler">
            등록
          </button>
          <button class="btn btn-info" @click="moveList">목록</button>
        </div>
      </b-col>
    </b-container>
  </div>
</template>
<script>
import axios from "axios";
import { mapGetters } from "vuex";
export default {
  data() {
    return {
      no: "",
      regtime: "",
      writer: "",
      title: "",
      content: "아직 답변이 작성되어 있지 않습니다!"
    };
  },
  computed: {
    ...mapGetters(["getAccessToken", "getUserId", "getUserName"])
  },

  created() {
    this.writer = this.$store.getters.getUserId;
  },

  methods: {
    checkHandler() {
      let err = true;
      let msg = "";
      !this.writer &&
        ((msg = "작성자를 입력해주세요"),
        (err = false),
        this.$refs.writer.focus());
      err &&
        !this.title &&
        ((msg = "질문을 입력해주세요"),
        (err = false),
        this.$refs.title.focus());
      err &&
        !this.content &&
        ((msg = "내용 입력해주세요"),
        (err = false),
        this.$refs.content.focus());
      if (!err) alert(msg);
      else this.createHandler();
    },
    createHandler() {
      axios
        .post(`http://localhost:9999/vue/api/QnA`, {
          writer: this.writer,
          title: this.title,
          content: this.content
        })
        .then(({ data }) => {
          let msg = "등록 처리시 문제가 발생했습니다.";
          if (data === "success") {
            msg = "등록이 완료되었습니다.";
          }
          alert(msg);
          this.moveList();
        });
    },
    moveList() {
      this.$router.push("/QnA");
    },
    IsMe(getUserId) {
      if (getUserId === "admin") {
        return true;
      } else {
        return false;
      }
    }
  }
};
</script>
<style></style>
