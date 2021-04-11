<template>
  <div v-if="apt">
    <h3>{{ apt.아파트 }}</h3>
    <img :src="detailImageSrc" style="width:450px; height:300px;" />
    <div style="margin: 10px"></div>
    <ul align="left">
      <li>일련번호 : {{ apt.일련번호 }}</li>
      <li>아파트 이름 : {{ apt.아파트 }}</li>
      <li>법정동 : {{ apt.법정동 }}</li>
      <li>층수 : {{ apt.층 }}</li>
      <li>
        거래금액 : {{ (apt.거래금액.replace(",", "") * 10000) | price }}원
      </li>
    </ul>
    <b-button variant="outline-success" @click="goToInfo" class="mr-1"
      >상세 정보</b-button
    >
  </div>
</template>

<script>
export default {
  name: "AptDetail",
  props: {
    apt: [Object, String],
    detailImageSrc: String,
    dongCode: String
  },
  filters: {
    price: function(value) {
      if (!value) return value;
      return value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    }
  },
  methods: {
    goToInfo() {
      this.$router.push({
        name: "AptInfo",
        params: {
          apt: this.apt,
          imageSrc: this.detailImageSrc,
          dongCode: this.dongCode
        }
      });
    }
  }
};
</script>

<style></style>
