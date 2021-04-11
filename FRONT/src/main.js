import Vue from "vue";
import App from "./App.vue";
import router from "./router";
import store from "./store";
import VueGeolocation from "vue-browser-geolocation";

Vue.config.productionTip = false;

Vue.use(VueGeolocation);

import * as VueGoogleMaps from "vue2-google-maps";

Vue.use(VueGoogleMaps, {
  load: {
    key: "AIzaSyCdrPZu3dNQKgFwnBpZ9bs-uuQ87Qqbbsg"
  }
});

new Vue({
  router,
  store,
  render: h => h(App),
  created() {
    this.$store.dispatch("SETHEADER");
  }
}).$mount("#app");
