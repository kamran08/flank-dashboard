
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
            </div> -->
            
            <Modal
                v-model="reviewModal"
                title="Riview Modal"
                width='500'
                >
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <p class=" msg_box_header">Write Review For?</p>
                            <div class="review-button">
                                <div class="btn-role"  @click="rData.for=1"  ><Button :class="(rData.for == 1)? 'act-btn': ''" >School</Button></div>
                                <div class="btn-role"  @click="rData.for=2"  ><Button :class="(rData.for == 2)? 'act-btn': ''" >Local Legend</Button></div>
                                <div class="btn-role"  @click="rData.for=3"  ><Button :class="(rData.for == 3)? 'act-btn': ''" >Product</Button></div>
                            </div>
                            <template v-if="rData.for == 2" >
                                <Input v-model="rData.key" placeholder="Enter Coach Name ..." style="width: 100%; padding: 15px; background: #F2F2F2;margin-top: 15px;" @on-keyup="SearchByKeyCoach" />
                                <div v-if="coachList.length>0" style="border: 1px solid #0088cc;">
                                    <p  class="pointer_like" v-for="(item,index) in coachList" :key="index" @click="goToLegendWall(item)" >{{item.name}}</p>
                               
                                </div>
                            </template>
                            <template v-if="rData.for ==3" >
                                <Input v-model="rData.key" placeholder="Enter Product" style="width: 100%; padding: 15px; background: #F2F2F2;margin-top: 15px;" @on-keyup="SearchByKeyProduct" />
                                <div v-if="productList.length>0" style="border: 1px solid #0088cc;">
                                    <p  class="pointer_like" v-for="(item,index) in productList" :key="index" @click="goToProductWall(item)" >{{item.name}}</p>
                               
                                </div>
                            </template>
                            <template v-else-if="rData.for==1" >
                                <Input v-model="rData.school" placeholder="Enter School Name ..." style="width: 100%; padding: 15px; background: #F2F2F2;margin-top: 15px;" @on-keyup="SearchByKeySchool" />
                                <div v-if="schoolList.length>0" style="border: 1px solid #0088cc;">
                                    <p  class="pointer_like" v-for="(item,index) in schoolList" :key="index" @click="manageSchoolData(item)" >{{item.name}} | {{item.sport}}  </p>
                                </div>
                                
                                <template v-if="sData.school_id !=0" >
                                    <hr>
                                    <Input v-model="rData.key" placeholder="Enter School Coach Name ..." style="width: 100%; padding: 15px; background: #F2F2F2;margin-top: 15px;"  @on-keyup="SearchByKeySchoolCoach" />
                                    <div v-if="schoolCoachList.length>0 && sData.school !='' " style="border: 1px solid #0088cc;">
                                        <p  class="pointer_like" v-for="(item,index) in schoolCoachList" :key="index" @click="goToCoachWall(item)" >{{item.name}}</p>
                                    </div>
                                    <Button v-else @click="CreateNewCoach" style="margin-top: 10px;" >Create a Coach</Button>
                                </template>
                            </template>
                        </div>
                    </div>
                </div>
                <div slot="footer">
                    <Button @click="reviewModal = false">Close</Button> 
                    <Button type="success">Send</Button>
                </div>
            </Modal>
       </nav>
               <header>
            <div class="header-second"> 
                <div class="container">
                    <a @click="$router.push(`/`)" class="navbar-brand"><img class="img-responsive" src="/image/default.png" alt=""></a>
                    <form action="#">
                        <div class="equal-div">
                            <div class="input-group">
                                <span class="input-group-addon" id="basic-addon1">Find</span>
                                <input type="text" class="form-control"  v-model="searchTxt" placeholder="Different type of Sport Coaches" aria-describedby="basic-addon1">
                            </div>
                            <div class="input-group pageOption">
                               <span class="input-group-addon position-top" id="basic-addon1">Coach</span>
                                <input type="text" class="form-control" v-model='pageOption' placeholder="Different type of Sport Coaches" >
                                <span @click="$router.push(`/search_result?place=${addressTxt}&str=${searchTxt}&pageOption=${pageOption}`)" class="input-group-btn search-btn position-top"><i class="fas fa-search"></i></span>
                                <div class="right-dropdown menu_dropDown_on_nav">
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
                       <li  ><a @click="$router.push(`/search_result?pageOption=coach`)" ><i class="fas fa-calculator"></i>&nbsp;&nbsp;High School Coach</a></li>
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
                       <li><a  @click="$router.push(`/search_result`)"><i class="fas fa-calculator"></i>&nbsp;&nbsp;Local Instructors</a></li>
                       <li><a href=""><i class="fas fa-calculator"></i>&nbsp;&nbsp;More&nbsp;<i class="fas fa-angle-down"></i></a>
                           <div class="nav-dropdown">
                               <ul class="pull-left">
                                   <li><a @click="$router.push(`/search_result?sort=rated`)"><i class="fas fa-calculator"></i>&nbsp;&nbsp;Best Rated Coaches</a></li>
                                   <li><a @click="$router.push(`/search_result?sort=Worst`)"><i class="fas fa-calculator"></i>&nbsp;&nbsp;Worst Rated Coaches</a></li>
                                   <li><a @click="$router.push(`/search_result?sort=most`)"><i class="fas fa-calculator"></i>&nbsp;&nbsp;Most Connected</a></li>
                                   <li><a @click="$router.push(`/search_result`)"><i class="fas fa-calculator"></i>&nbsp;&nbsp;Travel Coaches</a></li>
                                   <li><a @click="$router.push(`/search_result?pageOption=product`)"><i class="fas fa-calculator"></i>&nbsp;&nbsp;Products & Services</a></li>
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
                        <li v-if="isLoggedIn && packType !=2 " @click="$router.push(`/flanker/${authInfo.id}`)" ><a >Profile</a></li>
                        <li v-if="isLoggedIn && packType == 2 " @click="$router.push(`/profile/${legend_id}`)" ><a >Profile</a></li>
                        <li v-if="isLoggedIn" @click="logout" ><a >Log Out</a></li>
                   </ul>
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
                coachList:[],
                schoolList:[],
                schoolCoachList:[],
                productList:[],
                sData:{
                    school_id:0,
                },
                iamIndex:false,
                searchTxt:'',
                addressTxt:'',
                pageOption:'',
                
            }
        },
        computed:{
           
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
                    name:this.sData.school
                }
                const res = await this.callApi('post','/app/storeSchoolCoache',tempCoach)
                if(res.status == 200){
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
               const res = await this.callApi('get',`/app/SearchByKeySchoolCoach?key=${this.rData.key}&school_id=${this.sData.school_id}`) 
               if(res.status=== 200){
                   this.schoolCoachList = res.data
               }
               else{
                   this.swr()
               }
            },
            async SearchByKeyCoach(){
               const res = await this.callApi('get',`/app/SearchByKeyCoach?key=${this.rData.key}`)
               if(res.status=== 200){
                   this.coachList = res.data
               }
               else{
                   this.swr()
               }
            },
            async SearchByKeyProduct(){
               const res = await this.callApi('get',`/app/SearchByKeyProduct?key=${this.rData.key}`)
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
            async goToLegendWall(item){
                 this.reviewModal = false
                this.$router.push(`/addreview/${item.id}`)
               
            },
            async goToProductWall(item){
                 this.reviewModal = false
                this.$router.push(`/product_review/${item.id}`)
               
            },
            async goToCoachWall(item){
                 this.reviewModal = false
                this.$router.push(`/scoach_review/${item.id}`)
               
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
    top: 45px !important;
    z-index: 1;
}
.pageOption:hover .menu_dropDown_on {display: block;}
.pageOption:hover .menu_dropDown_on_nav {display: block;}
</style>

