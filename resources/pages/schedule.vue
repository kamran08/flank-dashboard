<template>
	<div>
		<div class="content">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<!--~~~~~~~ TABLE ONE ~~~~~~~~~-->
						<div class="_1adminOverveiw_table_recent _box_shadow _border_radious _mar_b30 _p20" v-if="!isLoading" >
							<div class="_overflow _table_div">
								<table class="_table">
										<!-- TABLE TITLE -->
                                    <tr> 
                                        <th >Day</th>
                                        <th>Time</th>
                                    </tr>
                                    <tr>
                                        <td>Monday</td>
                                        <td >
                                            <template  v-if="isEdit" >
                                                <div class="table-input table_extra_p">
                                                    <TimePicker v-model="businessHour[0].time" format="hh:mm A" type="timerange" placement="bottom-end" placeholder="Select time"></TimePicker>
                                                    <Checkbox v-model="businessHour[0].active">Active</Checkbox>
                                                </div>
                                            </template>
                                            <template  v-else-if=" !isEdit && showBusinessHour[0].active">
                                                <div class="table-data"  >
                                                    <span  class="nowrap">{{showBusinessHour[0].time}}</span>
                                                </div>
                                            </template>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Tuesday</td>
                                        <td >
                                            <template  v-if="isEdit" >
                                                <div class="table-input table_extra_p">
                                                    <TimePicker v-model="businessHour[1].time" format="hh:mm A" type="timerange" placement="bottom-end" placeholder="Select time"></TimePicker>
                                                    <Checkbox v-model="businessHour[1].active">Active</Checkbox>
                                                </div>
                                            </template>
                                            <template  v-else-if=" !isEdit && showBusinessHour[1].active">
                                                <div class="table-data"  >
                                                    <span  class="nowrap">{{showBusinessHour[1].time}}</span>
                                                </div>
                                            </template>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Wednesday</td>
                                        <td  >
                                            <template  v-if="isEdit" >
                                                <div class="table-input table_extra_p">
                                                    <TimePicker v-model="businessHour[2].time" format="hh:mm A" type="timerange" placement="bottom-end" placeholder="Select time"></TimePicker>
                                                    <Checkbox v-model="businessHour[2].active">Active</Checkbox>
                                                </div>
                                            </template>
                                            <template  v-else-if=" !isEdit && showBusinessHour[2].active">
                                                <div class="table-data"  >
                                                    <span  class="nowrap">{{showBusinessHour[2].time}}</span>
                                                </div>
                                            </template>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Thursday</td>
                                        <td  >
                                            <template  v-if="isEdit" >
                                                <div class="table-input table_extra_p">
                                                    <TimePicker v-model="businessHour[3].time" format="hh:mm A" type="timerange" placement="bottom-end" placeholder="Select time"></TimePicker>
                                                    <Checkbox v-model="businessHour[3].active">Active</Checkbox>
                                                </div>
                                            </template>
                                            <template  v-else-if=" !isEdit && showBusinessHour[3].active">
                                                <div class="table-data"  >
                                                    <span  class="nowrap">{{showBusinessHour[3].time}}</span>
                                                </div>
                                            </template>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Friday</td>
                                        <td  >
                                             <template  v-if="isEdit" >
                                                <div class="table-input table_extra_p">
                                                    <TimePicker v-model="businessHour[4].time" format="hh:mm A" type="timerange" placement="bottom-end" placeholder="Select time"></TimePicker>
                                                    <Checkbox v-model="businessHour[4].active">Active</Checkbox>
                                                </div>
                                            </template>
                                            <template  v-else-if=" !isEdit && showBusinessHour[4].active">
                                                <div class="table-data"  >
                                                    <span  class="nowrap">{{showBusinessHour[4].time}}</span>
                                                </div>
                                            </template>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Saturday</td>
                                        <td  >
                                            <template  v-if="isEdit" >
                                                <div class="table-input table_extra_p">
                                                    <TimePicker v-model="businessHour[5].time" format="hh:mm A" type="timerange" placement="bottom-end" placeholder="Select time"></TimePicker>
                                                    <Checkbox v-model="businessHour[5].active">Active</Checkbox>
                                                </div>
                                            </template>
                                            <template  v-else-if=" !isEdit && showBusinessHour[5].active">
                                                <div class="table-data"  >
                                                    <span  class="nowrap">{{showBusinessHour[5].time}}</span>
                                                </div>
                                            </template>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Sunday</td>
                                        <td  >
                                            <template  v-if="isEdit" >
                                                <div class="table-input table_extra_p">
                                                    <TimePicker v-model="businessHour[6].time" format="hh:mm A" type="timerange" placement="bottom-end" placeholder="Select time"></TimePicker>
                                                    <Checkbox v-model="businessHour[6].active">Active</Checkbox>
                                                </div>
                                            </template>
                                            <template  v-else-if=" !isEdit && showBusinessHour[6].active">
                                                <div class="table-data"  >
                                                    <span  class="nowrap">{{showBusinessHour[6].time}}</span>
                                                </div>
                                            </template>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Action</td>
                                        <td v-if="isEdit" >
                                            <button @click="updateItem" class="_btn _action_btn edit_btn1" type="button">Save</button>
                                            <button @click="editItem" class="_btn _action_btn edit_btn1" type="button">Cancel</button>
                                        </td>
                                        <td v-else ><button @click="editItem" class="_btn _action_btn edit_btn1" type="button">Edit</button></td>
                                    </tr>
                                    
                                    
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>
</template>

<script>

export default {
    data(){
		return{
            hours:[],
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
			isLoading:true,
            isEdit: false,
            edit_data: {},
			editIndex:-1,
		}
	},
    methods:{
        editItem(){
			for(let i in this.showBusinessHour){
                if(this.showBusinessHour[i].active == true){
                    let tp = this.showBusinessHour[i].time.split('-')
                    this.businessHour[i].time[0] = tp[0]
                    this.businessHour[i].time[1] = tp[1]
                    this.businessHour[i].active = true
                }
            }
            this.isEdit = true
		},
        async updateItem(){

            let hourData = []
            for(let i of this.businessHour ){
                if(i.active == true){
                    if(i.time[0] == ''){
                        this.i("Please select time for "+i.day)
                        return;
                    }
                    let ob = {
                        day: i.day,
                        time: i.time[0] + '-' + i.time[1]
                    }
                    hourData.push(ob)
                }
                
            }

            const response = await this.callApi('put', '/app/hours', {hourData:hourData});
            if (response.status === 200) {
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
                
             	
                this.s('Information updated successfully !');
            }else{
                this.swr();
            }
        },
        
	},
	async created(){
		const res = await this.callApi('get','/app/hours')
		if( res.status == 200){
           
            this.hours = res.data
            
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
			
		} else {
			this.swr()
			
        }
        this.isLoading = false
	},




}
</script>
<style scoped>
.demo-upload-list { 
  display: inline-block;
  width: 200px;
  height: 150px;
  text-align: center;
  line-height: 60px;
  border: 1px solid transparent;
  border-radius: 4px;
  overflow: hidden;

  position: relative;

  margin-right: 4px;
}
.demo-upload-list img {
  width: 100%;
  height: 100%;
}
.demo-upload-list-cover {
  display: none;
  position: absolute;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
  background: rgba(0, 0, 0, 0.6);
}
.demo-upload-list:hover .demo-upload-list-cover {
  display: block;
}
.demo-upload-list-cover i {
  color: #fff;
  font-size: 40px;
  cursor: pointer;
  margin: 0 2px;
}
</style>


