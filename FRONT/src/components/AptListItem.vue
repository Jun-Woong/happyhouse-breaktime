<template>
  <div
    style="margin: 10px;"
    @click="selectApt"
    @mouseover="bgColorChange(true)"
    @mouseout="bgColorChange(false)"
    :class="{ 'mouse-over-bg-color': isColor }"
  >
    <img
      :src="imageSrc"
      class="img-list"
      alt=""
      style="width:50px;height:40px;"
    />
    {{ apt.아파트 }}
  </div>
</template>

<script>
//import axios from 'axios';
//import func from '../../vue-temp/vue-editor-bridge';
import GoogleImageSearch from "free-google-image-search";

export default {
  name: "AptListItem",
  data() {
    return {
      isColor: false,
      imageSrc: ""
    };
  },
  props: {
    apt: Object
  },
  methods: {
    selectApt: function() {
      this.$emit("select-apt", this.apt, this.imageSrc);
    },
    bgColorChange: function(flag) {
      this.isColor = flag;
    }
  },
  created() {
    let queryString = this.apt.아파트;
    queryString = queryString.substr(0, queryString.lastIndexOf("("));
    //console.log(this.apt.아파트);
    if (queryString.length == 0) queryString = this.apt.아파트;
    //console.log(queryString.length);
    if (queryString.length < 4) queryString += "아파트";
    else {
      if (queryString.substr(queryString.length - 3) != "아파트") {
        //console.log(queryString.substr(queryString.length - 3));
        queryString += "아파트";
      }
    }
    //console.log(queryString);
    GoogleImageSearch.searchImage(queryString).then(response => {
      console.log(response);
      this.imageSrc = response;
    });

    /*
    const instance = axios.create();

    const params = {
      query: this.apt.아파트,
      display: 1,
    };

    instance.defaults.headers.common = {};

    this.$store.dispatch('SETHEADER');
    */
  }
};
</script>

<style>
.img-list {
  width: 50px;
}
.mouse-over-bg-color {
  background-color: aquamarine;
}
</style>
