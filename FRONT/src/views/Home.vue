<template>
  <div class="home">
    <!--<p v-if="getAccessToken">우리의 메인페이지!</p>
    <Main msg="로그인 해 주세요" v-else />-->
    <section id="hero">
      <div id="heroCarousel" class="carousel slide carousel-fade" data-ride="carousel">
        <ol class="carousel-indicators" id="hero-carousel-indicators"></ol>

        <div class="carousel-inner" role="listbox">
          <!-- Slide 1 -->
          <div
            class="carousel-item active"
            style="background-image: url(assets/img/slide/slide-1.jpg)"
          >
            <div class="carousel-container">
              <div class="container">
                <h2 class="animate__animated animate__fadeInDown">
                  <span>쉬는 시간에 오신걸 환영합니다</span>
                </h2>
                <p class="animate__animated animate__fadeInUp">
                  저희 사이트는 당신만의 쉬는 공간을 찾는 쉬는 시간입니다. 필요하신 공간을 검색하여
                  정보를 찾으세요!!
                </p>
                <a
                  @click="gologin()"
                  class="btn-get-started animate__animated animate__fadeInUp scrollto"
                  >더 알아가기</a
                >
              </div>
            </div>
          </div>

          <!-- Slide 2 -->
          <div class="carousel-item" style="background-image: url(assets/img/slide/slide-2.jpg)">
            <div class="carousel-container">
              <div class="container">
                <h2 class="animate__animated animate__fadeInDown">
                  热한 지역의 매물
                </h2>
                <p class="animate__animated animate__fadeInUp">
                  전년 동월 대비 매매 활성도가 높은 구역을 알아 가세요!!!
                </p>
                <a
                  @click="gologin()"
                  class="btn-get-started animate__animated animate__fadeInUp scrollto"
                  >더 알아가기</a
                >
              </div>
            </div>
          </div>

          <!-- Slide 3 -->
          <div class="carousel-item" style="background-image: url(assets/img/slide/slide-3.jpg)">
            <div class="carousel-container">
              <div class="container">
                <h2 class="animate__animated animate__fadeInDown">
                  치안 지수가 높은 지역
                </h2>
                <p class="animate__animated animate__fadeInUp">
                  저희만의 치안 지수 계산법으로 지역의 치안 지수를 알아 가세요!!!
                </p>
                <a
                  @click="gologin()"
                  class="btn-get-started animate__animated animate__fadeInUp scrollto"
                  >더 알아가기</a
                >
              </div>
            </div>
          </div>
        </div>

        <a class="carousel-control-prev" href="#heroCarousel" role="button" data-slide="prev">
          <span class="carousel-control-prev-icon icofont-simple-left" aria-hidden="true"></span>
          <span class="sr-only">Previous</span>
        </a>

        <a class="carousel-control-next" href="#heroCarousel" role="button" data-slide="next">
          <span class="carousel-control-next-icon icofont-simple-right" aria-hidden="true"></span>
          <span class="sr-only">Next</span>
        </a>
      </div>
    </section>
    <!-- End Hero -->
  </div>
</template>

<script>
/*import Main from '@/components/Main.vue';*/
import { mapGetters } from 'vuex';

export default {
  name: 'Home',
  /* components: {
    Main,
  },*/
  computed: {
    ...mapGetters(['getAccessToken']),
  },
  methods: {
    gologin: function() {
      this.$router.replace('/apt');
    },
  },
};
</script>
