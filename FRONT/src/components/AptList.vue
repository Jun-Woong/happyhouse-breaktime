<template>
  <div v-if="aptlist.length">
    <apt-list-item
      v-for="(apt, index) in aptlist"
      :key="index"
      :apt="apt"
      @select-apt="selectApt"
    />
  </div>
  <div v-else>
    검색 결과 페이지 입니다.
  </div>
</template>

<script>
import AptListItem from "@/components/AptListItem.vue";

export default {
  name: "AptList",
  components: {
    AptListItem
  },
  props: {
    aptlist: Array
  },
  methods: {
    selectApt: function(apt, imageSrc) {
      this.$emit("select-apt", apt, imageSrc);
    }
  }
};
</script>

<style></style>
