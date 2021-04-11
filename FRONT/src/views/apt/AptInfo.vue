<template>
  <div v-if="apt">
    <br />
    <b-container>
      <b-row>
        <b-col style="vertical-align:middle; display:inline-block">
          <h3>{{ apt.아파트 }}</h3>
          <img :src="imageSrc" style="width:450px; height:300px;" />
          <ul align="left">
            <li>일련번호 : {{ apt.일련번호 }}</li>
            <li>아파트 이름 : {{ apt.아파트 }}</li>
            <li>법정동 : {{ apt.법정동 }}</li>
            <li>층수 : {{ apt.층 }}</li>
            <li>거래금액 : {{ (apt.거래금액.replace(',', '') * 10000) | price }}원</li>
          </ul>
        </b-col>
        <b-col v-if="result">
          <b-container class="bv-example-row" style="display:inline-block;vertical-align:middle;">
            <b-col>
              <br />
              <h2>{{ apt.법정동 }}의 날씨</h2>
              <table class="table table-bordered table-condensed">
                <!-- <tr v-for="(elem, index) in result" :key="index"> -->
                <tr>
                  <td colspan="2">
                    <div v-if="sunny">
                      <img
                        class="weather"
                        src="http://ssl.gstatic.com/onebox/weather/64/sunny.png"
                      />
                    </div>
                    <div v-if="partlycloudy">
                      <img
                        class="weather"
                        src="http://ssl.gstatic.com/onebox/weather/64/partly_cloudy.png"
                      />
                    </div>
                    <div v-if="cloudy">
                      <img
                        class="weather"
                        src="http://ssl.gstatic.com/onebox/weather/64/cloudy.png"
                      />
                    </div>
                    <div>
                      {{ result[3][1] }}
                    </div>
                    <br />
                    <h3>{{ result[4][1] }}</h3>
                  </td>
                </tr>
                <tr>
                  <td>{{ result[0][0] }}</td>
                  <td>{{ result[0][1] }}</td>
                </tr>
                <tr>
                  <td>{{ result[1][0] }}</td>
                  <td>{{ result[1][1] }}</td>
                </tr>
                <tr>
                  <td>{{ result[2][0] }}</td>
                  <td>{{ result[2][1] }}</td>
                </tr>
              </table>
            </b-col>
          </b-container>
        </b-col>
        <div v-else style="vertical-align:middle">
          날씨를 가져오는 중입니다.
        </div>
      </b-row>

      <b-row>
        <b-col>
          <div id="map" style="width:100%; height:500px; margin:auto;"></div>
        </b-col>
        <b-col>
          <div id="roadview" style="width:100%; height:500px; margin:auto;"></div>
        </b-col>
      </b-row>

      <br />
      <br />

      <h3>인근 아파트 매매 관련 정보입니다</h3>
      <br />
      <b-row>
        <b-col>
          <h4>지난 5년간 동월 매매건수</h4>
          <line-chart
            :dataValues="lastFiveYearDeals"
            :dataLabels="['201611', '201711', '201811', '201911', '202011']"
          ></line-chart>
        </b-col>
        <b-col>
          <h4>지난 5개월 간 매매건수</h4>
          <line-chart-second
            :dataValues="lastFiveMonthDeals"
            :dataLabels="['202007', '202008', '202009', '202010', '202011']"
          ></line-chart-second>
        </b-col>
        <b-col>
          <h4>치안등급</h4>
          <div style="line-height:350px; font-size:200px; color:#5cb874; letter-spacing: -20px;">
            {{ safetyDegree }}
          </div>
          <p>5대 범죄발생건수, CCTV 갯수, 치안센터 갯수를 통해 산정한 치안 등급입니다.</p>
        </b-col>
      </b-row>
    </b-container>
  </div>
</template>

<script>
import axios from 'axios';
import moment from 'moment';
import LineChart from '@/components/AptDealL5Y';
import LineChartSecond from '@/components/AptDealL5Y';

const API_KEY = process.env.VUE_APP_APT_DEAL_API_KEY;
const API_URL =
  'http://openapi.molit.go.kr/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcAptTradeDev';

