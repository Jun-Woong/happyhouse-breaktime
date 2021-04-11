import Vue from "vue";
import VueRouter from "vue-router";
import Home from "../views/Home.vue";
import Login from "../views/Login.vue";
import AptDeal from "../views/apt/AptDeal.vue";
import AptInfo from "../views/apt/AptInfo.vue";
import Me from "../views/Me.vue";
import Join from "../views/Join.vue";
import MemberUpdate from "../views/MemberUpdate.vue";
import store from "../store";

import ListQnA from "@/views/QnA/List.vue";
import CreateQnA from "@/views/QnA/Create.vue";
import ReadQnA from "@/views/QnA/Read.vue";
import UpdateQnA from "@/views/QnA/Update.vue";
import DeleteQnA from "@/views/QnA/Delete.vue";

import Listboard from "@/views/board/List.vue";
import Createboard from "@/views/board/Create.vue";
import Readboard from "@/views/board/Read.vue";
import Updateboard from "@/views/board/Update.vue";
import Deleteboard from "@/views/board/Delete.vue";

Vue.use(VueRouter);

// https://router.vuejs.org/kr/guide/advanced/navigation-guards.html
const requireAuth = () => (to, from, next) => {
  const nextRoute = to.path;

  console.log(store.getters.getAccessToken);
  // console.log(next);

  if (store.getters.getAccessToken) {
    return next();
  } else {
    alert("로그인 하셔야 서비스를 이용할 수 있습니다.");
    return next("/login" + nextRoute);
  }
};

const requireNonAuth = () => (to, from, next) => {
  const nextRoute = from.path;

  if (store.getters.getAccessToken) {
    return next(nextRoute);
  } else return next();
};

const routes = [
  {
    path: "/",
    name: "Home",
    component: Home
  },
  {
    path: "/login",
    name: "Login",
    component: Login,
    beforeEnter: requireNonAuth()
  },
  {
    path: "/login/:nextRoute",
    name: "LoginNextRoute",
    component: Login
  },
  {
    path: "/me",
    name: "Me",
    component: Me,
    beforeEnter: requireAuth()
  },
  {
    path: "/memberUpdate",
    name: "MemberUpdate",
    component: MemberUpdate,
    beforeEnter: requireAuth()
  },
  {
    path: "/join",
    name: "Join",
    component: Join,
    beforeEnter: requireNonAuth()
  },
  {
    path: "/apt",
    name: "AptDeal",
    component: AptDeal,
    beforeEnter: requireAuth()
  },
  {
    path: "/apt/info",
    name: "AptInfo",
    component: AptInfo,
    props: true
  },

  { path: "/board", name: "boardlist", component: Listboard },
  { path: "/board/create", name: "boardcreate", component: Createboard },
  { path: "/board/read/:no", name: "boardread", component: Readboard },
  { path: "/board/update", name: "boardupdate", component: Updateboard },
  { path: "/board/delete", name: "boarddelete", component: Deleteboard },

  { path: "/QnA", name: "QnAlist", component: ListQnA },
  { path: "/QnA/create", name: "QnAcreate", component: CreateQnA },
  { path: "/QnA/read/:no", name: "QnAread", component: ReadQnA },
  { path: "/QnA/update", name: "QnAupdate", component: UpdateQnA },
  { path: "/QnA/delete", name: "QnAdelete", component: DeleteQnA }
];

const router = new VueRouter({
  mode: "history",
  base: process.env.BASE_URL,
  routes
});

export default router;
