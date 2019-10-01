
<template>
<div>
    <!-- <header>
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
                                <span @click="searchByKey()" class="input-group-btn search-btn position-top"><i class="fas fa-search"></i></span>
                            </div>
                        </div>
                   </form>
                </div>
            </div>
            <div class="header-nav">
               <div class="container">
                   <ul class="main-nav">
                       <li  ><a @click="searchByKey('coach')" ><i class="fas fa-calculator"></i>&nbsp;&nbsp;High School Coach</a></li>
                       <li><i class="fas fa-calculator"></i>&nbsp;&nbsp;Collage Coach&nbsp;<i class="fas fa-angle-down"></i>
                           <div class="nav-dropdown">
                               <ul class="pull-left">
                                   <li><a @click="searchByKey('coach','Recomended','Junior College')"><i class="fas fa-calculator"></i>&nbsp;&nbsp;Junior College</a></li>
                                   <li><a @click="searchByKey('coach','Recomended','MCLA')"><i class="fas fa-calculator"></i>&nbsp;&nbsp;MCLA</a></li>
                               </ul>
                               <ul class="pull-left">
                                   <li><a @click="searchByKey('coach','Recomended','NAIA')"><i class="fas fa-calculator"></i>&nbsp;&nbsp;NAIA</a></li>
                                   <li><a @click="searchByKey('coach','Recomended','NCAA DI')"><i class="fas fa-calculator"></i>&nbsp;&nbsp;NCAA DI</a></li>
                               </ul>
                               <ul class="pull-left">
                                   <li><a @click="searchByKey('coach','Recomended','NCAA DII')"><i class="fas fa-calculator"></i>&nbsp;&nbsp;NCAA DII</a></li>
                                   <li><a @click="searchByKey('coach','Recomended','NCAA DIII')"><i class="fas fa-calculator"></i>&nbsp;&nbsp;NCAA DIII</a></li>
                               </ul>
                           </div>
                       </li>
                       <li><a  @click="searchByKey('legend')"><i class="fas fa-calculator"></i>&nbsp;&nbsp;Local Instructors</a></li>
                       <li><a href=""><i class="fas fa-calculator"></i>&nbsp;&nbsp;More&nbsp;<i class="fas fa-angle-down"></i></a>
                           <div class="nav-dropdown">
                               <ul class="pull-left">
                                   <li><a @click="searchByKey('coach','rated')"><i class="fas fa-calculator"></i>&nbsp;&nbsp;Best Rated Coaches</a></li>
                                   <li><a @click="searchByKey('coach','Worst')"><i class="fas fa-calculator"></i>&nbsp;&nbsp;Worst Rated Coaches</a></li>
                                   <li><a @click="searchByKey('coach','most')"><i class="fas fa-calculator"></i>&nbsp;&nbsp;Most Connected</a></li>
                                   <li><a @click="searchByKey('coach')"><i class="fas fa-calculator"></i>&nbsp;&nbsp;Travel Coaches</a></li>
                                   <li><a @click="searchByKey('product','rated')"><i class="fas fa-calculator"></i>&nbsp;&nbsp;Products & Services</a></li>
                               </ul>
                               <ul class="pull-left">
                                   
                               </ul>
                               <ul class="pull-left">
                                   
                               </ul>
                           </div>
                       </li>
                   </ul>
                   <ul class="main-nav right-top pull-right">
                       <li ><a href="/review" ><i class="fas fa-pen"></i>&nbsp;Write a Review</a></li>
                      
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
        </header> -->
        <!-- <div class="new-top-nav"> 
            <div class="container-fluid">
                <div class="new-top-nav-inner">
                    <div class="new-top-nav-left">
                        <a @click="$router.push('/')" class="new-top-nav-brand"><img src="/images/new-l.png" alt=""></a>
                        <div class="mobile-button"><span><i class="fas fa-bars"></i></span></div>
                    </div>

                    <div class="new-top-navbar-left">
                        <ul class="new-nav-left-list">
                            <li><a @click="searchByKey('coach','Recomended','High School')">Hsc</a></li>
                            <li><a @click="searchByKey('coach','Recomended','Club/Travel')">Cc</a></li>
                            <li><a @click="searchByKey('coach','Recomended','NCAA DI')">NCAA DI</a></li>
                            <li><a @click="searchByKey('coach','Recomended','NCAA DII')">NCAA DII</a></li>
                            <li><a @click="searchByKey('coach','Recomended','NCAA DIII')">NCAA DIII</a></li>
                            <li><a @click="searchByKey('coach','Recomended','Junior College')">Jrc</a></li>
                            <li><a @click="searchByKey('coach','Recomended','NAIA')">NAIA</a></li>
                            <li><a @click="searchByKey('coach','Recomended','MCLA')">MCLA</a></li>
                            <li><a @click="searchByKey('coach','Recomended','FL')">flanker</a></li>
                            <li><a @click="searchByKey('coach','Recomended','MO')">MO</a></li>
                            <li><a @click="searchByKey('coach','Recomended','Junior College')"><span><i class="fas fa-ellipsis-h"></i></span></a></li>
                        </ul>
                    </div>
                    <div class="new-top-navbar-right">
                        <ul class="new-nav-right-list">
                            <li class="right-logo"><a href="#"><img src="/images/new-logo.png" alt=""></a></li>
                            <li class="right-grid-icon"><a href="#"><img src="/images/Top-Toolbar.png" alt=""></a></li>
                            <li class="right-search">
                                <a href="#">
                                    <div class="right-search-icon" >
                                        <img src="/images/toolbar-search.png" alt="">
                                    </div>
                                    <div class="right-search-input">
                                         <input type="text" v-model="searchTxt"  v-on:keyup.enter="searchByKey()" >
                                    </div>
                                </a>
                               
                            </li>
                            <li class="right-user" v-if="isLoggedIn"   >
                                <a  @click=" isMenuOpen = (isMenuOpen == false)? true: false">
                                    <img src="/images/user.png" alt="">
                                </a>
                                   <ul class="right-user-dropdown" v-if="isMenuOpen" >
                                    <li  class="yxz_ll" ><a >{{authInfo.firstName}}</a></li>
                                    <li class="yxz_ll" ><a @click="logout">Logout</a></li>
                                </ul>
                            </li>
                        </ul>
                        <div class="mobile-search-bar">
                            <div >
                                <div class="mobile-search-input">
                                    <input type="text" v-model="searchTxt"  v-on:keyup.enter="searchByKey" >
                                </div>

                                <div class="mobile-search-icon">
                                    <span @click="searchByKey"><i class="fas fa-search"></i></span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div> -->
        <div class="new-flank-nav">
            <div class="new-flank-nav-con">
                <div class="flank-new-brand">
                    <a @click="$router.push('/')"><img src="/images/logo-new.png" alt=""></a>
                </div>
                <div class="flank-new-form">
                    <form v-on:submit.prevent>
                        <div class="flank-new-indi">
                            <div class="new-flank-selection">
                                <p  @click="isStringMenu = (isStringMenu)? false : true" style="cursor:pointer;" > {{(pageOption)? pageOption: 'All'}} <span><i class="fas fa-caret-down"></i></span></p>
                                <div class="new-flank-selection-dropdown" v-if="isStringMenu"  >
                                    <ul>
                                        <li><a @click="pageOptionDropChange('school')">School</a></li>
                                        <li><a @click="pageOptionDropChange('coach')">Coach</a></li>
                                        <li><a @click="pageOptionDropChange('legend')">Legend</a></li>
                                        <li><a @click="pageOptionDropChange('product')">Products</a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="new-flank-input">
                                <input type="text" v-model="tStr" @enter="SearchByKey" >
                            </div>
                        </div>
                        <div class="flank-new-indi" v-if=" pageOption != 'product' "  >
                            <div class="new-flank-selection">
                                <p>City</p>
                            </div>
                            <div class="new-flank-input" >
                                <input type="text" v-model="tPlace" v-on:keyup="searchPlace" @enter="SearchByKey"  > 
                                <div class="new-flank-indi-dropdown" v-if="allPlaces.length>0 && tPlace != ''" >
                                    <ul class="ssrolable" >
                                        <li v-for="(item,index) in allPlaces" :key="index" >
                                            <a @click="letChangePlace(item)">{{item.name}}</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="flank-new-search">
                            <button @click="SearchByKey" ><span><i class="fas fa-search"></i></span></button>
                        </div>
                    </form>
                </div>
                <div class="flank-new-autho" v-if="!isLoggedIn" >
                    <div class="autho-in">
                        <button @click="$router.push('/login')">Log in</button>
                    </div>
                    <div class="autho-up">
                        <button @click="$router.push('/signup')">Sign Up</button>
                    </div>
                </div>
                <div class="flank-new-autho" v-else>
                    <div class="autho-in">
                        <button @click="logout" >Logout</button>
                    </div>
                    
                </div>
            </div>
        </div>

        <nav class="new-flank-header-nav">
            <div class="container">
                <div class="header-nav-indi">
                    <ul class="header-nav-indi-left">
                        <li class="active"><a @click="SearchByKeyV2('coach','High School')"><img src="/images/new-ic-1.png" alt="">HS Coaches<span><i class="fas fa-chevron-down"></i></span></a></li>
                        <li><a @click="SearchByKeyV2('coach','Junior College')"><img src="/images/new-ic-2.png" alt="">CC Coaches<span><i class="fas fa-chevron-down"></i></span></a></li>
                        <li><a @click="SearchByKeyV2('coach','Club/Travel')"><img src="/images/new-ic-3.png" alt="">Local Coaches<span><i class="fas fa-chevron-down"></i></span></a></li>
                        <li><a @click="SearchByKeyV2('coach')">More<span><i class="fas fa-chevron-down"></i></span></a></li>
                    </ul>
                    <ul class="header-nav-indi-right">
                        <li class="active"><a @click="$route.push('/write_review')"><img src="/images/new-ic-4.png" alt="">Write a Review<span><i class="fas fa-chevron-down"></i></span></a></li>
                        <li><a href=""><img src="/images/new-ic-5.png" alt="">For Business<span><i class="fas fa-chevron-down"></i></span></a></li>
                    </ul>
                </div>
            </div>
        </nav>    
    </div>
