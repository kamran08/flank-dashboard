<template>
  <div>
      

      <h4>This admin Index</h4>
        
    </div>
</template>


<script>
export default {
  data() {
    return {
   
    };
  },
//   async asyncData({ app, store, redirect, params }) {
//     try {
//       let { data } = await app.$axios.get(`/legends`);

//       return {
//         legendList: data
//       };
//     } catch (error) {
//       //return redirect('/404')
//     }
//   },
  methods: {

  },
  async created() {

    // if(this.$route.query.login == 'success') this.i("Login Successful !")
    // const [res1, res2,res4, res3] = await Promise.all([
    //   this.callApi("get", `/app/getSchoolcoaches`),
    //   this.callApi("get", `/app/reviewOfTheDay`),
    //   this.callApi("get", `/app/recentCitys`),
    //   this.callApi("get", `/app/getRecentReview`)
    // ]);
    // if (res1.status === 200 && res2.status == 200) {
    //   this.schoolCoaches = res1.data;
    //   this.review_of_day = res2.data;
    //   this.recentReview = res3.data;
    //   this.allCity = res4.data;
    //   // this.review_of_day.bestReview = res2.data.bestReview
    //   this.loading = false;
    // } else {
    //   this.swr();
    //   this.loading = false;
    // }

  }
};
</script>
