<template>
  <section class="container">
    
    <h1 class="title">
       used By {{name}}
    </h1>
    
  </section>
</template>
<script>
export default {
  data(){
    return{
      name:''
    }
  },
  methods:{
    async userIndex(){
      const res = await this.callApi('get','users')
      if(res.status===200){
        this.name =res.data
        this.s("Here is your Author")
      }
      else{
        this.swr();
      }
    }
  },
  created(){
     this.userIndex();
  }
}
</script>

<style scoped>
.title
{
  margin: 50px 0;
}
</style>