</template>

<script>
    export default { 
        data(){
            return{
                isStringMenu:false,
                tStr:'',
                tPlace:'',
                allPlaces:[],


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
               
                sort:'',
                div:'',
                isMenuOpen:false,
                
            }
        },
        methods:{
            menuChange(){
              
            },
            letChangePlace(item){
                this.tPlace = item.name
                this.$store.commit('setPlace', item.name )
                this.allPlaces = []
                this.SearchByKey();
            },
            async searchPlace(){
                this.$store.commit('setPlace', this.tPlace )
                const res = await this.callApi('get', `/app/searchPlace?place=${this.place}`)
                if(res.status === 200){
                this.allPlaces = res.data
                }
                else{
                    this.swr();
                    this.isLoading = false
                }
            },
             pageOptionDropChange(item){
                this.$store.commit('setPageOptino', item )
                this.isStringMenu = false
                this.SearchByKey()
            
            }, 
            async SearchByKey(){
                if(this.pageOption != 'product'){
                    if(this.tStr == '' ) return this.i("Please Write a name")
                    if(this.place == '') return this.i("Please Write a City")
                    this.$router.push('/coach_search')
                }

                const res = await this.callApi('get', `/app/SearchData?place=${this.place}&str=${this.tStr}&pageOption=${this.pageOption}`)
                if(res.status === 200){
                    
                    this.$store.commit('setSearchData', res.data.mainData.data)
                    delete res.data.mainData.data
                    this.$store.commit('setPagination', res.data.mainData )
                    this.$store.commit('setSimilar', res.data.similarData )
                    this.$store.commit('setStr', this.tStr )
                    this.$router.push('/coach_search')
                    
                }
                else{
                    this.swr();
                   
                }
            },
            async SearchByKeyV2(page = 'coach',div = ''){
               
                
                const res = await this.callApi('get', `/app/SearchData?place=${this.place}&str=${this.tStr}&pageOption=${page}&div=${div}`)
                if(res.status === 200){
                    
                    this.$store.commit('setSearchData', res.data.mainData.data)
                    delete res.data.mainData.data
                    this.$store.commit('setPagination', res.data.mainData )
                    this.$store.commit('setSimilar', res.data.similarData )
                    this.$store.commit('setStr', this.tStr )
                    this.$router.push('/coach_search')
                    
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

            //  if(this.isLoggedIn){
            //      this.packType = this.authInfo.packType
            //      const res = await this.callApi('get',`/app/getLegendId/${this.authInfo.id}`)
            //      if(res.status===200){
            //          this.legend_id = res.data.id
            //      }
            //  } 
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
.yxz_ll{
    margin-left: 5px;
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

