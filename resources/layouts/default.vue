<template>
  <div>
   <navber/>
    <nuxt/>
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

}
</script>

