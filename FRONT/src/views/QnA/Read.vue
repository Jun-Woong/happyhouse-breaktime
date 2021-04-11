<template>
  <div>
    <br />
    <h2 class="text-center">질문과 답변</h2>
    <br />
    <b-container class="bv-example-row">
      <b-col>
        <table class="table table-bordered">
          <tr>
            <th>글쓴이</th>
            <td>{{ item.writer }}</td>
          </tr>
          <tr>
            <th>질문</th>
            <td>{{ item.title }}</td>
          </tr>
          <tr>
            <th>날짜</th>
            <td>{{ getFormatDate(item.regtime) }}</td>
          </tr>
          <tr>
            <td colspan="2" style="text-align: left !important; color: red;" v-if="ansFlag">
              {{ item.content }}
            </td>
            <td colspan="2" style="text-align: left !important;" v-else>
              {{ item.content }}
            </td>
          </tr>
        </table>

        <br />
        <div class="text-center">
          <router-link to="/QnA" class="btn btn-info">목록</router-link>
          <router-link
            :to="'/QnA/update?no=' + item.no"
            class="btn btn-success"
            id="upd"
            v-if="IsYou(getUserId)"
            >답변</router-link
          >
          <router-link
            :to="'/QnA/delete?no=' + item.no"
            class="btn btn-danger"
            style="margin-left : 20px"
            v-if="IsA(getUserId)"
            >삭제</router-link
          >
        </div>
      </b-col>
    </b-container>
  </div>
</template>
<script>
import axios from 'axios';
import moment from 'moment';
import { mapGetters } from 'vuex';
export default {
  data() {
    return {
      item: {},
      ansFlag: false,
    };
  },
  created() {
    axios.get(`http://localhost:9999/vue/api/QnA/${this.$route.params.no}`).then(({ data }) => {
      this.item = data;
      if (data.content == '아직 답변이 작성되어 있지 않습니다!') {
        this.ansFlag = true;
      }
    });
  },
  computed: {
    ...mapGetters(['getAccessToken', 'getUserId', 'getUserName']),
  },

  methods: {
    IsMe(getUserId) {
      if (getUserId === this.item.writer || getUserId === 'admin') {
        return true;
      } else {
        return false;
      }
    },
    IsYou(getUserId) {
      if (getUserId === 'admin') {
        return true;
      } else {
        return false;
      }
    },
    IsA(getUserId) {
      if (getUserId === this.item.writer) {
        return true;
      } else {
        return false;
      }
    },
    getFormatDate(regtime) {
      return moment(new Date(regtime)).format('YYYY.MM.DD HH:mm:ss');
    },
  },
};
</script>
<style></style>
