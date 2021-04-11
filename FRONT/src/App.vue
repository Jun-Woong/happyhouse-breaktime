<template>
  <div id="app">
    <Head />
    <router-view />
    <br /><br /><br />
    <Foot />
  </div>
</template>

<script>
import Vue from 'vue';
import { BootstrapVue, IconsPlugin } from 'bootstrap-vue';

Vue.use(BootstrapVue);
Vue.use(IconsPlugin);

import 'bootstrap/dist/css/bootstrap.css';
import 'bootstrap-vue/dist/bootstrap-vue.css';

// moved to Head.vue
//mapGetters 등록
// import { mapGetters } from 'vuex';
import Head from '@/views/include/Head.vue';
import Foot from '@/views/include/Foot.vue';

export default {
  data() {
    return {
      isLogin: false,
    };
  },
  components: {
    Head,
    Foot,
  },
  // moved to Head.vue
  // computed: {
  //   ...mapGetters(['getAccessToken', 'getUserId', 'getUserName']),
  // },
  // methods: {
  //   onClickLogout() {
  //     this.$store.dispatch('LOGOUT').then(() => this.$router.replace('/').catch(() => {}));
  //   },
  // },
};
</script>
<style></style>
