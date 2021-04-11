<template>
  <b-container class="mt-4" v-if="user">
    <b-row>
      <b-col></b-col>
      <b-col cols="8">
        <b-jumbotron>
          <h1>회원님의 정보입니다.</h1>

          <hr class="my-4" />

          <b-container class="mt-4">
            <b-row>
              <b-col cols="2"></b-col>
              <b-col cols="2" align-self="end">아이디</b-col
              ><b-col cols="4" align-self="start">{{ user.userid }}</b-col>
              <b-col cols="2"></b-col>
            </b-row>
            <b-row>
              <b-col cols="2"></b-col>
              <b-col cols="2" align-self="end">이름</b-col
              ><b-col cols="4" align-self="start">{{ user.username }}</b-col>
              <b-col cols="2"></b-col>
            </b-row>
            <b-row>
              <b-col cols="2"></b-col>
              <b-col cols="2" align-self="end">이메일</b-col
              ><b-col cols="4" align-self="start">{{ user.email }}</b-col>
              <b-col cols="2"></b-col>
            </b-row>
            <b-row>
              <b-col cols="2"></b-col>
              <b-col cols="2" align-self="end">주소</b-col
              ><b-col cols="4" align-self="start">{{ user.address }}</b-col>
              <b-col cols="2"></b-col>
            </b-row>
            <b-row>
              <b-col cols="2"></b-col>
              <b-col cols="2" align-self="end">가입일</b-col
              ><b-col cols="4" align-self="start">{{ user.joindate }}</b-col>
              <b-col cols="2"></b-col>
            </b-row>
          </b-container>
          <hr class="my-4" />

          <b-button variant="success" @click="memberUpdate" class="mr-1"
            >정보수정</b-button
          >
          <b-button variant="danger" @click="memberQuit">회원탈퇴</b-button>
        </b-jumbotron>
      </b-col>
      <b-col></b-col>
    </b-row>
  </b-container>
  <!-- <h2>내정보보기</h2>
    이름 : {{ user.username }}<br />
    아이디 : {{ user.userid }}<br />
    이메일 : {{ user.email }}<br />
    주소 : {{ user.address }}<br />
    가입일 : {{ user.joindate }}<br />
  </div> -->
</template>

<script>
import axios from "axios";

const SERVER_URL = process.env.VUE_APP_SERVER_URL;

export default {
  data() {
    return {
      user: null
    };
  },
  created() {
    axios
      .get(`${SERVER_URL}/user/info`)
      .then(response => {
        this.user = response.data.user;
      })
      .catch(() => {
        this.$store.dispatch("LOGOUT").then(() => this.$router.replace("/"));
      });
  },
  methods: {
    memberQuit() {
      this.$store
        .dispatch("MEMBERQUIT", this.user)
        .catch(({ message }) => (this.msg = message));
    },
    memberUpdate() {
      this.$router.push("/memberUpdate");
    }
  }
};
</script>

<style></style>
