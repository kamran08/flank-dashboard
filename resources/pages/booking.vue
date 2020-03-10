<template>
    <div style="padding-top: 118px;">
     <div class="calendar_area _pad_tb80">
        <div class="_content">
            <div class="row">
              <div class="col-md-12">
                <Button @click="openModal">booking setting</Button>
                 <h2 class="section_title _mar_b30 text-center">Available Booking Date And Time</h2>
              </div>
            </div>
            <div class="row">
              <!-- Left -->.
              <div class="col-md-5">
                <div class="calendar_view">
                  <v-calendar>

                  </v-calendar>
                  <div class="month">      
                    <ul>
                      <li class="prev" @click="previous">&#10094;</li>
                      <li class="next" @click="next">&#10095;</li>
                      <li>
                          {{months[currentMonth]}} 
                        <br>
                        <span style="font-size:18px">{{selectYear}}</span>
                      </li>
                    </ul>
                  </div>
                  <ul class="weekdays">
                      <li>{{alldata[0].day}}</li>
                      <li>{{alldata[1].day}}</li>
                      <li>{{alldata[2].day}}</li>
                      <li>{{alldata[3].day}}</li>
                      <li>{{alldata[4].day}}</li>
                      <li>{{alldata[5].day}}</li>
                      <li>{{alldata[6].day}}</li>
                    </ul>

                    <ul class="days">  
                      <li  :class="(SelectedIndex==index)?'active_day':(item.day=='sun')?'sunday':''"
                        v-for="(item,index) in alldata"
                        :key="index"
                        @click="selectDate(index)">{{item.date}}
                        </li>
                    </ul>

                    <button class="block_btn _mar_t20">Make An Appointment</button>
                </div>
              </div>

              <!-- Right -->
              <div class="col-md-6">
                <div class="calendar_time_slot">
                  <ul class="time_slot_list">
                    <li v-for="(item, index) in slotData" :key="index" :class="(item.book)?'active_slot':''">
                      <span v-if="item.book==true">{{item.slot}}</span>
                      <span v-else @click="openBookingModal(item,index)">{{item.slot}}</span>
                       
                       
                       </li>
                  </ul>
                </div>
              </div>
              
            </div>
          </div> 
     </div>

    

    <Modal
        v-model="timeModal"
        title="Title"
        width="800"
       >
        <div>
       <div class="_login_input_group">
            <div class="_login_input">
              
              <div class="_login_input_inp select_time">
                  <!-- <div class="row">
                    <div class="col-12 col-md-12 _dis_flex">
                        <p class="_1steps_input_title" >Service days</p>
                    </div>
                  </div> -->

                  <div class="row align-items-center ss1">
                    <div class="col-3 col-md-2">
                      <p class="_1steps_input_title" >Service days</p>
                    </div>

                    <div class="col-3 col-md-2">
                        <p class="_1steps_input_title" >Time From</p>
                    </div>

                    <div class="col-3 col-md-2">
                        <p class="_1steps_input_title" >Until</p>
                    </div>

                    <div class="col-3 col-md-4">
                        <p class="_1steps_input_title" >Apoinment Length in minutes 1hour-60min</p>
                    </div>
                  </div>
                  <!-- test -->
  
                  <!-- test -->

                  <div class="row align-items-center" v-for="(item,index) in servicingTime" :key="index">
                    <div class="col-3 col-md-2">
                      <Checkbox v-model="item.isOn">{{item.day}}</Checkbox>
                    </div>

                    <div class="col-3 col-md-2">
                        <TimePicker v-model="item.startTime" format="HH:mm" type="time" placement="bottom-end" placeholder="Start Time" ></TimePicker>
                    </div>

                    <div class="col-3 col-md-2">
                        <TimePicker v-model="item.endTime" format="HH:mm" type="time" placement="bottom-end" placeholder="End Time" ></TimePicker>
                    </div>

                    <div class="col-3 col-md-4">
                        <Input class="_login_input_inp_field" v-model="item.duration" placeholder="Duration" type="number"/>
                    </div>
                    <!-- <div class="col-3 col-md-2" v-if="index==0">
                        <Button @click="fillAllDay">Auto fill</Button>
                    </div> -->
                  </div>
              </div>
            </div>
        </div>
    </div>
      <div slot="footer">
            <Button type="primary"   @click="storeData" v-if="!isLoading2">update</Button>
            <Button type="primary"    v-if="isLoading2" disabled> Loading..</Button>
             <Button type="primary"  @click="timeModal=false"> Cancel</Button>
        </div>
    </Modal>
     <Modal
        v-model="bookingModal"
        title="Title"
        width="800"
       >
         <div class="col-3 col-md-12">
           <p> Name </p>
             <Input v-model="from.name" placeholder="Enter Name..." style="width: 300px" />
          </div>
         <div class="col-3 col-md-12">
               <p> Contact </p>
             <Input v-model="from.contact" placeholder="Enter Contact Number..." style="width: 300px" />
          </div>
           <div slot="footer">
            <Button type="primary"   @click="createNewBooking" v-if="!isLoading2">Submit</Button>
            <Button type="primary"    v-if="isLoading2" disabled> Loading..</Button>
            <Button type="primary"  @click="bookingModal=false"> Cancel</Button>
        </div>
     </Modal>

    </div>
