<script>
import { Line } from 'vue-chartjs';

export default {
  extends: Line,
  props: {
    dataLabels: Object,
    dataValues: Object,
  },
  watch: {
    dataLabels: function() {
      this.datacollection.labels = this.dataLabels;
      console.log('labels changed');
      this.renderChart(this.datacollection, this.options);
    },
    dataValues: function() {
      this.datacollection.datasets[0].data = this.dataValues;
      console.log('values changed');
      this.renderChart(this.datacollection, this.options);
    },
  },
  data() {
    return {
      datacollection: {
        labels: this.dataLabels,
        datasets: [
          {
            label: '매매건수',
            backgroundColor: '#5cb874',
            pointBackgroundColor: 'white',
            borderWidth: 1,
            pointBorderColor: '#249EBF',
            data: this.dataValues,
          },
        ],
      },
      options: {
        scales: {
          yAxes: [
            {
              ticks: {
                beginAtZero: true,
              },
              gridLines: {
                display: true,
              },
            },
          ],
          xAxes: [
            {
              gridLines: {
                display: false,
              },
            },
          ],
        },
        legend: {
          display: true,
        },
        responsive: true,
        maintainAspectRatio: false,
      },
    };
  },
  mounted() {
    this.datacollection.datasets[0].data = this.dataValues;
    this.datacollection.labels = this.dataLabels;
    console.log(this.datacollection.datasets[0].data);
    console.log(this.datacollection.labels);
    this.renderChart(this.datacollection, this.options);
  },
};
</script>
