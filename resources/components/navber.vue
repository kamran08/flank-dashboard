
<template>
<div>
    <!-- <div class="top-bar">
            <div class="container">
                <div class="top-bar-inner">
                    <div class="pull-left">
                        <div class="bar-logo">
                            <img src="/image/accountants.png" alt="">
                            <span>Get ahead of tax season</span>
                        </div>
                    </div>
                    <div class="pull-right">
                        <div class="bar-nav">
                            <ul>
                                <li><a href="">Accountants</a></li>
                                <li><a href="">CPA Firms</a></li>
                                <li><a href="">Small Business Accountants</a></li>
                                <li><a href="">Tax Services</a></li>
                            </ul>
                            <div id="bar-hide">
                                <span><i class="fas fa-times"></i></span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div> -->
        <!-- <nav class="navbar border-less-nav game-nav">
            <div class="navbar-logo">
                <ul>
                    <li><a href=""><img src="/image/downloa.png" alt=""></a></li>
                    <li><a @click="$router.push('/')" ><img src="/image/download.png" alt=""></a></li>
                </ul>
            </div>
            <div class="navbar-item">
                <ul>
                    <li><a href="">Get Fortnite</a></li>
                    <li><a href="">Battle Pass</a></li>
                    <li><a href="">Creative</a></li>
                    <li><a href="">Competitive</a></li>
                    <li><a href="">Watch</a></li>
                    <li><a href="">News</a></li>
                    <li><a href="">Faq</a></li>
                    <li><a href="">Help</a></li>
                    <li><nuxt-link to="/about" >About</nuxt-link></li>
                    <li @click="reviewModal=true" ><a>Give Review</a></li>
                </ul>
                <ul>
                    <li v-if="!isLoggedIn" ><nuxt-link class="nav-link" to="/login" ><i class="fas fa-user-shield"></i>&nbsp;&nbsp;Sign In</nuxt-link>
                    <li v-if="isLoggedIn && packType !=2 " @click="$router.push(`/flanker/${authInfo.id}`)" ><a >Profile</a></li>
                    <li v-if="isLoggedIn && packType == 2 " @click="$router.push(`/profile/${legend_id}`)" ><a >Profile</a></li>
                    <li v-if="isLoggedIn" @click="logout" ><a >Log Out</a></li>
                    <li><a href="">Download</a></li>
                </ul>
            </div>
            </nav> -->
            <Modal
                v-model="reviewModal"
                title="Start Your Review "
                width='500'
                fullscreen 
                
                >
                <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                            <p class=" msg_box_header">Write Review For?</p>
                            <div class="review-button">
                                <div class="btn-role"  @click="rData.for=1"  ><Button :class="(rData.for == 1)? 'act-btn': ''" >School</Button></div>
                                <div class="btn-role"  @click="rData.for=2"  ><Button :class="(rData.for == 2)? 'act-btn': ''" >Local Legend</Button></div>
                                <div class="btn-role"  @click="rData.for=3"  ><Button :class="(rData.for == 3)? 'act-btn': ''" >Product</Button></div>
                            </div>
                            <template v-if="rData.for == 2" >
                                 <AutoComplete
                                    style="width: 100%;margin-top: 15px;"
                                    v-model="lData.key"
                                    icon="ios-search"
                                    @on-change="SearchByKeyCoach"
                                    placeholder="Enter Coach Name ..."
                                    >
                                    <div class="demo-auto-complete-item"  v-for="(item,index) in coachList" :key="index" @click="selectLegendWall(item)"  >
                                            <p class="ivu-select-item">{{ item.name }}</p>
                                    </div>
                                </AutoComplete>
                            </template>
                            <template v-if="rData.for ==3" >
                                  <AutoComplete
                                    style="width: 100%;margin-top: 15px;"
                                    v-model="pData.key"
                                    icon="ios-search"
                                    @on-change="SearchByKeyProduct"
                                    placeholder="Enter Product Name ..."
                                    >
                                    <div class="demo-auto-complete-item"  v-for="(item,index) in productList" :key="index" @click="selectProductWall(item)"  >
                                            <p class="ivu-select-item">{{ item.name }}</p>
                                    </div>
                                </AutoComplete>
                            </template>
                            <template v-else-if="rData.for==1" >
                                  <AutoComplete
                                    style="width: 100%;margin-top: 15px;"
                                    v-model="rData.school"
                                    icon="ios-search"
                                    @on-change="SearchByKeySchool"
                                    placeholder="Enter School Name ..."
                                    >
                                    <div class="demo-auto-complete-item"  v-for="(item,index) in schoolList" :key="index" @click="manageSchoolData(item)"  >
                                            <p class="ivu-select-item">{{item.name}} | {{item.sport}} </p>
                                    </div>
                                </AutoComplete>
                                
                                <template v-if="sData.school_id !=0" >
                                       <AutoComplete
                                        style="width: 100%;margin-top: 15px;"
                                        v-model="rData.key"
                                        icon="ios-search"
                                        @on-change="SearchByKeySchoolCoach"
                                        placeholder="Enter School Coach Name ..."
                                        >
                                        <div class="demo-auto-complete-item"  v-for="(item,index) in schoolCoachList" :key="index" @click="selectCoachWall(item)"  >
                                                <p class="ivu-select-item">{{item.name}}</p>
                                        </div>
                                    </AutoComplete>
                                    <Button v-if="schoolCoachList.length==0 &&  rData.key !='' && !schoolButton" @click="CreateNewCoach" style="margin-top: 10px;" >Create a Coach</Button>
                                    <div class="text-center m-2">
                                </div>
                                </template>
                            </template>
                        </div>

                        <div class="footer_buttons">
                            <div class="text-center m-2" v-if="rData.for == 2" >
                                <Button  v-if="legendButton && coachList.length==0" type="info" @click="goToLegendWall">Continue</Button>
                                <Button  class="disable_btn" v-else type="info" disabled>Continue</Button>
                            </div>
                            <div class="text-center m-2" v-if="rData.for == 1" >
                                <Button  v-if="schoolButton && schoolCoachList.length==0" type="dashed" @click="goToCoachWall">Continue</Button>
                                <Button class="disable_btn" v-else type="dashed" disabled>Continue</Button>
                            </div>
                            <div class="text-center m-2" v-if="rData.for == 3" >
                                <Button  v-if="productButton && productList.length==0" type="dashed" @click="goToProductWall">Continue</Button>
                                <Button class="disable_btn" v-else type="dashed" disabled>Continue</Button>
                            </div>
                        </div>
                    </div>
                </div>
                <div slot="footer">
                    <!-- <div class="text-center m-2" v-if="rData.for == 2" >
                        <Button  v-if="legendButton && coachList.length==0" type="info" @click="goToLegendWall">Continue</Button>
                        <Button v-else type="info" disabled>Continue</Button>
                    </div>
                    <div class="text-center m-2" v-if="rData.for == 1" >
                        <Button  v-if="schoolButton && schoolCoachList.length==0" type="dashed" @click="goToCoachWall">Continue</Button>
                        <Button v-else type="dashed" disabled>Continue</Button>
                    </div>
                    <div class="text-center m-2" v-if="rData.for == 3" >
                        <Button  v-if="productButton && productList.length==0" type="dashed" @click="goToProductWall">Continue</Button>
                        <Button v-else type="dashed" disabled>Continue</Button>
                    </div> -->
                </div>
            </Modal>
               <header>
            <div class="header-second"> 
                <div class="container">
                    <a @click="$router.push(`/`)" class="navbar-brand show_logo"><img class="img-responsive" src="/image/default.png" alt=""></a>
                    <form action="#">
                        <div class="equal-div">
                            <div class="input-group pageOption">
                                <span class="input-group-addon position-top" id="basic-addon1">Coach</span>
                                <input type="text" class="form-control" v-model='pageOption' placeholder="Different type of Sport Coaches" >
                                <div class="right-dropdown menu_dropDown_on">
                                    <div class="menu_dropDown_on_main">
                                        <ul>
                                            <li @click="pageOption = 'school'" ><a ><i class="fas fa-running"></i>School</a></li>
                                            <li @click="pageOption = 'coach'" ><a ><i class="fas fa-running"></i>Coach</a></li>
                                            <li @click="pageOption = 'legend'" ><a ><i class="fas fa-running"></i>Local Legend</a></li>
                                            <li @click="pageOption = 'product'" ><a ><i class="fas fa-running"></i>Products & services</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="input-group" >
                                <span class="input-group-addon" id="basic-addon1">Find</span>
                                <input type="text" class="form-control"  v-model="searchTxt" placeholder="Search any Attributes" aria-describedby="basic-addon1">
                                <span @click="SearchByKey()" class="input-group-btn search-btn position-top"><i class="fas fa-search"></i></span>
                            </div>
                        </div>
                   </form>
                   <!-- <div class="pull-right">
                       <ul class="logsign">
                           <li><a href="">Log In</a></li>
                           <li><a href="">Sign Up</a></li>
                       </ul>
                   </div> -->
                </div>
            </div>
            <div class="header-nav">
               <div class="container">
                   <ul class="main-nav">
                       <li  ><a @click="SearchByKey('coach')" ><i class="fas fa-calculator"></i>&nbsp;&nbsp;High School Coach</a></li>
                       <li><a href=""><i class="fas fa-calculator"></i>&nbsp;&nbsp;Collage Coach&nbsp;<i class="fas fa-angle-down"></i></a>
                           <div class="nav-dropdown">
                               <ul class="pull-left">
                                   <li><a href=""><i class="fas fa-calculator"></i>&nbsp;&nbsp;Junior College</a></li>
                                   <li><a href=""><i class="fas fa-calculator"></i>&nbsp;&nbsp;MCLA</a></li>
                               </ul>
                               <ul class="pull-left">
                                   <li><a href=""><i class="fas fa-calculator"></i>&nbsp;&nbsp;NAIA</a></li>
                                   <li><a href=""><i class="fas fa-calculator"></i>&nbsp;&nbsp;NCAA DI</a></li>
                               </ul>
                               <ul class="pull-left">
                                   <li><a href=""><i class="fas fa-calculator"></i>&nbsp;&nbsp;NCAA DII</a></li>
                                   <li><a href=""><i class="fas fa-calculator"></i>&nbsp;&nbsp;NCAA DIII</a></li>
                               </ul>
                           </div>
                       </li>
                       <li><a  @click="SearchByKey('legend')"><i class="fas fa-calculator"></i>&nbsp;&nbsp;Local Instructors</a></li>
                       <li><a href=""><i class="fas fa-calculator"></i>&nbsp;&nbsp;More&nbsp;<i class="fas fa-angle-down"></i></a>
                           <div class="nav-dropdown">
                               <ul class="pull-left">
                                   <li><a @click="SearchByKey('coach','rated')"><i class="fas fa-calculator"></i>&nbsp;&nbsp;Best Rated Coaches</a></li>
                                   <li><a @click="SearchByKey('coach','Worst')"><i class="fas fa-calculator"></i>&nbsp;&nbsp;Worst Rated Coaches</a></li>
                                   <li><a @click="SearchByKey('coach','most')"><i class="fas fa-calculator"></i>&nbsp;&nbsp;Most Connected</a></li>
                                   <li><a @click="SearchByKey('coach')"><i class="fas fa-calculator"></i>&nbsp;&nbsp;Travel Coaches</a></li>
                                   <li><a @click="SearchByKey('product','rated')"><i class="fas fa-calculator"></i>&nbsp;&nbsp;Products & Services</a></li>
                               </ul>
                               <ul class="pull-left">
                                   
                               </ul>
                               <ul class="pull-left">
                                   
                               </ul>
                           </div>
                       </li>
                   </ul>
                   <ul class="main-nav right-top pull-right">
                       <li @click="reviewModal=true"><a ><i class="fas fa-pen"></i>&nbsp;Write a Review</a></li>
                        <li v-if="!isLoggedIn" ><nuxt-link class="nav-link" to="/login" ><i class="fas fa-user-shield"></i>&nbsp;&nbsp;Sign In</nuxt-link>
                        <li v-if="isLoggedIn " @click="$router.push(`/flanker/${authInfo.id}`)" ><a >User Profile</a></li>
                        <li v-if="isLoggedIn && packType == 2 " @click="$router.push(`/profile/${legend_id}`)" ><a >Legend Profile</a></li>
                        <li v-if="isLoggedIn" @click="logout" ><a >Log Out</a></li>
                   </ul>
               </div>
               <div class="container">
                   <div class="mobile-main-nav">
                       <div class="mobile-nav-button">
                           <button><span><i class="fas fa-bars"></i></span></button>
                       </div>
                       <div class="mobile-main-nav-list">
                           <ul class="main-list-mobile">
                               <li class="main-list-link"><a href="" class="main-list-act"><span><i class="fas fa-calculator"></i></span>High school coach</a></li>
                               <li class="main-list-link"><a href="" class="main-list-act"><span><i class="fas fa-calculator"></i></span>College coach<span class="determiner"><i class="fas fa-caret-down"></i></span></a>
                                <ul class="mobile-dropdown">
                                    <li class="mobile-dropdown-list">
                                        <a href=""><span><i class="fas fa-calculator"></i></span>Junior College</a>
                                    </li>
                                    <li class="mobile-dropdown-list">
                                        <a href=""><span><i class="fas fa-calculator"></i></span>MCLA</a>
                                    </li>
                                    <li class="mobile-dropdown-list">
                                        <a href=""><span><i class="fas fa-calculator"></i></span>NAIA</a>
                                    </li>
                                    <li class="mobile-dropdown-list">
                                        <a href=""><span><i class="fas fa-calculator"></i></span>NCAA DI</a>
                                    </li>
                                    <li class="mobile-dropdown-list">
                                        <a href=""><span><i class="fas fa-calculator"></i></span>NCAA DII</a>
                                    </li>
                                    <li class="mobile-dropdown-list">
                                        <a href=""><span><i class="fas fa-calculator"></i></span>NCAA DIII</a>
                                    </li>
                                </ul>
                               
                               </li>
                               <li class="main-list-link"><a href="" class="main-list-act"><span><i class="fas fa-calculator"></i></span>Local Instructors</a></li>
                               <li class="main-list-link"><a href="" class="main-list-act"><span><i class="fas fa-calculator"></i></span>More</a></li>
                               <li class="main-list-link"><a href="" class="main-list-act"><span><i class="fas fa-pen"></i></span>Write a review</a></li>
                               <li class="main-list-link"><a href="" class="main-list-act"><span><i class="fas fa-user-shield"></i></span>Sign in</a></li>
                               <li class="main-list-link"><a href="" class="main-list-act"><span><i class="fas fa-sign-in-alt"></i></span>Sign up</a></li>
                           </ul>
                       </div>
                   </div>
               </div>
            </div>
        </header>
