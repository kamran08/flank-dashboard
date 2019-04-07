<template>
 <div>
        
        <!-- Header-->

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
        
        <header id="main-header" class="mainHeader">
            <div class="opacity"></div>
            <nav class="navbar">
               <div class="container">
                   <ul class="navbar-nav nav">
                       <li><a href="review.html">Write a Review</a></li>
                   </ul>

                   <ul class="pull-right navbar-nav nav">
                       <li><nuxt-link class="nav-link" to="/login" >Log In</nuxt-link>
                       <li class="border-nav"><nuxt-link class="nav-link" to="/register" >Sign Up</nuxt-link></li>
                   </ul>
               </div>
           </nav>
           
           <div class="container">
               <div class="header-content">
                   <div class="contentInCenter">
                       <div class="text-center landing-page-logo">
                           <a href="index.html"><img src="/image/default.png" alt="page_logo"></a>

                           <form action="#">
                                <div class="equal-div">
                                    <div class="input-group" onclick="toggle_visibility('menu');">
                                        <span class="input-group-addon" id="basic-addon1">Find</span>
                                        <input type="text" class="form-control" placeholder="accountants, burgers, spas, barbers..." aria-describedby="basic-addon1">
                                    </div>
                                    <div class="input-group">
                                       <span class="input-group-addon position-top" id="basic-addon1">Near</span>
                                        <input type="text" class="form-control" placeholder="address, neighborhood, zip or state" value="San Francisco, CA">
                                        <span class="input-group-btn search-btn position-top"><i class="fas fa-search"></i></span>
                                    </div>
                                    <div class="left-dropdown">
                                        <ul>
                                            <li><a href=""><i class="fas fa-utensils"></i>Restaurents</a></li>
                                            <li><a href=""><i class="fas fa-utensils"></i>Restaurents</a></li>
                                            <li><a href=""><i class="fas fa-utensils"></i>Restaurents</a></li>
                                            <li><a href=""><i class="fas fa-utensils"></i>Restaurents</a></li>
                                            <li><a href=""><i class="fas fa-utensils"></i>Restaurents</a></li>
                                            <li><a href=""><i class="fas fa-utensils"></i>Restaurents</a></li>
                                        </ul>
                                    </div>
                                    <div class="right-dropdown">
                                        <ul>
                                            <li><a href=""><i class="fas fa-location-arrow"></i>Current Locations</a></li>
                                            <li style=""><a href="" style="">San Francisco, CA</a></li>
                                        </ul>
                                    </div>
                                </div>
                           </form>
                           <div class="homepage-category">
                               <ul>
                                   <li><i class="fas fa-calculator"></i><a href="">High school coaches</a></li>
                                   <li><i class="fas fa-utensils"></i><a href="">College coaches</a></li>
                                   <li><i class="fas fa-tools"></i><a href="">Travel team coaches</a>&nbsp;<i class="position-top fas fa-sort-down"></i>
                                       <ul class="homepage-sub-category">
                                           <li><a href="">Air Conditioning & Heating</a></li>
                                           <li><a href="">Air Conditioning & Heating</a></li>
                                       </ul>
                                   </li>
                                   <li><i class="fas fa-truck"></i><a href="">Products & services</a></li>
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
                            <div class="business-category">
                                <figure>
                                    <img src="/image/two.jpeg" alt="find_business_category_image">
                                </figure>
                                <figcaption><a href="">Best Rated Coaches</a></figcaption>
                            </div>  
                        </div>
                        <div class="col-md-3 col-sm-3">
                            <div class="business-category">
                                <figure>
                                    <img src="/image/one.jpeg" alt="find_business_category_image">
                                </figure>
                                <figcaption><a href="">College Coaches</a></figcaption>
                            </div>  
                        </div>
                        <div class="col-md-3 col-sm-3">
                            <div class="business-category">
                                <figure>
                                    <img src="/image/four.jpeg" alt="find_business_category_image">
                                </figure>
                                <figcaption><a href="">Travel Ball Coaches</a></figcaption>
                            </div>  
                        </div>
                        <div class="col-md-3 col-sm-3">
                            <div class="business-category">
                                <figure>
                                    <img src="/image/three.jpeg" alt="find_business_category_image">
                                </figure>
                                <figcaption><a href="">Products & Services</a></figcaption>
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
                          <h3>Good & Bad Coaches</h3>
                      </div>
                       <div class="row" v-if="legendList.length" >
                           <div class="col-md-4 col-sm-4" v-for="(item,index) in legendList" :key="index"  >
                               <div class="review-photo">
                                   <figure>
                                       <img :src="item.img" alt="">
                                   </figure>
                                   <figcaption class="figcap-border">
                                       <h4 @click="$router.push(`/profile/${item.id}`)" ><strong><a >{{item.name}}</a></strong></h4>
                                        <p><span class="rating-bg"><i class="fas fa-star"></i></span><span class="rating-bg"><i class="fas fa-star"></i></span><span class="rating-bg"><i class="fas fa-star"></i></span><span class="rating-bg"><i class="fas fa-star"></i></span><span><i class="fas fa-star"></i></span>&nbsp;16 reviews</p>
                                        <p>Japanese, Noodles, Tapas/Small Plates Williamsburg - North Side</p>
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
                   <div class="reviewDay">
                       <div class="row">
                           <div class="col-md-offset-2 col-sm-offset-2 col-md-8 col-sm-6">
                              <div class="text-center">
                                  <h3 class="text-center">Review of the Day</h3>
                              </div>
                               <div class="figcap-border">
                                   <div class="media">
                                        <div class="media-left">
                                            <img class="media-object" src="/image/80.png" alt="">
                                        </div>
                                        <div class="media-body">
                                            <p><a href="">Franny A.</a></p>
                                            <p><span><i class="fas fa-male"></i>&nbsp;856</span><span><i class="fas fa-male"></i>&nbsp;1304</span><span><a href="">Elite ’19</a></span></p>
                                            <p>Wrote a review for <strong><a href="">FLÉ-FLÉ Grill</a></strong></p>
                                        </div>
                                    </div>
                                    <div class="badge-banner">
                                        Review of the Day
                                        <img src="/image/40x40_rotd.png" alt="">
                                    </div>
                                    <div class="badge-review">
                                        <p><span class="high rating-bg"><i class="fas fa-star"></i></span><span class="high rating-bg"><i class="fas fa-star"></i></span><span class="high rating-bg"><i class="fas fa-star"></i></span><span class="high rating-bg"><i class="fas fa-star"></i></span><span class="high"><i class="fas fa-star"></i></span>&nbsp;9/6/2018</p>
                                    </div>
                                    <div class="review-text">
                                        New Mediterranean corner spot that cooks up schwarma & falafel plates and pitas in a spiffed up key corner right next to Cinepolis. Great pice point with sit down and take out. I went with a falafel platter. Really cute packaged hummus, babaganousch and baklava. Price point is very reasonable for healthy Med. fare. Soft opening today with more options coming and always need more Med in our lives. Glad to see this s... <a href="">Continue reading</a>
                                    </div>
                               </div>
                               <div class="text-center">
                                   <p class="moreD"><a href="">Read previous reviews</a></p>
                               </div>
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
               <div class="section-content">
                   <div class="row">
                       <div class="col-md-4 col-sm-4">
                           <div class="activity-individual">
                               <div class="media">
                                   <div class="media-left">
                                       <img src="/image/30s.jpg" alt="">
                                   </div>
                                   <div class="media-body">
                                       <strong><a href="">Nadine G.</a></strong><p></p>
                                       <small>Wrote a Review</small>
                                   </div>
                               </div>
                               <figure>
                                   <img src="/image/l%20(1).jpg" alt="">
                               </figure>
                               <figcaption>
                                   <p><strong><a href="">Katsu-Hama</a></strong></p>
                                   <hr>
                                   <div class="activity-review">
                                       <p><span class="rating-bg"><i class="fas fa-star"></i></span><span class="rating-bg"><i class="fas fa-star"></i></span><span class="rating-bg"><i class="fas fa-star"></i></span><span class="rating-bg"><i class="fas fa-star"></i></span><span><i class="fas fa-star"></i></span></p>
                                   </div>
                                   <p>This place is still good in my opinion and the staff is super friendly. So far everything I've ordered has been good. Consistent katsu. <a href="">Continous reading...</a></p>
                                   <hr>
                                   <div class="emoicon">
                                       <p class="pull-left"><span><a href=""><i class="far fa-grin-beam"></i></a><small>Useful</small></span><span><a href=""><i class="far fa-grin-beam"></i></a><small>Useful</small></span><span><a href=""><i class="far fa-grin-beam"></i></a><small>Useful</small></span></p>
                                       <p class="pull-right"><span><a href=""><i class="far fa-grin-beam"></i></a><small>Useful</small></span></p>
                                   </div>
                               </figcaption>
                           </div>
                       </div>
                       <div class="col-md-4 col-sm-4">
                           <div class="activity-individual">
                               <div class="media">
                                   <div class="media-left">
                                       <img src="/image/30s.jpg" alt="">
                                   </div>
                                   <div class="media-body">
                                       <strong><a href="">Nadine G.</a></strong><p></p>
                                       <small>Wrote a Review</small>
                                   </div>
                               </div>
                               <figure>
                                   <img src="/image/l%20(1).jpg" alt="">
                               </figure>
                               <figcaption>
                                   <p><a href="">Katsu-Hama</a></p>
                                   <hr>
                                   <div class="activity-review">
                                       <p><span class="rating-bg"><i class="fas fa-star"></i></span><span class="rating-bg"><i class="fas fa-star"></i></span><span class="rating-bg"><i class="fas fa-star"></i></span><span class="rating-bg"><i class="fas fa-star"></i></span><span><i class="fas fa-star"></i></span></p>
                                   </div>
                                   <p>This place is still good in my opinion and the staff is super friendly. So far everything I've ordered has been good. Consistent katsu. <a href="">Continous reading...</a></p>
                                   <hr>
                                   <div class="emoicon">
                                       <p class="pull-left"><span><a href=""><i class="far fa-grin-beam"></i></a><small>Useful</small></span><span><a href=""><i class="far fa-grin-beam"></i></a><small>Useful</small></span><span><a href=""><i class="far fa-grin-beam"></i></a><small>Useful</small></span></p>
                                       <p class="pull-right"><span><a href=""><i class="far fa-grin-beam"></i></a><small>Useful</small></span></p>
                                   </div>
                               </figcaption>
                           </div>
                       </div>
                       <div class="col-md-4 col-sm-4">
                           <div class="activity-individual">
                               <div class="media">
                                   <div class="media-left">
                                       <img src="/image/30s.jpg" alt="">
                                   </div>
                                   <div class="media-body">
                                       <strong><a href="">Nadine G.</a></strong><p></p>
                                       <small>Wrote a Review</small>
                                   </div>
                               </div>
                               <figure>
                                   <img src="/image/l%20(1).jpg" alt="">
                               </figure>
                               <figcaption>
                                   <p><a href="">Katsu-Hama</a></p>
                                   <hr>
                                   <div class="activity-review">
                                       <p><span class="rating-bg"><i class="fas fa-star"></i></span><span class="rating-bg"><i class="fas fa-star"></i></span><span class="rating-bg"><i class="fas fa-star"></i></span><span class="rating-bg"><i class="fas fa-star"></i></span><span><i class="fas fa-star"></i></span></p>
                                   </div>
                                   <p>This place is still good in my opinion and the staff is super friendly. So far everything I've ordered has been good. Consistent katsu. <a href="">Continous reading...</a></p>
                                   <hr>
                                   <div class="emoicon">
                                       <p class="pull-left"><span><a href=""><i class="far fa-grin-beam"></i></a><small>Useful</small></span><span><a href=""><i class="far fa-grin-beam"></i></a><small>Useful</small></span><span><a href=""><i class="far fa-grin-beam"></i></a><small>Useful</small></span></p>
                                       <p class="pull-right"><span><a href=""><i class="far fa-grin-beam"></i></a><small>Useful</small></span></p>
                                   </div>
                               </figcaption>
                           </div>
                       </div>
                   </div>
                   <hr>
                   <div class="text-center">
                       <p class="moreD"><a href=""><i class="fas fa-angle-down"></i>&nbsp;Show more work in New York</a></p>
                   </div>
               </div>
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
                           <div class="browse-category-individual text-center">
                               <figure>
                                   <img src="/image/72x72_restaurants.png" alt="">
                               </figure>
                               <figcaption><strong>High School Coaches</strong></figcaption>
                           </div>
                           <div class="browse-category-individual text-center">
                               <figure>
                                   <img src="/image/72x72_restaurants.png" alt="">
                               </figure>
                               <figcaption><strong>Products & Services</strong></figcaption>
                           </div>
                       </div>
                       <div class="col-md-3 col-sm-3">
                           <div class="browse-category-individual text-center">
                               <figure>
                                   <img src="/image/72x72_restaurants.png" alt="">
                               </figure>
                               <figcaption><strong>College Coaches</strong></figcaption>
                           </div>
                           <div class="browse-category-individual text-center">
                               <figure>
                                   <img src="/image/72x72_restaurants.png" alt="">
                               </figure>
                               <figcaption><strong>Best Rated Instructions</strong></figcaption>
                           </div>
                       </div>
                       <div class="col-md-3 col-sm-3">
                           <div class="browse-category-individual text-center">
                               <figure>
                                   <img src="/image/72x72_restaurants.png" alt="">
                               </figure>
                               <figcaption><strong>Travel Coaches</strong></figcaption>
                           </div>
                           <div class="browse-category-individual text-center">
                               <figure>
                                   <img src="/image/72x72_restaurants.png" alt="">
                               </figure>
                               <figcaption><strong>Worst Rated Instructions</strong></figcaption>
                           </div>
                       </div>
                       <div class="col-md-3 col-sm-3">
                           <div class="browse-category-individual text-center">
                               <figure>
                                   <img src="/image/72x72_restaurants.png" alt="">
                               </figure>
                               <figcaption><strong>Local Instruction</strong></figcaption>
                           </div>
                           <div class="browse-category-individual text-center">
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
       
       <footer class="section-margin">
           <div class="container">
               <div class="section-content">
                   <div class="row">
                       <div class="col-md-3 col-sm-3">
                           <div class="foo-individual">
                               <h3>About</h3>
                               <div class="foo-option">
                                   <ul>
                                       <li><a href="about.html">About Flank</a></li>
                                       <li><a href="guidelines.html">Current Guidelines</a></li>
                                       <li><a href="terms.html">Terms of Services</a></li>
                                       <li><a href="privacy.html">Privacy Policy</a></li>
                                   </ul>
                               </div>
                           </div>
                       </div>
                       <div class="col-md-3 col-sm-3">
                           <div class="foo-individual">
                               <h3>Discover</h3>
                               <div class="foo-option">
                                   <ul>
                                       <li><a href="blog.html">Flank BLog</a></li>
                                       <li><a href="support.html">Support</a></li>
                                   </ul>
                               </div>
                           </div>
                       </div>
                       <div class="col-md-3 col-sm-3">
                           <div class="foo-individual">
                               <h3>Flank for Business <br> Owners</h3>
                               <div class="foo-option">
                                   <ul>
                                       <li><a href="advertise.html">Advertise on Flank</a></li>
                                       <li><a href="business-blog.html">Flank Blog for Business Owners</a></li>
                                   </ul>
                               </div>
                           </div>
                       </div>
                       
                       <!--<div class="col-md-3 col-sm-3">
                           <div class="foo-individual">
                               <h3>Languages</h3>
                               <div class="foo-option">
                                   <ul>
                                        <li>
                                            <input id="language" type="checkbox" name="menu"/>
                                            <label for="language">English&nbsp;<i class="fas fa-sort-down"></i></label>
                                            <ul class="submenu">
                                                <li><a href="#">Bahasha Malaysia</a></li>
                                                <li><a href="#">English (Australia)</a></li>
                                                <li><a href="#">English (UK)</a></li>
                                                <li><a href="#">English (US)</a></li>
                                                <li><a href="#">English (Canada)</a></li>
                                                <li><a href="#">Bangla</a></li>
                                                <li><a href="#">French</a></li>
                                            </ul>
                                        </li>
                                   </ul>
                               </div>
                           </div>
                           <div class="foo-individual">
                               <h3>Country</h3>
                               <div class="foo-option">
                                   <ul>
                                        <li>
                                            <input id="country" type="checkbox" name="menu"/>
                                            <label for="country">United States&nbsp;<i class="fas fa-sort-down"></i></label>
                                            <ul class="submenu">
                                                <li><a href="#">Bangladesh</a></li>
                                                <li><a href="#">Australia</a></li>
                                                <li><a href="#">United Kingdom</a></li>
                                                <li><a href="#">Germany</a></li>
                                                <li><a href="#">Canada</a></li>
                                                <li><a href="#">United States</a></li>
                                                <li><a href="#">Franch</a></li>
                                            </ul>
                                        </li>
                                   </ul>
                               </div>
                           </div>
                       </div>
                       -->
                   </div>
                   <div class="footer-bg"></div>
                   <div class="text-center"><small class="main-footer_copyright">Copyright © 2004–2019 Yelp Inc. Yelp, <img src="/image/logo_desktop_xsmall_outline.png" alt="">, <img src="/image/burst_desktop_xsmall_outline.png" alt=""> and related marks are registered trademarks of Yelp.</small></div>
               </div>
           </div>
       </footer>
    </div>
</template>
<script>
export default {
  data(){
    return{
      name:'',
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
    
  },
}
</script>
