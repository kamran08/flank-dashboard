<template>
  <div>
   <navber/>
    <nuxt />
    <myFooter/>
  </div>
</template>

<script>
import MyFooter from '~/components/Footer.vue'
import navber from '~/components/navber.vue'

export default {
  components: {
    navber,
    MyFooter
  },
  watch:{
      $route (to, from){
          console.log("To:")
          console.log(to)
          console.log("Form:")
          console.log(from)
          
      }
  },
}
</script>

