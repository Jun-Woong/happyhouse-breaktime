<template>
  <b-container class="mt-4" v-if="user">
    <b-row>
      <b-col></b-col>
      <b-col cols="8">
        <b-jumbotron>
          <h1>회원님의 정보 수정 페이지입니다.</h1>
          <hr class="my-4" />

          <b-form>
            <b-form-group label="아이디:" label-for="userid">
              <b-form-input
                id="userid"
                v-model="user.userid"
                readonly
                placeholder="아이디 입력...."
                ref="userid"
              ></b-form-input>
            </b-form-group>
            <b-form-group label="이름:" label-for="username">
              <b-form-input
                id="username"
                v-model="user.username"
                required
                placeholder="이름 입력...."
                ref="username"
              ></b-form-input>
            </b-form-group>
            <b-form-group label="이메일:" label-for="email">
              <b-form-input
                id="email"
                v-model="user.email"
                required
                placeholder="이메일 입력...."
                ref="email"
              ></b-form-input>
            </b-form-group>
            <b-form-group label="주소:" label-for="address">
              <b-form-input
                id="address"
                v-model="user.address"
                required
                placeholder="주소 입력...."
                ref="address"
              ></b-form-input>
            </b-form-group>

            <b-button
              type="button"
              variant="success"
              class="m-1"
              @click="memberUpdate"
              >수정하기</b-button
            >
            <b-button type="button" variant="info" class="m-1" @click="goToMain"
              >메인으로</b-button
            >
          </b-form>
          <hr class="my-4" />
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
    memberUpdate() {
      this.$store
        .dispatch("MEMBERUPDATE", this.user)
        .catch(({ message }) => (this.msg = message));
    },
    goToMain() {
      this.$router.push("/");
    }
  }
};
</script>

<style></style>
