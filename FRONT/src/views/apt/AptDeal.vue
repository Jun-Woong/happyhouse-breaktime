<template>
  <b-container class="bv-example-row">
    <b-row>
      <b-col>
        <br />
        <h2>아파트 매매 정보</h2>
        <br />
      </b-col>
    </b-row>
    <search-bar @send-dong-code="sendDongCode" @clear-apt-detail="clearAptDetail" />
    <b-row>
      <b-col cols="5" align="left">
        <apt-list :aptlist="apts" @select-apt="selectApt" />
      </b-col>
      <b-col cols="7">
        <apt-detail :apt="selectedApt" :detailImageSrc="imageSrc" :dongCode="dongCode" />
      </b-col>
    </b-row>
  </b-container>
</template>

<script>
import axios from 'axios';
import SearchBar from '@/components/SearchBar.vue';
import AptList from '@/components/AptList.vue';
import AptDetail from '@/components/AptDetail.vue';

// vue cli enviroment variables 검색
// 반드시 VUE_APP으로 시작해야 한다.
const API_KEY = process.env.VUE_APP_APT_DEAL_API_KEY;
const API_URL =
  'http://openapi.molit.go.kr/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcAptTradeDev';

// const API_KEY = '%2B0yooJVCh1SfapkwrLLW%2Fk2n02cnkOohJHqvAaf4VGz7q4H%2BYwCqDnYwUpkh1yH2rAkFz2UltIweHbrP1DOyBw%3D%3D';
// const API_URL =
//  'http://openapi.molit.go.kr/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcAptTradeDev?LAWD_CD='+dongCode+'&DEAL_YMD=202011&serviceKey='+API_KEY;

export default {
  name: 'Apt',
  components: {
    SearchBar,
    AptList,
    AptDetail,
  },
  data() {
    return {
      dongCode: '',
      selectedApt: '',
      imageSrc: '',
      apts: [],
      vars: null,
    };
  },

  methods: {
    sendDongCode: function(vars) {
      this.vars = vars;
      console.log(vars);
      axios.get(`http://localhost:9999/vue/api/apt/${vars.dongCode}`).then(({ data }) => {
        this.dongCode = data.toString();

        const params = {
          LAWD_CD: this.dongCode,
          DEAL_YMD: '202011',
          serviceKey: decodeURIComponent(API_KEY),
        };

        const headers = {
          Accept: 'application/json',
        };

        const instance = axios.create();

        instance.defaults.headers.common = {};

        instance
          .get(API_URL, { params, headers })
          .then((response) => {
            console.log('response');
            console.log(response);
            let apts = response.data.response.body.items.item;
            this.trimResults(apts);
          })
          .catch((error) => {
            console.log(error);
          });
        this.$store.dispatch('SETHEADER');
      });
    },
    selectApt: function(apt, imgSrc) {
      this.selectedApt = apt;
      this.imageSrc = imgSrc;
    },
    clearAptDetail() {
      this.selectedApt = null;
    },
    toInfo: function(apt) {
      this.$router.push({ name: '/apt/info', params: { apt: apt } });
    },
    trimResults(apts) {
      if (this.vars.maxPrice == null && this.vars.minPrice != null) {
        console.log(1);
        for (let i = 0; i < apts.length; i++) {
          const element = apts[i];
          if (
            parseInt(element.거래금액.replace(/,/g, '')) * 10000 <
            parseInt(this.vars.minPrice.replace(/,/g, ''))
          ) {
            apts.splice(i, 1);
            i--;
          }
        }
        this.apts = apts;
      } // case 2: no min price
      else if (this.vars.maxPrice != null && !this.vars.minPrice == null) {
        console.log(2);
        for (let i = 0; i < apts.length; i++) {
          const element = apts[i];
          if (
            parseInt(element.거래금액.replace(/,/g, '')) * 10000 >
            parseInt(this.vars.maxPrice.replace(/,/g, ''))
          ) {
            apts.splice(i, 1);
            i--;
          }
        }
        this.apts = apts;
      } else if (this.vars.maxPrice != null && this.vars.minPrice != null) {
        console.log(3);
        for (let i = 0; i < apts.length; i++) {
          const element = apts[i];
          if (
            parseInt(element.거래금액.replace(/,/g, '')) * 10000 <
              parseInt(this.vars.minPrice.replace(/,/g, '')) ||
            parseInt(element.거래금액.replace(/,/g, '')) * 10000 >
              parseInt(this.vars.maxPrice.replace(/,/g, ''))
          ) {
            apts.splice(i, 1);
            i--;
          }
        }
        this.apts = apts;
      } else {
        this.apts = apts;
      }
      if (this.apts.length == 0) alert('검색 결과가 없습니다, 다시 검색해 주세요!');
    },
  },
};
</script>
