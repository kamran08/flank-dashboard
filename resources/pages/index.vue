<template>
 <div>
        
        <header id="main-header" class="mainHeader">
            <div class="opacity"></div>
            <nav class="navbar">
               <div class="container">
                   <ul class="navbar-nav nav">
                       <!-- <li><a href="review.html">Write a Review</a></li> -->
                   </ul>

                   <ul class="pull-right navbar-nav nav" v-if="!isLoggedIn" >
                       <li><nuxt-link class="nav-link" to="/login" >Log In</nuxt-link>
                       <li class="border-nav"><nuxt-link class="nav-link" to="/register" >Sign Up</nuxt-link></li>
                   </ul>
               </div>
           </nav>
           
           <div class="container">
               <div class="header-content">
                   <div class="contentInCenter">
                       <div class="text-center landing-page-logo">
                           <a @click="$router.push('/')"><img src="/image/default.png" alt="page_logo"></a>

                           <form action="#">
                                <div class="equal-div">
                                    <div class="input-group" onclick="toggle_visibility('menu');">
                                        <span class="input-group-addon" id="basic-addon1">Find</span>
                                        <input type="text" class="form-control"  v-model="searchTxt" placeholder="Search any Attributes" aria-describedby="basic-addon1">
                                    </div>
                                    <div class="input-group pageOption">
                                       <span class="input-group-addon position-top" id="basic-addon1">Coach</span>
                                        <input type="text" class="form-control" v-model='pageOption' placeholder="Different type of Sport Coaches" >
                                        <span @click="$router.push(`/search_result?place=${addressTxt}&str=${searchTxt}&pageOption=${pageOption}`)" class="input-group-btn search-btn position-top"><i class="fas fa-search"></i></span>
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
                                </div>
                           </form>
                           <div class="homepage-category">
                               <ul>
                                   <li><i class="fas fa-calculator"></i><a @click="$router.push(`/search_result?pageOption=coach`)">High school coaches</a></li>
                                   <li><i class="fas fa-utensils"></i><a @click="$router.push(`/search_result?pageOption=school`)">College coaches</a></li>
                                   <li><i class="fas fa-tools"></i><a @click="$router.push(`/search_result?pageOption=legend`)">Travel team coaches</a></li>
                                   <li><i class="fas fa-truck"></i><a @click="$router.push(`/search_result?pageOption=product`)">Products & services</a></li>
                               </ul>
                           </div>
                       </div>
                   </div>
               </div>
           </div>
        </header>
        
        <section class="lp bg second-section padding-top-bottom-bg">
            <div class="container">
                <div class="text-center">
                    <h2>Flank <span>360</span></h2>
                </div>
                <div class="section-content">
                    <div class="row">
                        <div class="col-md-3 col-sm-3">
                            <div class="business-category" @click="$router.push(`/search_result?sort=rated`)">
                                <figure>
                                    <img src="/image/two.jpeg" alt="find_business_category_image">
                                </figure>
                                <figcaption><a >Best Rated Coaches</a></figcaption>
                            </div>  
                        </div>
                        <div class="col-md-3 col-sm-3">
                            <div class="business-category" @click="$router.push(`/search_result?sort=Worst`)">
                                <figure>
                                    <img src="/image/one.jpeg" alt="find_business_category_image">
                                </figure>
                                <figcaption><a >Worst Rated Coachess</a></figcaption>
                            </div>  
                        </div>
                        <div class="col-md-3 col-sm-3">
                            <div class="business-category" @click="$router.push(`/search_result?sort=most`)">
                                <figure>
                                    <img src="/image/four.jpeg" alt="find_business_category_image">
                                </figure>
                                <figcaption><a >Most Connected </a></figcaption>
                            </div>  
                        </div>
                        <div class="col-md-3 col-sm-3">
                            <div class="business-category" @click="$router.push(`/search_result`)">
                                <figure>
                                    <img src="/image/three.jpeg" alt="find_business_category_image">
                                </figure>
                                <figcaption><a >Local Instruction </a></figcaption>
                            </div>  
                        </div>
                    </div>
                </div>
            </div>
        </section>
        
        <section class="lp comm">
            <div class="container">
                <div class="media bg">
                    <div class="media-left">
                        <img class="media-object" src="/image/coffee shop stars _Converted_.png" alt="">
                    </div>
                    <div class="media-body">
                        <h4 class="media-heading">Flank the Community</h4>
                        <p>Find Flank reviews helpful? Start helping others by sharing your experiences</p>
                        <button><a href="review.html">start your first review</a></button>
                    </div>
                </div>
            </div>
        </section>
       
       <section class="lp third-section section-margin">
           <div class="container">
               <div class="text-center">
                   <h2>Flank Los Angeles</h2>
               </div>
               <div class="section-content">
                   <div class="cityName">
                       <ul>
                           <li><a href="">San Francisco</a></li>
                           <li><a href="">New York</a></li>
                           <li><a href="">Chicago</a></li>
                           <li><a href="">Palo Alto</a></li>
                           <li><a href="">Texas</a></li>
                           <li><a href=""><i class="fas fa-search"></i>&nbsp;More Cities</a></li>
                       </ul>
                       <hr>
                   </div>
                   <div class="review-coach">
                      <div class="text-center">
                          <h3>Hot & Cold Coaches</h3>
                      </div>
                       <div class="row" v-if="schoolCoaches.length" >
                           <div class="col-md-4 col-sm-4" v-for="(item,index) in schoolCoaches" :key="index"  >
                               <div class="review-photo">
                                   <figure>
                                       <img :src="item.school.logo" alt="">
                                   </figure>
                                   <figcaption class="figcap-border">
                                       <h4 @click="$router.push(`/school/${item.school_id}`)" ><strong><a >{{item.name}}</a></strong></h4>
                                        <p>
                                            <span :class="(item.average_rating>0)? ' rating-bg' : ''" ><i class="fas fa-star"></i></span>
                                            <span :class="(item.average_rating>0)? ' rating-bg' : ''" ><i class="fas fa-star"></i></span>
                                            <span :class="(item.average_rating>0)? ' rating-bg' : ''" ><i class="fas fa-star"></i></span>
                                            <span :class="(item.average_rating>0)? ' rating-bg' : ''" ><i class="fas fa-star"></i></span>
                                            <span :class="(item.average_rating>0)? ' rating-bg' : ''"  ><i class="fas fa-star"></i></span>
                                            &nbsp;{{item.__meta__.allreview_count}} reviews
                                        </p>
                                        <p>
                                            {{item.school.schoolName}} , <template>{{item.school.city}}</template> <template>,{{item.school.state}}</template>
                                        </p>
                                        <p class="fire"><i class="fas fa-fire"></i>&nbsp;Submitted 4 weeks ago</p>
                                   </figcaption>
                               </div>
                           </div>
                           
                       </div>
                   </div>
                   <div class="text-center">
                       <p class="moreD"><a href="">See more hot & cold coaches</a></p>
                   </div>
                   <div class="row">
                       <div class="col-md-8 col-sm-6">
                           <div class="explore-item">
                               <h3 class="text-center">The Local Flank</h3>
                               <figure>
                                   <a href="local_flank.html"><img src="/image/h.jpg" alt=""></a>
                               </figure>
                               <figcaption class="figcap-border">
                                   <h4><strong><a href="">It’s Wednesday, do you need a cocktail?&nbsp;<i class="fas fa-trophy"></i></a></strong></h4>
                                   <p>Up, fizzy, on the rocks––no matter how you like ‘em, cocktails take the edge off and sure do taste good going down. We’ve put together a list of local libations that will have you calling for another ...</p>
                                   <p class="bltitle">The Local Flank</p>
                               </figcaption>
                               
                           </div>
                           <div class="text-center">
                               <p class="moreD"><a href="">See more</a></p>
                           </div>
                       </div>
                       <div class="col-md-4 col-sm-6">
                           <div class="explore-item">
                               <h3 class="text-center">Product spotlight</h3>
                               <figure>
                                <a href="local_flank.html"><img src="/image/300s.jpg" alt=""></a>
                               </figure>
                               <figcaption class="figcap-border">
                                   <h4><a href="">UYE: Let it Awash all over you!!!</a></h4>
                                   <p>Saturday, March 9 @ 1pm is happening! Our generous hosts @ Awash BK have ...</p>
                                   <p>Sat, Mar 9, 1:00 pm</p>
                               </figcaption>
                           </div>
                           <div class="text-center">
                               <p class="moreD"><a href="">See all events</a></p>
                           </div>
                       </div>
                   </div>
                   <!-- Review of the day -->
                   <div class="reviewDay">
                       <div class="row">
                           <div class="col-md-offset-2 col-sm-offset-2 col-md-8 col-sm-6">
                              <div class="text-center">
                                  <h3 class="text-center">Review of the Day</h3>
                              </div>
                               <div class="figcap-border" v-if="review_of_day.info && loading == false" >
                                   <div class="media">
                                        <div class="media-left">
                                             <img class="profile_picU" :src="review_of_day.bestReview.reviwer.img" alt="">
                                        </div>
                                        <div class="media-body">
                                            <strong><a @click="$router.push(`/flanker/${review_of_day.bestReview.reviwer.id}`)">{{review_of_day.bestReview.reviwer.firstName}} {{review_of_day.bestReview.reviwer.lastName}} </a></strong><p></p>
                                            <p>
                                                <span><i class="fas fa-star"></i>&nbsp;{{review_of_day.bestReview.reviwer.__meta__.totalreviewbyuser}}</span>
                                                <!-- <span><i class="fas fa-male"></i>&nbsp;1304</span> -->
                                                <!-- <span><a href="">Elite ’19</a></span> -->
                                            </p>
                                        </div>
                                    </div>
                                    <div class="badge-banner">
                                       Wrote a review for <strong><a @click="goToProfilePage()">{{review_of_day.bestReview.reviewforInfo.name}}</a></strong>
                                        <img src="/image/40x40_rotd.png" alt="">
                                    </div>
                                    <div class="badge-review">
                                        <p>
                                            <span :class="(review_of_day.bestReview.rating>0)? 'high rating-bg' : ''" ><i class="fas fa-star"></i></span>
                                            <span :class="(review_of_day.bestReview.rating>1)? 'high rating-bg' : ''"><i class="fas fa-star"></i></span>
                                            <span :class="(review_of_day.bestReview.rating>2)? 'high rating-bg' : ''"><i class="fas fa-star"></i></span>
                                            <span :class="(review_of_day.bestReview.rating>3)? 'high rating-bg' : ''"><i class="fas fa-star"></i></span>
                                            <span :class="(review_of_day.bestReview.rating>4)? 'high rating-bg' : ''"><i class="fas fa-star"></i></span>
                                            &nbsp;{{review_of_day.bestReview.created_at}}
                                        </p>
                                    </div>
                                    <div class="review-text">
                                        {{review_of_day.bestReview.content}}
                                    </div>
                               </div>
                               <div v-else-if="loading == true" ><h3 class="text-center">Content Loading....</h3></div>
                               <div v-else  ><h3 class="text-center">No Content.....</h3></div>
                               <!-- <div class="text-center">
                                   <p class="moreD"><a href="">Read previous reviews</a></p>
                               </div> -->
                           </div>
                       </div>
                   </div>
               </div>
           </div>
       </section>
       
       <section class="lp fourth-section section-margin">
           <div class="container">
               <div class="text-center">
                   <h2>Recent Activity</h2>
               </div>
               <div class="section-content"  v-if="recentReview.length>0  && loading == false" >
                   <div class="row">
                       <div class="col-md-4 col-sm-4" v-for="(item,index) in recentReview " :key="index" >
                           <div class="activity-individual">
                               <div class="media">
                                   <div class="media-left">
                                     <img class="profile_picU" :src="item.reviwer.img" alt="">
                                   </div>
                                   <div class="media-body">
                                      <strong><a href="">{{item.reviwer.firstName}} {{item.reviwer.lastName}} </a></strong>
                                      <p><span><i class="fas fa-star"></i>&nbsp;{{item.reviwer.__meta__.totalreviewbyuser}}</span></p>
                                       <small>Wrote a Review</small>
                                   </div>
                               </div>
                               <figcaption>
                                   <p><strong><a href="">Katsu-Hama</a></strong></p>
                                   <hr>
                                   <div class="activity-review">
                                        <p>
                                            <span :class="(item.rating>0)? 'high rating-bg' : ''"><i class="fas fa-star"></i></span>
                                            <span :class="(item.rating>1)? 'high rating-bg' : ''"><i class="fas fa-star"></i></span>
                                            <span :class="(item.rating>2)? 'high rating-bg' : ''"><i class="fas fa-star"></i></span>
                                            <span :class="(item.rating>3)? 'high rating-bg' : ''"><i class="fas fa-star"></i></span>
                                            <span :class="(item.rating>4)? 'high rating-bg' : ''"><i class="fas fa-star"></i></span>
                                            &nbsp;<small>{{item.created_at}}</small>
                                        </p>
                                   </div>
                                   <p>{{item.content}}
                                   </p>
                                   <hr>
                                   <div class="emoicon">
                                       <p class="pull-left">
                                           <span><i class="far fa-grin-beam"></i><small>&nbsp;Cool&nbsp;&nbsp;{{item.imos.cool}}</small></span>
                                           <span><i class="far fa-grin-beam"></i><small>&nbsp;Funny&nbsp;&nbsp;{{item.imos.funny}}</small></span>
                                           <span><i class="far fa-grin-beam"></i><small>&nbsp;Useful&nbsp;&nbsp;{{item.imos.useful}}</small></span></p>
                                       <p class="pull-right"><span><a href=""><i class="far fa-grin-beam"></i></a><small>Useful</small></span></p>
                                   </div>
                               </figcaption>
                           </div>
                       </div>
                       
                   </div>
                   <hr>
                   <!-- <div class="text-center">
                       <p class="moreD"><a href=""><i class="fas fa-angle-down"></i>&nbsp;Show more work in New York</a></p>
                   </div> -->
               </div>
               <div v-else-if="loading == true" ><h3 class="text-center">Content Loading....</h3></div>
                <div v-else  ><h3 class="text-center">No Content.....</h3></div>
           </div>
       </section>
       <section class="padding-top-bottom-bg bg lp fifth-section section-margin">
           <div class="container">
               <div class="text-center">
                   <h2>Browse Coaches by Category</h2>
               </div>
               <div class="section-content">
                   <div class="row">
                       <div class="col-md-3 col-sm-3">
                           <div class="browse-category-individual text-center" @click="$router.push(`/search_result?pageOption=coach`)">
                               <figure>
                                   <img src="/image/72x72_restaurants.png" alt="">
                               </figure>
                               <figcaption><strong>High School Coaches</strong></figcaption>
                           </div>
                           <div class="browse-category-individual text-center" @click="$router.push(`/search_result?pageOption=product`)">
                               <figure>
                                   <img src="/image/72x72_restaurants.png" alt="">
                               </figure>
                               <figcaption><strong>Products & Services</strong></figcaption>
                           </div>
                       </div>
                       <div class="col-md-3 col-sm-3">
                           <div class="browse-category-individual text-center" @click="$router.push(`/search_result`)">
                               <figure>
                                   <img src="/image/72x72_restaurants.png" alt="">
                               </figure>
                               <figcaption><strong>College Coaches</strong></figcaption>
                           </div>
                           <div class="browse-category-individual text-center" @click="$router.push(`/search_result?sort=rated`)">
                               <figure>
                                   <img src="/image/72x72_restaurants.png" alt="">
                               </figure>
                               <figcaption><strong>Best Rated Instructions</strong></figcaption>
                           </div>
                       </div>
                       <div class="col-md-3 col-sm-3">
                           <div class="browse-category-individual text-center" @click="$router.push(`/search_result?pageOption=coach`)">
                               <figure>
                                   <img src="/image/72x72_restaurants.png" alt="">
                               </figure>
                               <figcaption><strong>Travel Coaches</strong></figcaption>
                           </div>
                           <div class="browse-category-individual text-center" @click="$router.push(`/search_result?sort=Worst`)">
                               <figure>
                                   <img src="/image/72x72_restaurants.png" alt="">
                               </figure>
                               <figcaption><strong>Worst Rated Instructions</strong></figcaption>
                           </div>
                       </div>
                       <div class="col-md-3 col-sm-3">
                           <div class="browse-category-individual text-center" @click="$router.push(`/search_result`)">
                               <figure>
                                   <img src="/image/72x72_restaurants.png" alt="">
                               </figure>
                               <figcaption><strong>Local Instruction</strong></figcaption>
                           </div>
                           <div class="browse-category-individual text-center" @click="$router.push(`/search_result?sort=most`)">
                               <figure>
                                   <img src="/image/72x72_restaurants.png" alt="">
                               </figure>
                               <figcaption><strong>Most Connected</strong></figcaption>
                           </div>
                       </div>
                   </div>
               </div>
           </div>
       </section>
       
    </div>
