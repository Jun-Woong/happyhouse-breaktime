<template>
  <b-row>
    <b-col align="left">
      <table class="table">
        <tr>
          <td>구군 검색</td>
          <td>
            <input
              id="gugun"
              type="text"
              v-model="vars.dongCode"
              @keypress.enter="sendVars"
            />
          </td>
          <td>최소 금액</td>
          <td>
            <input
              id="minPrice"
              type="text"
              v-model="vars.minPrice"
              @keyup="priceFormatter"
            />원
          </td>
          <td>최대 금액</td>
          <td>
            <input
              id="maxPrice"
              type="text"
              v-model="vars.maxPrice"
              @keyup="priceFormatter"
              @keypress.enter="sendVars"
            />원
          </td>
          <td>
            <b-button variant="outline-success" @click="sendVars">
              검색
            </b-button>
          </td>
        </tr>
      </table>
    </b-col>
  </b-row>
</template>

<script>
export default {
  name: "SearchBar",
  data() {
    return {
      vars: {
        dongCode: "",
        minPrice: null,
        maxPrice: null
      }
    };
  },
  methods: {
    sendVars: function() {
      if (!this.vars.dongCode) {
        alert("구군 필드를 입력해 주세요");
        return;
      }
      this.vars.dongCode.trim();
      if (this.vars.minPrice != null && this.vars.minPrice.trim() == "")
        this.vars.minPrice = null;
      if (this.vars.maxPrice != null && this.vars.maxPrice.trim() == "")
        this.vars.maxPrice = null;

      if (this.vars.minPrice != null)
        this.vars.minPrice = parseInt(this.vars.minPrice.replace(/,/g, ""));
      if (this.vars.maxPrice != null)
        this.vars.maxPrice = parseInt(this.vars.maxPrice.replace(/,/g, ""));

      if (this.vars.minPrice == null || this.vars.maxPrice == null) {
        this.$emit("send-dong-code", this.vars);
        if (this.vars.minPrice != null)
          this.vars.minPrice = this.vars.minPrice.toString();
        if (this.vars.maxPrice != null)
          this.vars.maxPrice = this.vars.maxPrice.toString();
        this.priceFormatter();
      } else if (this.vars.minPrice > this.vars.maxPrice) {
        alert("최대금액이 최소금액보다 작습니다! 금액을 다시 입력해 주세요!");
        this.vars.minPrice = this.vars.minPrice.toString();
        this.vars.maxPrice = this.vars.maxPrice.toString();
        this.priceFormatter();
      } else {
        this.$emit("send-dong-code", this.vars);
        this.vars.minPrice = this.vars.minPrice.toString();
        this.vars.maxPrice = this.vars.maxPrice.toString();
        this.priceFormatter();
      }
    },
    priceFormatter: function() {
      if (this.vars.minPrice != null) {
        this.vars.minPrice = this.vars.minPrice.replace(/[^0-9]/g, "");
        this.vars.minPrice = this.vars.minPrice.replace(/,/g, "");
        this.vars.minPrice = this.vars.minPrice.replace(
          /\B(?=(\d{3})+(?!\d))/g,
          ","
        );
      }
      if (this.vars.maxPrice != null) {
        this.vars.maxPrice = this.vars.maxPrice.replace(/[^0-9]/g, "");
        this.vars.maxPrice = this.vars.maxPrice.replace(/,/g, "");
        this.vars.maxPrice = this.vars.maxPrice.replace(
          /\B(?=(\d{3})+(?!\d))/g,
          ","
        );
      }
    }
  }
};
</script>

<style></style>
