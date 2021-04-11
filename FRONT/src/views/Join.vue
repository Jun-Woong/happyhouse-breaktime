<template>
  <b-container class="bv-example-row">
    <b-row>
      <b-col></b-col>
      <b-col cols="8">
        <b-card
          class="mt-3"
          header="회원가입"
          style="max-width: 40rem;"
          align="left"
        >
          <b-form>
            <b-form-group label="아이디:" label-for="userid">
              <b-form-input
                id="userid"
                v-model="user.userid"
                required
                placeholder="아이디 입력해주세요."
                ref="userid"
              ></b-form-input>
            </b-form-group>
            <b-form-group label="이름:" label-for="username">
              <b-form-input
                id="username"
                v-model="user.username"
                required
                placeholder="이름 입력해주세요."
                ref="username"
              ></b-form-input>
            </b-form-group>
            <b-form-group label="이메일:" label-for="email">
              <b-form-input
                id="email"
                v-model="user.email"
                required
                placeholder="이메일 입력해주세요."
                ref="email"
              ></b-form-input>
            </b-form-group>
            <b-form-group label="주소:" label-for="address">
              <b-form-input
                id="address"
                v-model="user.address"
                required
                placeholder="주소 입력해주세요."
                ref="address"
              ></b-form-input>
            </b-form-group>
            <b-form-group label="비밀번호:" label-for="userpwd">
              <b-form-input
                type="password"
                id="userpwd"
                v-model="user.userpwd"
                required
                placeholder="비밀번호 입력해주세요."
                ref="userpwd"
              ></b-form-input>
            </b-form-group>
            <b-form-group label="비밀번호 확인:" label-for="userpwdconfirm">
              <b-form-input
                type="password"
                id="userpwdconfirm"
                v-model="user.userpwdconfirm"
                required
                placeholder="비밀번호 확인해주세요."
                ref="userpwdconfirm"
              ></b-form-input>
            </b-form-group>
            <b-button
              class="m-1"
              type="button"
              variant="outline-success"
              @click="joinChecker"
              >회원가입</b-button
            >
          </b-form>
        </b-card>
      </b-col>
      <b-col></b-col>
    </b-row>
  </b-container>
</template>

<script>
import Vue from "vue";
import VueRouter from "vue-router";

Vue.use(VueRouter);

export default {
  name: "Join",
  data: function() {
    return {
      user: {
        userid: "",
        userpwd: "",
        username: "",
        email: "",
        userpwdconfirm: "",
        address: ""
      },
      message: ""
    };
  },
  methods: {
    joinChecker: function() {
      let err = true;
      let msg = "";
      !this.user.userid &&
        ((msg = "아이디를 입력해주세요"),
        (err = false),
        this.$refs.userid.focus());
      err &&
        !this.user.username &&
        ((msg = "이름을 입력해주세요"),
        (err = false),
        this.$refs.username.focus());
      err &&
        !this.user.email &&
        ((msg = "이메일을 입력해주세요"),
        (err = false),
        this.$refs.email.focus());
      err &&
        !this.user.address &&
        ((msg = "주소를 입력해주세요"),
        (err = false),
        this.$refs.address.focus());
      err &&
        !this.user.userpwd &&
        ((msg = "비밀번호를 입력해주세요"),
        (err = false),
        this.$refs.userpwd.focus());
      err &&
        !this.user.userpwdconfirm &&
        ((msg = "비밀번호 확인란을 입력해주세요"),
        (err = false),
        this.$refs.userpwdconfirm.focus());
      if (!err) alert(msg);
      else this.pwdConfirmer();
    },
    pwdConfirmer: function() {
      if (this.user.userpwd == this.user.userpwdconfirm) {
        this.$store
          .dispatch("JOIN", this.user)
          .catch(({ message }) => (this.msg = message));
      } else alert("비밀번호와 비밀번호 확인란이 다릅니다.");
    }
  }
};
</script>