</template>
<script>
export default {
  data(){
    return{
      name:'',
      searchTxt:'',
      pageOption:'',
      addressTxt:'',
      openSearchDrop:false,
      schoolCoaches:[],
      recentReview:[],
      review_of_day:{},
      loading:true,
    }
  },
   async asyncData({app, store,redirect, params}){
        try {
            let {data} = await app.$axios.get(`/legends`)
          
            return{
                legendList : data
            }
		}catch (error) {
            //return redirect('/404')
		}
   },
  methods:{
    async SearchData(){

    },
    goToProfilePage(){
        if(this.review_of_day.info.model == 'legend' ){
            this.$router.push(`/profile/${this.review_of_day.bestReview.reviewFor}`)
            
        }
        else if (this.review_of_day.info.model == 'coach' ){
            this.$router.push(`/school/${this.review_of_day.bestReview.school_id}`)
        }
        else if (this.review_of_day.info.model == 'product' ){
            this.$router.push(`/product/${this.review_of_day.bestReview.product_id}`)
        }
    }
  },
  async created(){
      
          const [res1,res2,res3] = await Promise.all([
            this.callApi('get', `/app/getSchoolcoaches`),  
            this.callApi('get', `/app/reviewOfTheDay`),  
            this.callApi('get', `/app/getRecentReview`),  
        ])
        if(res1.status===200 && res2.status ==200){
            this.schoolCoaches = res1.data
            this.review_of_day = res2.data
            this.recentReview = res3.data
           // this.review_of_day.bestReview = res2.data.bestReview
            this.loading = false
            
        } else{
            this.swr()
             this.loading = false
        }
  }
}
</script>
<style>
.profile_picU{
    width: 40px;
    
}

.pageOption:hover .menu_dropDown_on {
    display: block;
}
</style>
