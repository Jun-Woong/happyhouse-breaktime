<template>
  <div>
    <br />
    <h2 class="text-center">공지사항</h2>
    <br />
    <b-container class="bv-example-row">
      <b-col>
        <table class="table table-bordered">
          <tr>
            <th>관리자</th>
            <td>{{ item.writer }}</td>
          </tr>
          <tr>
            <th>제목</th>
            <td>{{ item.title }}</td>
          </tr>
          <tr>
            <th>날짜</th>
            <td>{{ getFormatDate(item.regtime) }}</td>
          </tr>
          <tr>
            <td colspan="2" style="text-align: left !important;">
              {{ item.content }}
            </td>
          </tr>
        </table>

        <br />
        <div class="text-center">
          <router-link to="/board" class="btn btn-info">목록</router-link>
          <router-link
            id="upd"
            :to="'/board/update?no=' + item.no"
            class="btn btn-success"
            v-if="IsAdmin(getUserId)"
            >수정</router-link
          >
          <router-link
            :to="'/board/delete?no=' + item.no"
            class="btn btn-danger"
            v-if="IsAdmin(getUserId)"
            >삭제</router-link
          >
        </div>
      </b-col>
    </b-container>
  </div>
</template>
<script>
import axios from "axios";
import moment from "moment";
import { mapGetters } from "vuex";

export default {
  data() {
    return {
      item: {}
    };
  },
  created() {
    axios
      .get(`http://localhost:9999/vue/api/board/${this.$route.params.no}`)
      .then(({ data }) => {
        this.item = data;
      });
  },
  computed: {
    ...mapGetters(["getAccessToken", "getUserId", "getUserName"])
  },

  methods: {
    IsAdmin(getUserId) {
      if (getUserId === "admin") {
        return true;
      } else {
        return false;
      }
    },
    getFormatDate(regtime) {
      return moment(new Date(regtime)).format("YYYY.MM.DD HH:mm:ss");
    }
  }
};
</script>
<style></style>
