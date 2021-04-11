import Vue from "vue";
import Vuex from "vuex";
import axios from "axios";
import VuexPersistense from "vuex-persist";
import router from "../router";

Vue.use(Vuex);

const SERVER_URL = process.env.VUE_APP_SERVER_URL;

export default new Vuex.Store({
  state: {
    accessToken: null,
    userId: "",
    userName: ""
  },
  getters: {
    getAccessToken(state) {
      return state.accessToken;
    },
    getUserId(state) {
      return state.userId;
    },
    getUserName(state) {
      return state.userName;
    }
  },
  mutations: {
    LOGIN(state, payload) {
      state.accessToken = payload["auth-token"];
      state.userId = payload["user-id"];
      state.userName = payload["user-name"];
    },
    LOGOUT(state) {
      state.accessToken = null;
      state.userId = "";
      state.userName = "";
    },
    JOIN() {}
  },
  actions: {
    LOGIN(context, user) {
      return axios
        .post(`${SERVER_URL}/user/confirm/login`, user)
        .then(response => {
          context.commit("LOGIN", response.data);
          alert(response.data["message"]);

          if (response.data["auth-token"]) {
            axios.defaults.headers.common[
              "auth-token"
            ] = `${response.data["auth-token"]}`;
          } else {
            router.push("/login");
          }
          //alert(`${response.data["auth-token"]}`);
        });
    },
    LOGOUT(context) {
      context.commit("LOGOUT");
      axios.defaults.headers.common["auth-token"] = undefined;
    },
    SETHEADER({ getters }) {
      axios.defaults.headers.common["auth-token"] = getters.getAccessToken;
    },
    JOIN(context, user) {
      console.log(user);
      return axios.post(`${SERVER_URL}/user/confirm/join`, user).then(response => {
        alert(response.data["message"]);
        context.commit("JOIN");
        router.push({ path: "/login" });
      });
    },
    MEMBERQUIT(context, user) {
      alert(user);
      console.log(user);
      return axios
        .post(`${SERVER_URL}/user/quit`, user)
        .then(response => {
          alert(response.data["message"]);
          context.commit("LOGOUT");
          router.push({ path: "/" });
        })
        .catch(response => {
          alert(response.data["message"]);
        });
    },
    MEMBERUPDATE(context, user) {
      console.log(user);
      return axios
        .put(`${SERVER_URL}/user/update`, user)
        .then(response => {
          alert(response.data["message"]);
          axios.defaults.headers.common[
            "auth-token"
          ] = `${response.data["auth-token"]}`;
          router.push({ path: "/me" });
        })
        .catch(response => {
          alert(response.data["message"]);
        });
    }
  },
  modules: {},
  plugins: [new VuexPersistense().plugin]
});
