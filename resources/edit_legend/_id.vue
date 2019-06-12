<template>
    <div>
        
    </div>
</template>

<script>
export default {
    data(){
        return{
            businessHour:[

                {  day : 'Monday',
                    time:[],
                    active:false,

                },
                {  day : 'Tuesday',
                    time:[],
                    active:false,

                },
                {  day : 'Wednesday',
                    time:[],
                    active:false,

                },
                {  day : 'Thursday',
                    time:[],
                    active:false,

                },
                {  day : 'Friday',
                    time:[],
                    active:false,

                },
                {  day : 'Saturday',
                    time:[],
                    active:false,

                },
                {  day : 'Sunday',
                    time:[],
                    active:false,

                },
                
            ],
            showBusinessHour:[

                {  day : 'Monday',
                    time:'',
                    active:false,

                },
                {  day : 'Tuesday',
                    time:'',
                    active:false,

                },
                {  day : 'Wednesday',
                    time:'',
                    active:false,

                },
                {  day : 'Thursday',
                    time:'',
                    active:false,

                },
                {  day : 'Friday',
                    time:'',
                    active:false,

                },
                {  day : 'Saturday',
                    time:'',
                    active:false,

                },
                {  day : 'Sunday',
                    time:'',
                    active:false,

                },
                
            ],
        }
    },
    methods:{
        async legendUpdate(){
            if(this.formData.name == ''|| this.formData.address =='' || this.formData.phone == ''){
                this.i("All fields must be filled !")
                console.log('All fields must be filled !')
                return;
            }
             let hourData = []
            for(let i of this.businessHour ){
                if(i.active == true){
                    if(i.time[0] == ''){
                        this.i("Please select time for "+i.day)
                        return;
                    }
                    let ob = {
                        legend_id: this.legendData.id,
                        day: i.day,
                        time: i.time[0] + '-' + i.time[1]
                    }
                    hourData.push(ob)
                }
                
            }
            
            this.formData.businessHour = hourData
            const res = await this.callApi('put',`/legends/${this.legendData.id}`,this.formData)
            if(res.status===200){
                this.s("Change have been made Successfully!")
                this.legendData.name = this.formData.name
                this.legendData.address = this.formData.address
                this.legendData.phone = this.formData.phone
                
                for(let i in this.businessHour ){
                    if(this.businessHour[i].active == true){
                        this.showBusinessHour[i].active = true
                        this.showBusinessHour[i].time =this.businessHour[i].time[0] + '-' + this.businessHour[i].time[1]
                    }
                    else{
                        this.showBusinessHour[i].active = false
                    }
                }
                this.isEdit=false
            }
            else{
                this.swr();
            }
        },
    },
    async asyncData({app, store,redirect, params}){
    try {
        let {data} = await app.$axios.get(`/legends/${params.id}`)
        return{
            legendData : data.legend,
            userData : data.user,
        }
	}catch (error) {
        console.log(error)
        return redirect('/')
	}
    },
    created(){
              if(this.isLoggedIn) this.user_id = this.authInfo.id
        
        const [res2] = await Promise.all([
            this.callApi('get', `/app/getAdditionlegendInfo/${this.$route.params.id}`),
        ])
        if( res2.status===200 ){
            this.hours = res2.data.hours
            this.isLoading = false
            
        } else{
            this.swr()
            this.isLoading = false
        }

         if(this.hours.length>0){
            for(let d of this.hours){
                for(let sd of this.showBusinessHour){
                    if(d.day == sd.day){
                        sd.active = true
                        sd.time = d.time
                        break
                    }
                }
            }
        }
         for(let i in showBusinessHour){
            if(showBusinessHour[i].active == true){
                let tp = showBusinessHour[i].time.split('-')
                businessHour[i].time[0] = tp[0]
                businessHour[i].time[1] = tp[1]
                businessHour[i].active = true
            }
        }
    }
}
</script>

<style>

</style>
