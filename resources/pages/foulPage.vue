<template>
<div>
     <div class="full">
         <GChart
        type="AreaChart"
        :data="chartData"
        :options="chartOptions"
        class="full"
    />
     </div>

      <!-- <div>
        <div>
        <strong>Screen Size:</strong>
        </div>
        <div v-if="$resize && $mq.above(992)">Desktop</div>
        <div v-else>Tablet and Below</div>
    </div> -->
</div>
  
</template>

<script>
// import VueGoogleCharts from 'vue-google-charts'
// Vue.use(VueGoogleCharts)
import { GChart } from 'vue-google-charts'
export default {
    
    data(){
        return{
            chartData: [
                ['Year', 'Sales'],
                [2014, 1000],
                [2015, 1170],
                [2016, 660],
                [2017, 1030]
            ],
            chartOptions: {
                chart: {
                title: 'Company Performance',
                subtitle: 'Sales, Expenses, and Profit: 2014-2017',
                },
                 width: 900,
                  height: 500,
                colors: ['#e63131', '#e46a6a'],
                backgroundColor:'#000',
                vAxis:{
                    gridlines: {
                        color: '#5C5C5C',
                        count: 4,
                    },
                    minorGridlines: {
                        color: '#5C5C5C',

                    },
                    textStyle:{
                        color: '#FFF',
                    }
                },
                hAxis:{
                    // maxValue: 1,
                    // format: '#%',
                     textStyle:{
                        color: '#FFF',
                    },
                    gridlines: {
                        color: '#5C5C5C',
                        count: 4,
                    },
                   
                   
                },
                trendlines: { 0: {} } ,

            },
        }
    }
}
</script>

<style>
.div_col{
    color: #ffffff;
}
</style>
