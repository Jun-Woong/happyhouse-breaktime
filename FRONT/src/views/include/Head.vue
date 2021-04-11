<template>
  <div>
    <header id="header" style="padding:0px;">
      <b-navbar toggleable="lg">
        <b-navbar-brand
          ><router-link to="/"
            ><img
              src="@/assets/nav_log.png"
              class="d-inline-block align-middle"
              alt="LOGO"
              style="width:25%"
            />
            <span
              class="logo mr-auto"
              style="display:inline-block; vertical-align:middle;"
              >쉬는 시간</span
            ></router-link
          ></b-navbar-brand
        >
        <!-- <b-navbar-brand href="/">SSAFY</b-navbar-brand> -->

        <b-navbar-toggle target="nav-collapse"></b-navbar-toggle>

        <b-collapse id="nav-collapse" is-nav>
          <b-navbar-nav class="ml-auto" v-if="getAccessToken">
            <b-nav-item
              ><router-link to="/me"
                ><b-avatar
                  variant="primary"
                  v-text="getUserId.charAt(0).toUpperCase()"
                ></b-avatar>
                {{ getUserId }}</router-link
              ></b-nav-item
            >
            <b-nav-item @click.prevent="onClickLogout">로그아웃</b-nav-item>
            <b-nav-item
              ><router-link to="/board">공지사항</router-link></b-nav-item
            >
            <b-nav-item
              ><router-link to="/QnA">질문과 답변</router-link></b-nav-item
            >
            <b-nav-item
              ><router-link to="/apt">아파트정보</router-link></b-nav-item
            >
            <!-- <b-nav-item href="/me">내정보보기</b-nav-item>
            <b-nav-item href="/logout">로그아웃</b-nav-item> -->
          </b-navbar-nav>
          <b-navbar-nav class="ml-auto" v-else>
            <b-nav-item>
              <router-link to="/login">로그인</router-link></b-nav-item
            >
            <b-nav-item
              ><router-link to="/join">회원가입</router-link></b-nav-item
            >
            <!-- <b-nav-item href="/login">로그인</b-nav-item>
            <b-nav-item href="/join">회원가입</b-nav-item> -->
          </b-navbar-nav>
        </b-collapse>
      </b-navbar>
      <hr style="margin:0" />
    </header>
  </div>
</template>

<script>
import { mapGetters } from "vuex";
export default {
  name: "Head",
  computed: {
    ...mapGetters(["getAccessToken", "getUserId", "getUserName"])
  },
  methods: {
    onClickLogout() {
      this.$store
        .dispatch("LOGOUT")
        .then(() => this.$router.replace("/").catch(() => {}));
    }
  }
};
</script>