</div>
</template>

<script>
    export default {
        data(){
            return{
                packType:0,
                legend_id:0,
                reviewModal:false,
                rData:{
                    for:0,
                    key:'',
                    school:'',
                },
                pData:{
                    key:'',
                },
                lData:{
                    key:'',
                },
                schoolButton:false,
                schoolButton_id:0,
                legendButton:false,
                legendButton_id:0,
                productButton:false,
                productButton_id:0,
                coachList:[],
                schoolList:[],
                schoolCoachList:[],
                productList:[],
                sData:{
                    school_id:0,
                    
                },
                legend:{
                    id:'',
                },
                iamIndex:false,
                searchTxt:'',
                addressTxt:'',
                pageOption:'',
                sort:''
                
            }
        },
        async asyncData({app, store,redirect, params}){
            try {
                let {data} = await app.$axios.get(`/legends/${params.id}`)
            
                return{
                    legendData : data.legend,
                    userData : data.user,
                    averageRating : data.averageRating,
                    healthPulse : data.healthPulse,
                    AttributeInfo : data.AttributeInfo,
                    totalReview : data.legend.__meta__.totalReview_count
                    
                }
            }catch (error) {
                console.log(error)
                return redirect('/')
            }
        },
        methods:{
          
        async SearchByKey(legend = '',sort = ''){
            if(legend != '')
                this.pageOption = legend
            if(sort != '')
                this.sort = sort
            if(this.pageOption == '') this.pageOption = 'legend'
            const res = await this.callApi('get', `/app/SearchData?place=${this.addressTxt}&str=${this.searchTxt}&pageOption=${this.pageOption}&sort=${this.sort}`)
            console.log("pamramiter Key")
            if(res.status === 200){
               
                
                this.$store.commit('setSearchData', res.data.data)
                delete res.data.data
                this.$store.commit('setPagination', res.data )
                this.$store.commit('setPageOptino', this.pageOption )
                this.$router.push(`/search_result?place=${this.addressTxt}&str=${this.searchTxt}&pageOption=${this.pageOption}&sort=${this.sort}`)
            }
            else{
                this.swr();
            }
        },
            closeModal(){
                this.rData.for=0
                this.rData.key=''
                this.rData.school=''
                this.coachList=[]
                this.schoolList=[]
                this.schoolCoachList=[]
                this.productList=[]
                this.sData.school_id = 0

                this.reviewModal = false
            },
            async CreateNewCoach(){
                if(this.sData.school == ''){
                    this.i('Please Write a Coach Name')
                    return
                }
                 if(this.isLoggedIn == false){
                    this.i('Please login first !')
                    this.$router.push('/login');
                    return
                }
                let tempCoach = {
                    school_id: this.sData.school_id,
                    name:this.rData.key
                }
                const res = await this.callApi('post','/app/storeSchoolCoache',tempCoach)
                if(res.status == 200){
                    this.SearchByKeySchoolCoach()
                    this.s('Coach created successfully!')
                   
                }
                else{
                    this.swr()
                }
            },
            manageSchoolData(item){
                this.rData.school = item.name+" | "+item.sport
                this.sData.school_id = item.id
                this.schoolList = []

            },
            async SearchByKeySchoolCoach(){
                console.log('This is ok')
               const res = await this.callApi('get',`/app/SearchByKeySchoolCoach?key=${this.rData.key}&school_id=${this.sData.school_id}`) 
               if(res.status=== 200){
                   this.schoolCoachList = res.data
               }
               else{
                   this.swr()
               }
            },
            async SearchByKeyCoach(){
               const res = await this.callApi('get',`/app/SearchByKeyCoach?key=${this.lData.key}`)
               if(res.status=== 200){
                   this.coachList = res.data
               }
               else{
                   this.swr()
               }
            },
            async SearchByKeyProduct(){
               const res = await this.callApi('get',`/app/SearchByKeyProduct?key=${this.pData.key}`)
               if(res.status=== 200){
                   this.productList = res.data
               }
               else{
                   this.swr()
               }
            },
            async SearchByKeySchool(){ 
               const res = await this.callApi('get',`/app/SearchByKeySchool?key=${this.rData.school}`)
               if(res.status=== 200){
                   this.schoolList = res.data
               }
               else{
                   this.swr()
               }
            },
            async selectLegendWall(item){
                this.legendButton = true
                this.legendButton_id = item.id
                this.lData.key = item.name
                this.coachList = []
            },
            async goToLegendWall(){
               this.closeModal()
                this.$router.push(`/addreview/${this.legendButton_id}`)
            },
            async goToProductWall(){
                 this.closeModal()
                this.$router.push(`/product_review/${this.productButton_id}`)
               
            },
            async selectProductWall(item){
                this.productButton = true
                this.productButton_id = item.id
                this.pData.key = item.name
                this.productList = []
            },
            async goToCoachWall(item){
                 this.closeModal()
                this.$router.push(`/scoach_review/${this.schoolButton_id}`)
               
            },
            async selectCoachWall(item){
                 this.schoolButton = true
                this.schoolButton_id = item.id
                this.rData.key = item.name
                this.schoolCoachList = []
               
            },
            async logout() {
                try {
                    let { data } = await this.$axios.get("/logout");
                    this.$store.commit("updateAuthUser", false);
                    window.location = '/login'
                } catch (error) {
                    console.log(error);
                }
            },
        },

        async created(){
            // let d = new Date('2019-08-11');
            // d.setDate(d.getDate() + 60);
            // let monthNumber = d.getMonth()+1
            // monthNumber = ("0" + monthNumber).slice(-2);
            // let dayNumber = d.getDate()
            // dayNumber = ("0" + dayNumber).slice(-2);
            // let today = `${d.getFullYear()}-${monthNumber}-${dayNumber}`
            // console.log(today)

             if(this.isLoggedIn){
                 this.packType = this.authInfo.packType
                 const res = await this.callApi('get',`/app/getLegendId/${this.authInfo.id}`)
                 if(res.status===200){
                     this.legend_id = res.data.id
                 }
             } 
        }
    }
</script>

<style scoped>
.pointer_like{
    cursor: pointer;
}
.menu_dropDown_on_nav{
     display: none;
        width: 100% !important;
    left: 0 !important;
    top: 45px !important;
    z-index: 1;
    padding: 0;
}
.menu_dropDown_on{
    display: none;
        width: 100% !important;
    left: 0 !important;
    top: 32px !important;
    z-index: 1;
}
.show_logo{
    
}
.pageOption:hover .menu_dropDown_on {display: block;}
.pageOption:hover .menu_dropDown_on_nav {display: block;}

@media only screen and (max-width: 992px) {
    
    .main-nav {
        display: none;
    }

    .main-nav.right-top.pull-right {
        display: none;
    }
}
</style>