export default {
  props: ['apt', 'imageSrc', 'dongCode'],
  components: {
    LineChart,
    LineChartSecond,
  },
  data() {
    return {
      map: null,
      roadMap: null,
      multi: {
        lat: 0,
        lng: 0,
      },
      road: {
        lat: 0,
        lng: 0,
      },
      weatherInfo: null,
      aptObj: null,
      result: null,
      lastFiveMonthDeals: [0, 0, 0, 0, 0],
      lastFiveYearDeals: [0, 0, 0, 0, 0],
      safetyDegree: '',
      sunny: false,
      partlycloudy: false,
      cloudy: false,
    };
  },
  created() {
    this.aptObj = this.apt;
    this.lastFiveMonths();
    this.lastFiveYears();
    //console.log('created');
    //console.log(this.aptObj);
    axios.get(`http://localhost:9999/vue/api/apt/degree/${this.dongCode}`).then(({ data }) => {
      console.log('get');
      console.log(data);
      this.safetyDegree = data;
    });
  },
  mounted() {
    this.geocode(this.apt);
  },
  computed: {
    mapCoord() {
      if (!this.map) {
        return {
          lat: 0,
          lng: 0,
        };
      }
      return {
        lat: this.map
          .getCenter()
          .lat()
          .toFixed(4),
        lng: this.map
          .getCenter()
          .lng()
          .toFixed(4),
      };
    },
  },
  methods: {
    geocode(apt) {
      const instance = axios.create();

      instance.defaults.headers.common = {};

      instance
        .get('https://maps.googleapis.com/maps/api/geocode/json', {
          params: {
            key: 'AIzaSyCdrPZu3dNQKgFwnBpZ9bs-uuQ87Qqbbsg',
            address: apt.법정동 + '+' + apt.아파트 + '+' + apt.지번,
          },
        })
        .then((response) => {
          //console.log(response);
          this.aptObj = apt;
          //console.log('geocode');
          //console.log(this.aptObj);
          this.multi.lat = response.data.results[0].geometry.location.lat;
          this.multi.lng = response.data.results[0].geometry.location.lng;
          this.getWeatherInfo();
          this.makeRoadViewAndMap();
        });
      this.$store.dispatch('SETHEADER');
    },
    getWeatherInfo() {
      const instance = axios.create();

      instance.defaults.headers.common = {};

      let d = new Date();

      //console.log(this.multi);

      let bases = this.getBase(moment(d));

      instance
        .get('http://apis.data.go.kr/1360000/VilageFcstInfoService/getVilageFcst', {
          params: {
            serviceKey: decodeURIComponent(
              'a3HnVznQOSNj%2BKFliKkSY3e%2FfsGTHbWDLlx3bWkb9qmCOtDjppQRi%2F0bUu2hc6myGa%2BSq%2BpdS92fTPNanxmwSw%3D%3D'
            ),
            numOfRows: 20,
            pageNo: 1,
            base_date: bases[0],
            base_time: bases[1],
            nx: this.multi.lat.toFixed(0),
            ny: this.multi.lng.toFixed(0),
          },
        })
        .then((response) => {
          //console.log(response.data);
          console.log(moment(d).format('YYYYMMDD'));
          const parser = require('xml-js');
          // console.log(parser);
          this.weatherInfo = JSON.parse(parser.xml2json(response.data, { compact: true }));
          console.log(this.weatherInfo);
          this.weatherConverter();
        });
      this.$store.dispatch('SETHEADER');
    },
    weatherConverter() {
      const translater = {
        POP: '강수확률',
        PTY: '강수형태',
        REH: '습도',
        SKY: '하늘상태',
        TMN: '아침 최저기온',
        TMX: '낮 최고기온',
        T3H: '3시간 기온',
        RN1: '1시간 강수량',
        T1H: '기온',
      };

      this.result = [];

      const fcstTime = this.weatherInfo.response.body.items.item[0].fcstTime._text;
      console.log('fcstTime: ' + fcstTime);
      const items = this.weatherInfo['response'].body['items']['item'];
      items.forEach((element) => {
        //console.log(element['category']._text + element.fcstTime._text);
        if (element['category']._text in translater && element.fcstTime._text == fcstTime) {
          const converted = translater[element['category']._text];
          this.result.push([converted, element['fcstValue']._text]);
        }
      });

      this.result.forEach((element) => {
        if (element[0] == '강수확률') element[1] += '%';
        else if (element[0] == '강수형태') element[1] += 'mm';
        else if (element[0] == '습도') element[1] += '%';
        else if (element[0] == '3시간 기온') element[1] += '°C';
        else if (element[0] == '하늘상태') {
          if (element[1] == 1) {
            element[1] = '맑음';
            this.sunny = true;
          } else if (element[1] == 3) {
            element[1] = '구름많음';
            this.cloudy = true;
          } else if (element[1] == 4) {
            element[1] = '흐림';
            this.partlycloudy = true;
          }
        }
      });
    },
    getBase(dd) {
      let year = Number(dd.format('YYYY'));
      let month = Number(dd.format('MM'));
      let day = Number(dd.format('DD'));
      let hour = Number(dd.format('HH'));
      let mins = Number(dd.format('mm'));
      let hours = [2, 5, 8, 11, 14, 17, 20, 23];

      console.log('hour is', hour);

      for (let i = 0; i < hours.length - 1; i++) {
        const b = hours[i];
        const a = hours[i + 1];
        if (b <= hour && hour <= a) {
          if (mins < 10 && b == a) {
            hour = b - 3;
          } else hour = b;
          mins = 0;
          if (hour < 0) {
            hour = 23;
            day -= 1;
          }
          break;
        }
      }

      let hourString = '';
      let minsString = '';

      if (hour < 10) {
        if (mins < 10) {
          hourString = '0' + String(hour);
          minsString = '00';
        } else {
          hourString = String(hour);
          minsString = String(mins);
        }
      } else {
        if (mins < 10) {
          hourString = String(hour);
          minsString = '00';
        } else {
          hourString = String(hour);
          minsString = String(mins);
        }
      }
      let monthString = '';
      if (month < 10) monthString = '0' + String(month);
      else monthString = String(month);

      let dayString = '';
      if (day < 10) dayString = '0' + String(day);
      else dayString = String(day);
      console.log(year, month, day);
      console.log(hourString + minsString);
      return [String(year) + monthString + dayString, hourString + minsString];
    },
    makeRoadViewAndMap() {
      //console.log('여기!');
      var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        pos = new window.kakao.maps.LatLng(this.multi.lat, this.multi.lng), // 지도의 중심 좌표
        mapOption = {
          center: pos, // 지도의 중심 좌표
          level: 4, // 지도의 확대 레벨
        };

      // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
      var map = new window.kakao.maps.Map(mapContainer, mapOption);

      // 지도에 올릴 마커를 생성합니다.
      var mMarker = new window.kakao.maps.Marker({
        position: pos, // 지도의 중심좌표에 올립니다.
        map: map, // 생성하면서 지도에 올립니다.
      });

      mMarker.setMap(map); // 지도에 올리면서, 두번째 인자로 들어간 마커 위에 올라가도록 설정합니다.

      var roadviewContainer = document.getElementById('roadview'); //로드뷰를 표시할 div
      var roadview = new window.kakao.maps.Roadview(roadviewContainer); //로드뷰 객체
      var roadviewClient = new window.kakao.maps.RoadviewClient(); //좌표로부터 로드뷰 파노ID를 가져올 로드뷰 helper객체
      var rvResetValue = {};

      //console.log('this');
      //console.log(this.multi);

      // 특정 위치의 좌표와 가까운 로드뷰의 panoId를 추출하여 로드뷰를 띄운다.
      roadviewClient.getNearestPanoId(pos, 100, function(panoId) {
        roadview.setPanoId(panoId, pos); //panoId와 중심좌표를 통해 로드뷰 실행
      });

      var tmpApt = this.aptObj;

      window.kakao.maps.event.addListener(roadview, 'init', function() {
        var rMarker = new window.kakao.maps.Marker({
          position: pos,
          map: roadview,
        });

        console.log(tmpApt);

        // 로드뷰에 올릴 장소명 인포윈도우를 생성합니다.
        var rLabel = new window.kakao.maps.InfoWindow({
          position: pos,
          content: tmpApt.아파트,
        });
        rLabel.open(roadview, rMarker);

        // 로드뷰 마커가 중앙에 오도록 로드뷰의 viewpoint 조정 합니다.
        var projection = roadview.getProjection(); // viewpoint(화면좌표)값을 추출할 수 있는 projection 객체를 가져옵니다.

        // 마커의 position과 altitude값을 통해 viewpoint값(화면좌표)를 추출합니다.
        var viewpoint = projection.viewpointFromCoords(
          rMarker.getPosition(),
          rMarker.getAltitude()
        );
        roadview.setViewpoint(viewpoint); //로드뷰에 뷰포인트를 설정합니다.

        //각 뷰포인트 값을 초기화를 위해 저장해 놓습니다.
        rvResetValue.pan = viewpoint.pan;
        rvResetValue.tilt = viewpoint.tilt;
        rvResetValue.zoom = viewpoint.zoom;
      });

      //로드뷰 이동 이벤트 핸들러
      /*
      function moveKakaoRoadview(self) {
        var panoId = roadview.getPanoId(); //현 로드뷰의 panoId값을 가져옵니다.
        var viewpoint = roadview.getViewpoint(); //현 로드뷰의 viewpoint(pan,tilt,zoom)값을 가져옵니다.
        self.href =
          'https://map.kakao.com/?panoid=' +
          panoId +
          '&pan=' +
          viewpoint.pan +
          '&tilt=' +
          viewpoint.tilt +
          '&zoom=' +
          viewpoint.zoom; //Kakao 지도 로드뷰로 보내는 링크
      }
      */

      //로드뷰 초기화 이벤트 핸들러
      /*
      function resetRoadview() {
        //초기화를 위해 저장해둔 변수를 통해 로드뷰를 초기상태로 돌립니다.
        roadview.setViewpoint({
          pan: rvResetValue.pan,
          tilt: rvResetValue.tilt,
          zoom: rvResetValue.zoom,
        });
        roadview.setPanoId(rvResetValue.panoId);
      }
      */
    },
    lastFiveMonths() {
      const YMDs = ['202007', '202008', '202009', '202010', '202011'];
      for (let i = 0; i < YMDs.length; i++) {
        const currYMD = YMDs[i];
        const params = {
          LAWD_CD: this.dongCode,
          DEAL_YMD: currYMD,
          serviceKey: decodeURIComponent(API_KEY),
          numOfRows: 9999,
        };

        const headers = {
          Accept: 'application/json',
        };

        const instance = axios.create();

        instance.defaults.headers.common = {};

        instance
          .get(API_URL, { params, headers })
          .then((response) => {
            console.log(params.DEAL_YMD);
            console.log(response);
            this.lastFiveMonthDeals[i] = response.data.response.body.items.item.length;
          })
          .catch((error) => {
            console.log(error);
          });
        this.$store.dispatch('SETHEADER');
      }
    },
    lastFiveYears() {
      const YMDs = ['201611', '201711', '201811', '201911', '202011'];
      for (let i = 0; i < YMDs.length; i++) {
        const currYMD = YMDs[i];
        const params = {
          LAWD_CD: this.dongCode,
          DEAL_YMD: currYMD,
          serviceKey: decodeURIComponent(API_KEY),
          numOfRows: 9999,
        };

        const headers = {
          Accept: 'application/json',
        };

        const instance = axios.create();

        instance.defaults.headers.common = {};

        instance
          .get(API_URL, { params, headers })
          .then((response) => {
            console.log(params.DEAL_YMD);
            console.log(response);
            this.lastFiveYearDeals[i] = response.data.response.body.items.item.length;
          })
          .catch((error) => {
            console.log(error);
          });
        this.$store.dispatch('SETHEADER');
      }
    },
  },
  filters: {
    price: function(value) {
      if (!value) return value;
      return value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
    },
  },
};
</script>
