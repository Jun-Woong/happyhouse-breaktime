<template>
  <div>
    <!-- 템플릿에 ROOT엘리먼트가 필요 -->
    <br />
    <h2 class="text-center">공지사항</h2>
    <br />
    <b-container class="bv-example-row">
      <b-col>
        <div v-if="items.length">
          <table class="table table-bordered table-condensed">
            <colgroup>
              <col width="10%" />
              <col width="50%" />
              <col width="15%" />
              <col width="25%" />
            </colgroup>
            <tr>
              <th style="display : none">번호</th>
              <th>관리자</th>
              <th>제목</th>
              <th>날짜</th>
            </tr>
            <tr v-for="(board, index) in items" :key="index + '_items'">
              <td style="display : none">{{ board.no }}</td>
              <td>{{ board.writer }}</td>
              <td>
                <router-link :to="'/board/read/' + board.no">{{
                  board.title
                }}</router-link>
              </td>
              <td>{{ getFormatDate(board.regtime) }}</td>
            </tr>
          </table>
        </div>
        <div v-else class="text-center">
          게시글이 없습니다.
        </div>
        <div class="text-right">
          <button
            class="btn btn-success"
            @click="movePage"
            v-if="IsAdmin(getUserId)"
          >
            등록
          </button>
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
      items: []
    };
  },

  created() {
    axios.get(`http://localhost:9999/vue/api/board`).then(({ data }) => {
      this.items = data;
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
      return moment(new Date(regtime)).format("YYYY.MM.DD");
    },
    movePage() {
      this.$router.push("/board/create");
    }
  }
};
</script>
<style></style>
