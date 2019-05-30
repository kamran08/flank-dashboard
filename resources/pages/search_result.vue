<template>
    <div>
        
        <!-- Header-->
        
        <header>
            <div class="header-second">
                <div class="container">
                    <a href="index.html" class="navbar-brand"><img class="img-responsive" src="/image/default.png" alt=""></a>
                    <form action="#">
                        <div class="equal-div">
                            <div class="input-group">
                                <span class="input-group-addon" id="basic-addon1">Find</span>
                                <input v-model="str" type="text" class="form-control" placeholder="tacos, cheap dinner, Max's" aria-describedby="basic-addon1">
                            </div>
                            <div class="input-group">
                               <span class="input-group-addon position-top" id="basic-addon1">Near</span>
                                <input v-model="place" type="text" class="form-control" placeholder="address, neighborhood, zip or state" value="New York, NY">
                                <!-- <Select v-model="flag" style="width:200px">
                                    <Option :value="1" >Coach</Option>
                                    <Option :value="2" >School</Option>
                                </Select> -->
                                <span @click="SearchByKey" class="input-group-btn search-btn review-search-btn position-top"><i class="fas fa-search"></i></span>
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
                </div>
            </div>
            <div class="header-nav">
               <div class="container">
                   <ul class="main-nav">
                       <li><a href=""><i class="fas fa-calculator"></i>&nbsp;&nbsp;High School Coach&nbsp;<i class="fas fa-angle-down"></i></a>
                           <div class="nav-dropdown">
                               <ul class="pull-left">
                                   <li><a href=""><i class="fas fa-calculator"></i>&nbsp;&nbsp;Restaurent</a></li>
                                   <li><a href=""><i class="fas fa-calculator"></i>&nbsp;&nbsp;Restaurent</a></li>
                               </ul>
                               <ul class="pull-left">
                                   <li><a href=""><i class="fas fa-calculator"></i>&nbsp;&nbsp;Restaurent</a></li>
                                   <li><a href=""><i class="fas fa-calculator"></i>&nbsp;&nbsp;Restaurent</a></li>
                               </ul>
                           </div>
                       </li>
                       <li><a href=""><i class="fas fa-calculator"></i>&nbsp;&nbsp;College Coach&nbsp;<i class="fas fa-angle-down"></i></a>
                           <div class="nav-dropdown">
                               <ul class="pull-left">
                                   <li><a href=""><i class="fas fa-calculator"></i>&nbsp;&nbsp;Restaurent</a></li>
                                   <li><a href=""><i class="fas fa-calculator"></i>&nbsp;&nbsp;Restaurent</a></li>
                               </ul>
                               <ul class="pull-left">
                                   <li><a href=""><i class="fas fa-calculator"></i>&nbsp;&nbsp;Restaurent</a></li>
                                   <li><a href=""><i class="fas fa-calculator"></i>&nbsp;&nbsp;Restaurent</a></li>
                               </ul>
                           </div>
                       </li>
                       <li><a href=""><i class="fas fa-calculator"></i>&nbsp;&nbsp;Travel Team Coach&nbsp;<i class="fas fa-angle-down"></i></a>
                           <div class="nav-dropdown">
                               <ul class="pull-left">
                                   <li><a href=""><i class="fas fa-calculator"></i>&nbsp;&nbsp;Restaurent</a></li>
                                   <li><a href=""><i class="fas fa-calculator"></i>&nbsp;&nbsp;Restaurent</a></li>
                               </ul>
                               <ul class="pull-left">
                                   <li><a href=""><i class="fas fa-calculator"></i>&nbsp;&nbsp;Restaurent</a></li>
                                   <li><a href=""><i class="fas fa-calculator"></i>&nbsp;&nbsp;Restaurent</a></li>
                               </ul>
                           </div>
                       </li>
                       <li><a href=""><i class="fas fa-calculator"></i>&nbsp;&nbsp;Products & services&nbsp;<i class="fas fa-angle-down"></i></a>
                           <div class="nav-dropdown">
                               <ul class="pull-left">
                                   <li><a href=""><i class="fas fa-calculator"></i>&nbsp;&nbsp;Restaurent</a></li>
                                   <li><a href=""><i class="fas fa-calculator"></i>&nbsp;&nbsp;Restaurent</a></li>
                               </ul>
                               <ul class="pull-left">
                                   <li><a href=""><i class="fas fa-calculator"></i>&nbsp;&nbsp;Restaurent</a></li>
                                   <li><a href=""><i class="fas fa-calculator"></i>&nbsp;&nbsp;Restaurent</a></li>
                               </ul>
                           </div>
                       </li>
                   </ul>
                   <ul class="main-nav right-top pull-right">
                       <li><a href="review.html"><i class="fas fa-pen"></i>&nbsp;Write a Review</a></li>
                       <li><a href="review.html"><i class="fas fa-pen"></i>&nbsp;For Business</a></li>
                   </ul>
               </div>
            </div>
        </header>
        
        <section class="rd second-section bg bg-border-bottom find-second-section">
            <div class="container">
                <div class="section-content">
                    <div class="find-page-title">
                        <h2>Search Result for <strong>{{sstr}}</strong><span v-if="place != ''" > in {{splace}}</span></h2>
                        <h3>Showing {{pagination.page}} of {{( showCurrentPage)}}</h3>
                    </div>
                    <div class="find-page-nav">
                        <ul class="filter">
                            <li class="filter-list" :class="(filterFlag)? 'active_ON': ''"  @click="filterFlagAction" ><span><i class="fas fa-random"></i></span> All Filters <span class="filter-tag tag-one">Show All Filters</span></li>
                            <!-- <li class="filter-list">
                                <ul>
                                    <li>$ <span class="filter-tag tag-two">Inexpensive</span></li>
                                    <li>$$ <span class="filter-tag tag-three">Moderate</span></li>
                                    <li>$$$ <span class="filter-tag tag-four">Pricey</span></li>
                                    <li>$$$$ <span class="filter-tag tag-five">Pricey</span></li>
                                </ul>
                            </li>
                            <li class="filter-list"><span><i class="far fa-clock"></i></span> Open Now <span class="filter-tag tag-six">Find all business that are open now</span></li>
                            <li class="filter-list"><span><i class="far fa-clock"></i></span> Delivery <span class="filter-tag tag-seven">Restaurents that offer ordering on Flank</span></li>
                            <li class="filter-list"><span><i class="far fa-clock"></i></span> Takeout <span class="filter-tag tag-eight">Restaurents that offer ordering on Flank</span></li>
                            <li class="filter-list"><span><i class="far fa-clock"></i></span> Reservation <span class="filter-tag tag-nine">Restaurents that offer reservation on Flank</span></li>
                            <li class="filter-list"><span><i class="far fa-clock"></i></span> Cash Back <span class="filter-tag tag-ten">Restaurents that let you join the waitlist remotely on Flank</span></li> -->
                        </ul>
                        <div class="filter-content" v-if="filterFlag" >
                            <div class="filter-content-inner">
                                <div class="filter-item">
                                    <div class="filter-item-title">
                                        <h3>Sort By</h3>
                                    </div>
                                    <ul class="filter-item-list">
                                        <li class="active"><a href="">Recomended</a></li>
                                        <li><a href="">Highest Rated</a></li>
                                        <li><a href="">Most Reviewed</a></li>
                                    </ul>
                                </div>
                                <div class="filter-item">
                                    <div class="filter-item-title">
                                        <h3>Search </h3>
                                    </div>
                                    <div class="filter-item-list">
                                        <RadioGroup v-model="pageOption" vertical @on-change="SearchByKey" >
                                            <Radio label="legend" >Local Legend</Radio>
                                            <Radio label="school">Schools</Radio>
                                            <Radio label="coach">School Coaches</Radio>
                                            <Radio label="product">Products</Radio>
                                        </RadioGroup>
                                    </div>
                                    <!-- <ul class="filter-item-list">
                                        <li><input type="checkbox" id="check1"><label for="check1">Local Legend</label></li>
                                        <li><input type="checkbox" id="check2"><label for="check2">Schools</label></li>
                                        <li><input type="checkbox" id="check3"><label for="check3">School Coaches</label></li>
                                        <li><input type="checkbox" id="check4"><label for="check4">Products</label></li>
                                    </ul> -->
                                </div>
                                <!-- <div class="filter-item">
                                    <div class="filter-item-title">
                                        <h3>Distance</h3>
                                    </div>
                                    <ul class="filter-item-list">
                                        <li class="active"><a href="">Bird's-eye View</a></li>
                                        <li><a href="">Driving (5 mi.)</a></li>
                                        <li><a href="">Biking (2 mi.)</a></li>
                                        <li><a href="">Walking (1 mi.)</a></li>
                                        <li><a href="">Within 4 blocks</a></li>
                                    </ul>
                                </div> -->
                                <!-- <div class="filter-item">
                                    <div class="filter-item-title">
                                        <h3>Price</h3>
                                    </div>
                                    <ul class="filter-item-list">
                                        <li><input type="checkbox" id="check5"><label for="check5">$</label></li>
                                        <li><input type="checkbox" id="check6"><label for="check6">$$</label></li>
                                        <li><input type="checkbox" id="check7"><label for="check7">$$$</label></li>
                                        <li><input type="checkbox" id="check8"><label for="check8">$$$$</label></li>
                                    </ul>
                                </div> -->
                                <!-- <div class="filter-item">
                                    <div class="filter-item-title">
                                        <h3>Features</h3>
                                    </div>
                                    <ul class="filter-item-list">
                                        <li><input type="checkbox" id="check9"><label for="check9"><span><i class="fas fa-motorcycle"></i></span>Delivery</label></li>
                                        <li><input type="checkbox" id="check10"><label for="check10"><span><i class="fas fa-lock"></i></span>Takeout</label></li>
                                        <li><input type="checkbox" id="check11"><label for="check11"><span><i class="fas fa-stopwatch"></i></span>Waitlist</label></li>
                                        <li><input type="checkbox" id="check12"><label for="check12"><span class="rotated-green"><i class="fas fa-tag"></i></span>Offering a Deal</label></li>
                                        <li><a href="">More Features</a></li>
                                    </ul>
                                </div> -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="third-section find-search-third-section"  >
            <div class="container">
                <div class="section-content">
                    <div class="row">
                        <div class="col-md-8">
                            <div class="sponsor-part">
                                <div class="sponsor-title">
                                    <h2>All Results</h2>
                                </div>
                                <div class="sponsor-all-list" v-if="pageOption == 'legend'">
                                    <div class="sponsor-media sponsor-item" v-for="(item,index) in searchData" :key="index" >
                                        <div class="sponsor-media-left">
                                            <figure>
                                                <img :src="item.img" alt="">
                                            </figure>
                                            <div class="sponsor-media-carousel">
                                                <span><i class="fas fa-chevron-left"></i></span>
                                                <span><i class="fas fa-chevron-right"></i></span>
                                            </div>
                                        </div>
                                        <div class="sponsor-media-body">
                                            <div class="body-part-one">
                                                <h3 v-if="pageOption=='legend'" ><span>{{index+1}}.</span> <a @click="$router.push(`profile/${item.id}`)" >{{item.name}}</a></h3>
                                                <div class="badge-review">
                                                    <p>
                                                        <!-- <span class="rating-bg high"><i class="fas fa-star"></i></span>
                                                        <span class="rating-bg high"><i class="fas fa-star"></i></span>
                                                        <span class="rating-bg high"><i class="fas fa-star"></i></span>-->
                                                        <span class="rating-bg high"><i class="fas fa-star"></i></span> 
                                                        <span :class="(item.avgRating>0)? ' rating-bg' : ''"><i class="fas fa-star"></i></span>
                                                        <span :class="(item.avgRating>1)? ' rating-bg' : ''"><i class="fas fa-star"></i></span>
                                                        <span :class="(item.avgRating>2)? ' rating-bg' : ''"><i class="fas fa-star"></i></span>
                                                        <span :class="(item.avgRating>3)? ' rating-bg' : ''"><i class="fas fa-star"></i></span>
                                                        <span :class="(item.avgRating>4)? ' rating-bg' : ''"><i class="fas fa-star"></i></span>
                                                        <span><i class="fas fa-star"></i></span> <small>{{item.__meta__.totalReview_count}} reviews</small></p>
                                                </div>
                                                <div class="dir-link">
                                                    <p>$ &nbsp; • &nbsp; <a href="">Cafes</a>, <a href="">Delis</a></p>
                                                </div>
                                            </div>
                                            <div class="body-part-two">
                                                <p>{{item.phone}}</p>
                                                <p></p>
                                                <p>{{item.address}}</p>
                                            </div>
                                            <div class="body-para">
                                                <h4><span><i class="fas fa-utensils"></i></span> &nbsp; Popular for its <strong>Veggie Combo</strong></h4>
                                                <p>“I had not visited this little hole-in-the-wall sandwich shop/cafe in about four years and did not know until today that there had been a change in ownership back in 2014. WOW! What…” <a href="">read more</a></p>
                                                <!-- <div class="order-card">
                                                    <p>Offers takeout and delivery</p>
                                                    <button>Start Order</button>
                                                </div> -->
                                            </div>
                                        </div>
                                    </div>
                                    <div class="paginationCount pagination_mark">
                                        <!-- <ul>
                                            <li class="active"><a href="">1</a></li>
                                            <li><a href="">2</a></li>
                                            <li><a href="">3</a></li>
                                            <li><a href="">4</a></li>
                                            <li><a href="">5</a></li>
                                            <li><a href="">Next&nbsp;<i class="fas fa-chevron-right"></i></a></li>
                                        </ul> -->
                                         <div >
                                            <Page :current="pagination.page" :total="pagination.total" @on-change="paginateDataInfo($event)" :page-size="pagination.perPage" />
                                        </div>
                                    </div>
                                </div>
                                <div class="sponsor-all-list" v-if="pageOption == 'coach'">
                                    <div class="sponsor-media sponsor-item" v-for="(item,index) in searchData" :key="index"  v-if="item.school">
                                        <div class="sponsor-media-left">
                                            <figure >
                                                <img :src="item.school.logo" alt="">
                                            </figure>
                                        </div>
                                        <div class="sponsor-media-body">
                                            <div class="body-part-one">
                                                <h3 ><span>{{index+1}}.</span>{{item.name}}</h3>
                                                <div class="badge-review">
                                                    <p>
                                                        <!-- <span class="rating-bg high"><i class="fas fa-star"></i></span>
                                                        <span class="rating-bg high"><i class="fas fa-star"></i></span>
                                                        <span class="rating-bg high"><i class="fas fa-star"></i></span>-->
                                                        <span class="rating-bg high"><i class="fas fa-star"></i></span> 
                                                        <span :class="(item.avgRating>0)? ' rating-bg' : ''"><i class="fas fa-star"></i></span>
                                                        <span :class="(item.avgRating>1)? ' rating-bg' : ''"><i class="fas fa-star"></i></span>
                                                        <span :class="(item.avgRating>2)? ' rating-bg' : ''"><i class="fas fa-star"></i></span>
                                                        <span :class="(item.avgRating>3)? ' rating-bg' : ''"><i class="fas fa-star"></i></span>
                                                        <span :class="(item.avgRating>4)? ' rating-bg' : ''"><i class="fas fa-star"></i></span>
                                                        <span><i class="fas fa-star"></i></span> <small>{{item.__meta__.allreview_count}} reviews</small></p>
                                                </div>
                                                <div class="dir-link">
                                                    <p>
                                                        <span></span> <a @click="$router.push(`school/${item.id}`)" >{{item.school.schoolName}} {{item.school.sport}} </a>
                                                    </p>
                                                </div>
                                            </div>
                                            <div class="body-part-two">
                                                <p>{{item.school.sport}}</p>
                                                <p></p>
                                                <p>
                                                    {{item.school.city}}
                                                    {{(item.school.state)? ' ,'+item.school.state : '' }}
                                                    {{(item.school.division)? ' ,'+item.school.division : '' }}
                                                </p>
                                            </div>
                                            <div class="body-para">
                                                <div class="order-card">
                                                   <h4><span><i class="fas fa-utensils"></i></span> &nbsp; Popular for its <strong>Veggie Combo</strong></h4>
                                                    <p>“I had not visited this little hole-in-the-wall sandwich shop/cafe in about four years and did not know until today that there had been a change in ownership back in 2014. WOW! What…” <a href="">read more</a></p>
                                                    <div class="order-card">
                                                        <button class='text-center' @click="$router.push(`/scoach_review/${item.id}`)" >Write a Review</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="paginationCount pagination_mark">
                                        <!-- <ul>
                                            <li class="active"><a href="">1</a></li>
                                            <li><a href="">2</a></li>
                                            <li><a href="">3</a></li>
                                            <li><a href="">4</a></li>
                                            <li><a href="">5</a></li>
                                            <li><a href="">Next&nbsp;<i class="fas fa-chevron-right"></i></a></li>
                                        </ul> -->
                                         <div >
                                            <Page :current="pagination.page" :total="pagination.total" @on-change="paginateDataInfo($event)" :page-size="pagination.perPage" />
                                        </div>
                                    </div>
                                </div>
                                <div class="sponsor-all-list" v-if="pageOption == 'school'">
                                    <div class="sponsor-media sponsor-item" v-for="(item,index) in searchData" :key="index" >
                                        <div class="sponsor-media-left">
                                            <figure>
                                                <img :src="item.logo" alt="">
                                            </figure>
                                        </div>
                                        <div class="sponsor-media-body">
                                            <div class="body-part-one">
                                                <h3 ><span>{{index+1}}.</span> <a @click="$router.push(`school/${item.id}`)" >{{item.schoolName}} {{item.sport}} </a></h3>
                                                <div class="badge-review">
                                                    <p>
                                                        <!-- <span class="rating-bg high"><i class="fas fa-star"></i></span>
                                                        <span class="rating-bg high"><i class="fas fa-star"></i></span>
                                                        <span class="rating-bg high"><i class="fas fa-star"></i></span>-->
                                                        <span class="rating-bg high"><i class="fas fa-star"></i></span> 
                                                        <span :class="(item.avgRating>0)? ' rating-bg' : ''"><i class="fas fa-star"></i></span>
                                                        <span :class="(item.avgRating>1)? ' rating-bg' : ''"><i class="fas fa-star"></i></span>
                                                        <span :class="(item.avgRating>2)? ' rating-bg' : ''"><i class="fas fa-star"></i></span>
                                                        <span :class="(item.avgRating>3)? ' rating-bg' : ''"><i class="fas fa-star"></i></span>
                                                        <span :class="(item.avgRating>4)? ' rating-bg' : ''"><i class="fas fa-star"></i></span>
                                                        <span><i class="fas fa-star"></i></span> <small>{{item.__meta__.allreview_count}} reviews</small></p>
                                                </div>
                                                <div class="dir-link">
                                                    <p>$ &nbsp; • &nbsp; <a href="">Cafes</a>, <a href="">Delis</a></p>
                                                </div>
                                            </div>
                                            <div class="body-part-two">
                                                <p>{{item.phone}}</p>
                                                <p></p>
                                                <p>
                                                    {{item.city}}
                                                    {{(item.state)? ' ,'+item.state : '' }}
                                                    {{(item.division)? ' ,'+item.division : '' }}
                                                </p>
                                            </div>
                                            <div class="body-para">
                                                <h4><span><i class="fas fa-utensils"></i></span> &nbsp; Popular for its <strong>Veggie Combo</strong></h4>
                                                <p>“I had not visited this little hole-in-the-wall sandwich shop/cafe in about four years and did not know until today that there had been a change in ownership back in 2014. WOW! What…” <a href="">read more</a></p>
                                                <!-- <div class="order-card">
                                                    <p>Offers takeout and delivery</p>
                                                    <button>Start Order</button>
                                                </div> -->
                                            </div>
                                        </div>
                                    </div>
                                    <div class="paginationCount pagination_mark">
                                        <!-- <ul>
                                            <li class="active"><a href="">1</a></li>
                                            <li><a href="">2</a></li>
                                            <li><a href="">3</a></li>
                                            <li><a href="">4</a></li>
                                            <li><a href="">5</a></li>
                                            <li><a href="">Next&nbsp;<i class="fas fa-chevron-right"></i></a></li>
                                        </ul> -->
                                         <div >
                                            <Page :current="pagination.page" :total="pagination.total" @on-change="paginateDataInfo($event)" :page-size="pagination.perPage" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="city-related-topic">
                                <div class="inner-title">
                                    <h3>Related with topics</h3>
                                </div>
                                <div class="topic-media">
                                    <div class="topic-media-left">
                                        <figure>
                                            <img src="/image/60s.jpg" alt="">
                                        </figure>
                                    </div>
                                    <div class="topic-media-body">
                                        <h3><a href="">Restaurents</a></h3>
                                        <p>Restaurants to try in san fran? Any idea?</p>
                                    </div>
                                </div>
                                <div class="topic-media">
                                    <div class="topic-media-left">
                                        <figure>
                                            <img src="/image/60s.jpg" alt="">
                                        </figure>
                                    </div>
                                    <div class="topic-media-body">
                                        <h3><a href="">Restaurents</a></h3>
                                        <p>I am going to the bay brea in a month, spending a lot of time in SF. ANy reccomendations for restaurants and things to do?</p>
                                    </div>
                                </div>
                                <p><a href="">More Topics</a></p>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="partner-website-add">
                                <div class="partner-website-link">
                                    <div class="website-link">
                                        <p class="link-partner"><img src="/image/faviconV2.png" alt=""> <a href="" title="bubbagump.com">bubbagump.com</a> ▼+1 415-781-4867</p>
                                        <h3><a href="">Bubba Gump San Francisco - Seafood Restaurant</a></h3>
                                        <p class="link-det"><span>Ad</span>  Enjoy southern-style seafood, outdoor seating, weekday HH and more. View menu. Fun For All Ages. National Fried Shrimp Day. Happy Hour Specials. Easter w/ Shrimp Louie. Amenities: Kid-Friendly <strong>Restaurant</strong>, Host Parties & Events, Fun Retail Shop.</p>
                                        <p class="addre">201 3rd St #100, San Francisco, CA</p>
                                        <button><span><i class="fas fa-arrow-right"></i></span> <a href="">Visit Website</a></button>
                                    </div>
                                    <div class="website-link">
                                        <p class="link-partner"><img src="/image/faviconV2.png" alt=""> <a href="" title="bubbagump.com">bubbagump.com</a> ▼+1 415-781-4867</p>
                                        <h3><a href="">Bubba Gump San Francisco - Seafood Restaurant</a></h3>
                                        <p class="link-det"><span>Ad</span>  Enjoy southern-style seafood, outdoor seating, weekday HH and more. View menu. Fun For All Ages. National Fried Shrimp Day. Happy Hour Specials. Easter w/ Shrimp Louie. Amenities: Kid-Friendly <strong>Restaurant</strong>, Host Parties & Events, Fun Retail Shop.</p>
                                        <p class="addre">201 3rd St #100, San Francisco, CA</p>
                                        <button><span><i class="fas fa-arrow-right"></i></span> <a href="">Visit Website</a></button>
                                    </div>
                                </div>
                            </div>
                            <div class="missing-box">
                                <h3>Not here? Tell us what we're missing.</h3>
                                <p>If the business you're looking for isn't here, add it!</p>
                                <button>Add a business</button>
                                <hr>
                                <p>Got search feedback? <a href="">Help us improve.</a></p>
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
            str:'',
            place:'',
            page:1,
            flag:1,
            sstr:1,
            splace:1,
            filterFlag:false,
            pageOption: 'legend',
            iam:false,
            showCurrentPage:0

        }
    },
    methods:{
        async SearchByKey(){

            const res = await this.callApi('get', `/app/SearchData?place=${this.place}&str=${this.str}&page=${this.page}&pageOption=${this.pageOption}`)
            if(res.status === 200){
                this.searchData = res.data.data
                this.pagination = res.data 
                delete this.pagination.data
                this.sstr = this.str
                this.splace = this.place
                this.showCurrentPage = (Math.ceil((this.pagination.total)/(this.pagination.perPage)))
            }
            else{
                this.swr();
            }
        },
        async paginateDataInfo(e){
            this.page = e
             const res = await this.callApi('get', `/app/SearchData?place=${this.place}&str=${this.str}&page=${this.page}&pageOption=${this.pageOption}`)
            if(res.status === 200){
                this.searchData = res.data.data
                this.pagination = res.data 
                delete this.pagination.data
                this.sstr = this.str
                this.splace = this.place
                this.showCurrentPage = (Math.ceil((this.pagination.total)/(this.pagination.perPage)))
            }
            else{
                this.swr();
            }
        },
        filterFlagAction(){
            this.filterFlag = (this.filterFlag)? false : true
        }

    },
     async asyncData({app, store,redirect, params,query}){
        try {
            let {data} = await app.$axios.get(`/app/SearchData?place=${query.place}&str=${query.str}&pageOption=legend`)
          
            return{
                searchData : data.data,
                pagination : data,
               

            }
		}catch (error) {
            return redirect('/')
		}
   },
    created(){
       
        this.place = this.$route.query.place
        this.splace = this.$route.query.place
        this.str = this.$route.query.str
        this.sstr = this.$route.query.str
       // this. showCurrentPage = (Math.ceil(this.pagination.total)/(this.pagination.perPage)-this.pagination.page)

    }

}
</script>

<style>
.active_ON{
    background: #0096d8 !important;
    color: #fff !important;
}
.pagination_mark{
        text-align: center;
}

</style>
