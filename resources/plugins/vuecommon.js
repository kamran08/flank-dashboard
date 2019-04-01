import Vue from 'vue'
Vue.mixin({
  
  methods: {
    async callApi(method, url, dataObj){
       
        try{

            let data = await this.$axios({
                method: method,
                url: url,
                data: dataObj
            })
            return data 
            
        }catch(e){
            
            return e.response
        }
    },
  },
  created(){
   
  }
})