</template>


<script>
import moment from "moment";
export default {
 
  data() {
    return {
      from:{
        slot:'',
        name:'',
        contact:'',
      },
      edit:-1,
      dayName:'',
      bookingModal:false,
         servicingTime:[
                   {
                     startTime:'',
                     endTime:'',
                     day:'Monday',
                     duration:'',
                     isOn:'false',
                     },
                   {
                     startTime:'',
                     endTime:'',
                     day:'Tuesday',
                     duration:'',
                     isOn:'false',
                     },
                   {
                     startTime:'',
                     endTime:'',
                     day:'Wednesday',
                     duration:'',
                     isOn:'false',
                     },
                   {
                     startTime:'',
                     endTime:'',
                     day:'Thursday',
                     duration:'',
                     isOn:'false',
                     },
                   {
                     startTime:'',
                     endTime:'',
                     day:'Friday',
                     duration:'',
                     isOn:'false',
                     },
                   {
                     startTime:'',
                     endTime:'',
                     day:'Saturday',
                     duration:'',
                     isOn:'false',
                     },
                   {
                     startTime:'',
                     endTime:'',
                     day:'Sunday',
                     duration:'',
                     isOn:'false',
                     },
                ],
      today: "",
      todaydate: "",
      todayyear: "",
      todaymonth: "",
      currentYear: "",
      currentMonth: "",
      date: "",
      months: [
        "Jan",
        "Feb",
        "Mar",
        "Apr",
        "May",
        "Jun",
        "Jul",
        "Aug",
        "Sep",
        "Oct",
        "Nov",
        "Dec"
      ],
      alldata: [],
      selectYear: "",
      selectMonth: "",
      days: ["sat", "sun", "mon", "tue", "wed", "thus", "fry"],
      info: {},
      flag: false,
      tempData: [], 
      isLoading: true,
      isLoading2: false,
      SelectedIndex:0,
      slotData:[],
      timeModal:false,
      fulldate:''
    };
  },
  async created() {
      
      this.today = new Date();
      // let tem = moment(this.today).format('hh:ma');
      // // console.log('time', tem)
    let d = this.formatedDate(this.today);
    this.currentMonth = this.today.getMonth();
    this.currentYear = this.today.getFullYear();
    this.selectYear = this.currentYear;
    this.selectMonth = this.currentMonth;
    console.log(this.currentMonth)
    console.log(this.currentYear)

        // this.currentMonth === 11 ? this.currentYear + 1 : this.currentYear;
    this.currentMonth = (this.currentMonth) % 12;
    this.selectMonth = this.currentMontsh;
    this.showCalendar(this.currentMonth, this.currentYear);

    // await this.getcourtData(d);
    
    this.todaymonth = this.today.getMonth();
    
    this.todayyear = this.today.getFullYear();
    this.todaydate = this.today.getDay();
    
    this.selectYear = this.currentYear;
    this.selectMonth = this.currentMonth;

   

    this.getTimesetting()
    this.selectDate(0)
    
  },
  methods: {
    async createNewBooking(){
      if(this.from.name==''){
        return this.e("Name field can not be empty!!")
      }
      if(this.from.slot=='') return this.e("select one of slot first!!")
      if(this.from.contact=='') return this.e("Contact field can not be empty!!")
       this.isLoading2 = true
       const res = await this.callApi('post', 'create-new-booking',this.from)

      if(res.status==200 || res.status==201){
           this.s("new booking has been created!!")
          this.slotData[this.edit].book = true
           this.bookingModal = false
           this.from.name=''
           this.from.slot=''
           this.from.contact=''
      // this.$set(this.slotData[index], 'book', true);
      }
      else{
        this.e("please check your network!!")
        this.bookingModal = false
      }
    },


    async openBookingModal(item,index){
      
      this.from.slot = item.slot
      this.from.day = this.dayName
      this.from.date = this.fulldate
      this.edit = index
      this.bookingModal = true
     

    },
    async getTimesetting(){
      
        const res = await this.callApi('get', 'all-time-setting')
      if(res.status==200){
        for(let item of res.data){
             item.isOn = true
        }
        for(let i in res.data){
          for(let j in this.servicingTime){
            if(res.data[i].day==this.servicingTime[j].day){
                this.servicingTime[j]=res.data[i]
            }
          }
        }
        // this.servicingTime = res.data
        
      }

    },
    async openModal(){
        this.timeModal = true
      },
    async storeData(){
      this.isLoading2 = true
      for(let item of this.servicingTime){
            if(item.isOn==true){
              if(item.startTime=="" || item.endTime == "" || item.duration== ""){
                this.isLoading2 = false
                return this.e("Please fill the time solts of "+ item.day+" !");
              }
            }
        }
        for(let item of this.servicingTime){
            if(item.isOn==false){
              item.startTime="00:00"
              item.endTime="00:00"
              item.duration="00:00"
            }
        }
        
     const res = await this.callApi('post', 'store-all-time-setting', this.servicingTime)
     if(res.status==200 || res.status==201){
       this.s("update time setting successfully!!")
       this.isLoading2 = false
       this.timeModal = false
     }
     else{
       this.i("please check your newtwork")
       this.isLoading2 = false
     }
     this.isLoading2 = false
    },
   async createSlot(start,end,duration,day){
     console.log('stat',this.selectYear, this.currentMonth, this.alldata[this.SelectedIndex])
     this.dayName = day

      const res = await this.callApi('get', `get-all-time-slot?start=${start}&end=${end}&duration=${duration}&day=${day}&date=${this.fulldate}`)
      
      this.slotData = []
      if(res.status==200){
        this.slotData = res.data
      }
      // var diff =(start.getTime() - end.getTime()) / 1000;
      // diff /= (60);
      // diff =Math.abs(Math.round(diff));
      //   let s
      //   let en
      //   let e
      // for(let i=0; i<diff; i+=duration){
      //    s  = moment(start).format('hh:mm a');
      //    en = new Date(start.getTime() + duration*60000);
      //    e = moment(en).format('hh:mm a');
      //   this.slotData.push(s+'-'+e)
      //   start =new Date(start.getTime() + duration*60000);

      // }
      console.log('data',this.slotData)


    },
 async selectDate(index){
  //  console.log('okkk', this.alldata[index])
      this.fulldate = this.selectYear+'-'+(this.selectMonth+1)+'-'+this.alldata[index].date
       let day =''
       if(this.alldata[index].day=='sat'){
         day ='Saturday'
       }
       else if(this.alldata[index].day=='sun'){
         day ='Sunday'
       }
       else if(this.alldata[index].day=='mon'){
         day ='Monday'
         
       }
       else if(this.alldata[index].day=='tue'){
         day ='Tuesday'
       }
       else if(this.alldata[index].day=='wed'){
         day ='Wednesday'
       }
       else if(this.alldata[index].day=='thus'){
        day ='Thursday'
       }
       else if(this.alldata[index].day=='fry'){
         day ='Friday'
       }
       console.log('okkk', day)
       let dindex = -1
       for(let i in this.servicingTime){
         if(this.servicingTime[i].day==day){
              if(this.servicingTime[i].isOn==true){
                dindex = i
                break
              }
         }
       }
       if(dindex!=-1){
          let start = new Date(this.selectYear+'-'+(this.selectMonth+1)+'-'+this.alldata[index].date+' '+this.servicingTime[dindex].startTime);
          let end = new Date(this.selectYear+'-'+(this.selectMonth+1)+'-'+this.alldata[index].date+' '+this.servicingTime[dindex].endTime);
          let duration = this.servicingTime[dindex].duration
          console.log(start)
          console.log(end)
          console.log(duration)
          await this.createSlot(start,end,duration,day);
       }
       else{
            console.log("im not here")
         this.slotData =[]

       }
      

    
         this.SelectedIndex = index
         this.alldata[index].day
         console.log(this.alldata[index])
         this.i(index)
    },
    clearData(){
      this.tempData = []
    },
    inserttempData(item, index,i) {
      // check if user is unselecting 
      item.booked = !item.booked
      if(item.booked){ // push object...
          item.day = this.days[new Date(item.start).getDay()]
          item.month = this.months[new Date(item.start).getMonth()]
          item.year = new Date(item.start).getFullYear()
          item.SH = new Date(item.start).getHours()
          item.EH = new Date(item.end).getHours()
          let min = new Date(item.start).getMinutes()
        let mine = new Date(item.end).getMinutes()
        item.diff =((item.EH+mine) - (item.SH+min))*60
        if(item.SH<10){
          item.SH = '0'+item.SH
          if(min<10){
            item.SH = item.SH +":"+'0'+min
          }
          else{
            item.SH = item.SH +":"+min
          }
        }
       if(item.EH<10){
          item.EH = '0'+item.EH
          if(mine<10){
            item.EH = item.EH +":"+'0'+mine
          }
          else{
            item.EH = item.EH +":"+mine
          }
        }
          this.tempData.push(item);
      }else{ // splice the item 
          let itemIndex = this.tempData.findIndex(el => el.id===item.id)
          this.tempData.splice(itemIndex, 1)
          
      }
    },
    next() {
      this.currentYear =
        this.currentMonth === 11 ? this.currentYear + 1 : this.currentYear;
      this.currentMonth = (this.currentMonth + 1) % 12;
      this.selectYear = this.currentYear;
      this.selectMonth = this.currentMonth;
      this.showCalendar(this.currentMonth, this.currentYear);
    },

     previous() {
      let cm = this.currentMonth
      let cy = this.currentYear
      this.currentYear =this.currentMonth === 0 ? this.currentYear - 1 : this.currentYear;
      this.currentMonth = this.currentMonth === 0 ? 11 : this.currentMonth - 1;
      if(this.currentYear<this.today.getFullYear()){
        this.currentYear = cy
        this.currentMonth = cm
        console.log("invalid")
        return 
      }
      if(this.currentYear == this.today.getFullYear()){
        if(this.today.getMonth()>this.currentMonth){
          this.currentYear = cy
          this.currentMonth = cm
          console.log("invalid")
          return
        }
      }
      this.selectYear = this.currentYear;
      this.selectMonth = this.currentMonth;
      this.showCalendar(this.currentMonth, this.currentYear);
    },
    jump() {
      console.log(this.selectYear);
      console.log(this.selectMonth);
      this.currentYear = parseInt(this.selectYear);
      this.currentMonth = parseInt(this.selectMonth);

      this.showCalendar(this.currentMonth, this.currentYear);
    },

    

  showCalendar(month, year) {
      // console.log(month,year)
    
      this.alldata = [];
      let tem = [];
      let firstDay = new Date(year, month).getDay();
      let daysInMonth = 32 - new Date(year, month, 32).getDate();

      let date = 1;
      for (let i = 0; i < 6; i++) {
        //creating individual cells, filing them up with data.
        for (let j = 0; j < 7; j++) {
          if (i === 0 && j < firstDay) {
          } 
          else if (date > daysInMonth ) {
            break;
          } 
          else {
             if(this.today.getMonth()==month && this.today.getFullYear() == year){
                
                if(date>31){
                    break;
                }
                if(this.today.getDate()<=date){
                    if (j + 1 == 7) {
                      this.alldata.push({ date: date, day: this.days[0] });
                    } 
                    else {
                      this.alldata.push({ date: date, day: this.days[j + 1] });
                    }
                }
                date++;
              }
            else{
                 if (j + 1 == 7) {
                      this.alldata.push({ date: date, day: this.days[0] });
                    } else {
                      this.alldata.push({ date: date, day: this.days[j + 1] });
                   }
                   date++;
            }
          }
        }
      }
      
      for(let k=0; k<this.alldata.length; k++){
           this.$set(this.alldata[k], date, this.alldata[k].date);
      }
      // console.log(this.months[this.currentMonth])
      // console.log(this.alldata)
    },
    formatedDate(date) {
      var d = new Date(date),
        month = "" + (d.getMonth() + 1),
        day = "" + d.getDate(),
        year = d.getFullYear();

      if (month.length < 2) month = "0" + month;
      if (day.length < 2) day = "0" + day;

      return [year, month, day].join("-");
    },
    createNewDate(y, m, d,index) {
      this.SelectedIndex = index
      if (m < 10) {
        m = "0" + m;
      }
      if (d < 10) {
        d = "0" + d;
      }
      this.getcourtData(y + "-" + m + "-" + d);
    },
    // async getcourtData(date) {
    //   this.isLoading = true
    //   const res = await axios.get(`${this.siteUrl}app/div/get-matchi-data/${date}`);
    //   if (res.status === 200) {
    //     this.info = res.data;
    //   } else {
    //     console.log("something went wrong", res);
    //   }
    //   this.isLoading = false
    // }
  }, 
  computed:{
    getValue() {
      return 1;
    },
    selectedData(){
      let item = [];
      let i = 1;
      for(let d of this.tempData){
          if(i > 2)break
          item.push(d)
          i++
      }
      return item
    }
  },

  filters: {
      timeConverT( value ){
          return moment(value).format('hh:ma');
      }
  }
};
</script>

