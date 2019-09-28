<template>
    <div class="flank-container">
        <div class="new-flank-nav">
            <div class="new-flank-nav-con">
                <div class="flank-new-brand">
                    <a href="#"><img src="/images/logo-new.png" alt=""></a>
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
                                <input type="text" v-model="str" @enter="SearchByKey" >
                            </div>
                        </div>
                        <div class="flank-new-indi" v-if=" pageOption != 'product' "  >
                            <div class="new-flank-selection">
                                <p>City</p>
                            </div>
                            <div class="new-flank-input" >
                                <input type="text" v-model="place" v-on:keyup="searchPlace" @enter="SearchByKey"  >
                                <div class="new-flank-indi-dropdown" v-if="allPlaces.length>0 && place != ''" >
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
                <div class="flank-new-autho">
                    <div class="autho-in">
                        <button>Log in</button>
                    </div>
                    <div class="autho-up">
                        <button>Sign Up</button>
                    </div>
                </div>
            </div>
        </div>

        <nav class="new-flank-header-nav">
            <div class="container">
                <div class="header-nav-indi">
                    <ul class="header-nav-indi-left">
                        <li class="active"><a href=""><img src="/images/new-ic-1.png" alt="">HS Coaches<span><i class="fas fa-chevron-down"></i></span></a></li>
                        <li><a href=""><img src="/images/new-ic-2.png" alt="">CC Coaches<span><i class="fas fa-chevron-down"></i></span></a></li>
                        <li><a href=""><img src="/images/new-ic-3.png" alt="">Local Coaches<span><i class="fas fa-chevron-down"></i></span></a></li>
                        <li><a href="">More<span><i class="fas fa-chevron-down"></i></span></a></li>
                    </ul>
                    <ul class="header-nav-indi-right">
                        <li class="active"><a href=""><img src="/images/new-ic-4.png" alt="">Write a Review<span><i class="fas fa-chevron-down"></i></span></a></li>
                        <li><a href=""><img src="/images/new-ic-5.png" alt="">For Business<span><i class="fas fa-chevron-down"></i></span></a></li>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="new-search-flank">
            <div class="new-search-flank-num">
                <p v-if="showStr" >  1-5 of over {{pagination.total}} results for <span>"{{showStr}}"</span></p>
            </div>
            <div class="new-search-flank-sort">
                <select name="" id="">
                    <option value="one">Sort by: Featured</option>
                    <option value="one">Sort by: Featured</option>
                    <option value="one">Sort by: Featured</option>
                    <option value="one">Sort by: Featured</option>
                </select>
            </div>
        </div>

        <div class="new-flank-container-fluid">
            <div class="new-flank-sidebar">
                <div class="new-flank-sidebar-list">
                    <h3>Department</h3>
                    <ul class="pad-list">
                        <li @click="chnageType('school')" ><a :class="(pageOption == 'school')? 'active_coach': ''">Schools</a></li>
                        <li @click="chnageType('coach', 'High School')" ><a :class="(pageOption == 'coach' && div == 'High School')? 'active_coach': ''">High school coaches</a></li>
                        <li @click="chnageType('coach', 'Junior College')" ><a :class="(pageOption == 'coach' && div == 'Junior College')? 'active_coach': ''">College coaches</a></li>
                        <li @click="chnageType('coach', 'all')" ><a :class="(pageOption == 'coach' && div == 'all')? 'active_coach': ''">Professional sports</a></li>
                        <li @click="chnageType('coach', 'Club/Travel')" ><a :class="(pageOption == 'coach' && div == 'Club/Travel')? 'active_coach': ''">Travel team coaches</a></li>
                        <li @click="chnageType('legend')" ><a :class="(pageOption == 'legend' )? 'active_coach': ''">Local instructors</a></li>
                        <li @click="chnageType('product')" ><a :class="(pageOption == 'product' )? 'active_coach': ''">Products & services</a></li>
                    </ul>
                </div>
                <div class="new-flank-sidebar-list">
                    <h3>Avg customer review</h3>
                    <ul>
                        <li>
                            <p v-if="onHover">
                                <span  @mouseover="changeDataHover(1)"   @mouseleave="changeDataHoverLeave"  @click="changeOldRating(1)" :class="(drating.index > 0)? drating.class: ''"  ><i class="fas fa-star"></i></span>
                                <span  @mouseover="changeDataHover(2)"   @mouseleave="changeDataHoverLeave"  @click="changeOldRating(2)" :class="(drating.index > 1)? drating.class: ''" ><i class="fas fa-star"></i></span>
                                <span  @mouseover="changeDataHover(3)"   @mouseleave="changeDataHoverLeave"  @click="changeOldRating(3)" :class="(drating.index > 2)? drating.class: ''" ><i class="fas fa-star"></i></span>
                                <span  @mouseover="changeDataHover(4)"   @mouseleave="changeDataHoverLeave"  @click="changeOldRating(4)" :class="(drating.index > 3)? drating.class: ''" ><i class="fas fa-star"></i></span>
                                <span  @mouseover="changeDataHover(5)"   @mouseleave="changeDataHoverLeave"  @click="changeOldRating(5)" :class="(drating.index > 4)? drating.class: ''"  ><i class="fas fa-star"></i></span>
                            </p>
                            <p v-else>
                                <span  @mouseover="changeDataHover(1)"   @mouseleave="changeDataHoverLeave"  @click="changeOldRating(1)" :class="(oldrating.index > 0)? oldrating.class: ''"  ><i class="fas fa-star"></i></span>
                                <span  @mouseover="changeDataHover(2)"   @mouseleave="changeDataHoverLeave"  @click="changeOldRating(2)" :class="(oldrating.index > 1)? oldrating.class: ''" ><i class="fas fa-star"></i></span>
                                <span  @mouseover="changeDataHover(3)"   @mouseleave="changeDataHoverLeave"  @click="changeOldRating(3)" :class="(oldrating.index > 2)? oldrating.class: ''" ><i class="fas fa-star"></i></span>
                                <span  @mouseover="changeDataHover(4)"   @mouseleave="changeDataHoverLeave"  @click="changeOldRating(4)" :class="(oldrating.index > 3)? oldrating.class: ''" ><i class="fas fa-star"></i></span>
                                <span  @mouseover="changeDataHover(5)"   @mouseleave="changeDataHoverLeave"  @click="changeOldRating(5)" :class="(oldrating.index > 4)? oldrating.class: ''"  ><i class="fas fa-star"></i></span>
                            </p>
                        </li>
                    </ul>
                </div>
                <div class="new-flank-sidebar-list">
                    <h3>Attributes</h3>
                    <ul>
                        <li>
                            <input type="radio" name="gender"  v-model="attribute" id="che1" value="averageHealthy" v-on:change="SearchByKey" ><label for="che1">Healthy index</label>
                        </li>
                        <li>
                            <input type="radio" name="gender"  v-model="attribute" id="che2" value="averageHarmful" v-on:change="SearchByKey"><label for="che2">Harmful index</label>
                        </li>
                    </ul>
                </div>
                <div class="new-flank-sidebar-list">
                    <h3>Sport type</h3>
                     <CheckboxGroup v-model="sports" @on-change="SearchByKey">
                    <ul v-if="allSports.length">
                        <li v-for="(item,index) in allSports" :key="index" >
                             <Checkbox :label="item.sport">{{item.sport}}</Checkbox>
                            <!-- <input type="checkbox" id="che3"><label for="che3">Baseball</label> -->
                        </li>
                       
                    </ul>
                     </CheckboxGroup>
                </div>
            </div>
            <div class=" col-md-10" v-if="str != '' && place != '' && searchData.length == 0 && onTest == true ">
                <div>
                    <div class="new-find-section">
                        <div class="">
                            <div class="new-find-inner">
                                <h3>No Results for fasdfasdfasd <span>Brentwood, Los Angeles, CA</span></h3>
                                <div class="new-find-pagi">
                                    <ul>
                                        <li><a href="">Los Angeles, CA</a></li>
                                        <li><span><i class="fas fa-chevron-right"></i></span><a href="">Brentwood</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="suggestion-result">
                                    <div class="suggestion-inner">
                                        <h3>Suggestions for improving the results</h3>
                                        <div class="suggestion-inner-list">
                                            <ul>
                                                <li>Try a larger search area.</li>
                                                <li>Try a different location.</li>
                                                <li>Check the spelling or try alternate spellings.</li>
                                                <li>Try a more general search e.g. "pizza" instead of "pepperoni"</li>
                                            </ul>
                                        </div>
                                        <div class="suggestion-container">
                                            <div class="suggestion-container-inner">
                                                <div class="suggestion-container-left">
                                                    <h3>Not here? Tell us what we're missing.</h3>
                                                    <p>If the bussiness you are looking for isn't here, add it!</p>
                                                </div>
                                                <div class="suggestion-container-right">
                                                    <button @click="addNew.modal = true" >Add a School/Coach</button>
                                                </div>
                                            </div>
                                            <div class="suggestion-container-text">
                                                <p>Got search feedback? <a href="#">Help us improve</a></p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="new-flank-content" v-else  >

                <div class="new-flank-content-rev" v-if="!isLoading && searchData.length>0 && searchData[0].allreviewLimit != null "  >
                    <div class="new-content-rev-title">
                        <h2>Your past reviews</h2>
                        <p><a href="">See all past reviews</a></p>
                    </div>
                    <div class="new-content-rev-details">
                        <div class="new-content-rev-left">
                            <div class="new-best-rated rated-red">
                                <p>{{ (searchData[0].avg_rating>=3)? 'Best Rated' : 'Worst Rated'}}</p>
                            </div>
                            <figure>
                                <img src="/images/ps.png" alt="">
                            </figure>
                        </div>
                        <div class="new-content-rev-right">
                            <h2>{{ searchData[0].name}} -  {{ searchData[0].school.sport}}  </h2>
                            <p>{{ searchData[0].school.schoolName}}</p>
                            <span class="city-s">{{searchData[0].school.city}}/{{searchData[0].school.state}}</span>
                            <div class="new-content-star">
                                <ul>
                                    <li><span :class="( searchData[0].allreviewLimit.rating>0)? 'bg' : ''" ><i class="fas fa-star"></i></span></li>
                                    <li><span :class="( searchData[0].allreviewLimit.rating>1)? 'bg' : ''" ><i class="fas fa-star"></i></span></li>
                                    <li><span :class="( searchData[0].allreviewLimit.rating>2)? 'bg' : ''" ><i class="fas fa-star"></i></span></li>
                                    <li><span :class="( searchData[0].allreviewLimit.rating>3)? 'bg' : ''" ><i class="fas fa-star"></i></span></li>
                                    <li><span :class="( searchData[0].allreviewLimit.rating>4)? 'bg' : ''" ><i class="fas fa-star"></i></span></li>
                                </ul>
                                <p><span><i class="fas fa-chevron-down"></i></span><a href="">1</a></p>
                            </div>
                            <div class="new-comment-para">
                                <p>"{{searchData[0].allreviewLimit.content}}" <a href="">Read more</a></p>
                            </div>
                            <div class="new-comment-btn">
                                <button @click="$router.push(`/scoach_review/${searchData[0].id}`)" >Write a Review</button>
                            </div>
                        </div>
                    </div>
                </div>

                <div v-if="!isLoading && searchData.length>0" >

                    <div class="_1coach_items" v-if="pageOptinoInfo == 'coach'"  v-for="(item,index) in searchData" :key="index"  >
                        <p class="worst yellow">{{ (item.avg_rating>=3)? 'Best Rated' : 'Worst Rated'}}</p>

                        <div class="_2coach_main">
                            <div class="row">
                                <!-- Left -->
                                <div class="col-xl-12 col-md-12 col-lg-7 _2coach_main_left">
                                    <div class="_2card">
                                        <div class="_2card_pic">
                                            <img class="_2card_img" src="/images/ps.png" alt="" title="">
                                        </div>

                                        <div class="_2card_details">
                                            <div class="_2card_details_top">
                                                <div class="_2card_details_left">
                                                    <p class="_2title" style=" cursor: pointer; "  @click="$router.push(`/school_coach/${item.id}`)" >{{item.name}} -  {{item.school.sport}}  </p>
                                                    <div class="_1rating">
                                                        <ul class="_1rating_list">
                                                            <li :class="(item.avg_rating>0)? '_1rating_active' : ''"><i class="fas fa-star"></i></li>
                                                            <li :class="(item.avg_rating>1)? '_1rating_active' : ''" ><i class="fas fa-star"></i></li>
                                                            <li :class="(item.avg_rating>2)? '_1rating_active' : ''" ><i class="fas fa-star"></i></li>
                                                            <li :class="(item.avg_rating>3)? '_1rating_active' : ''" ><i class="fas fa-star"></i></li>
                                                            <li :class="(item.avg_rating>4)? '_1rating_active' : ''" ><i class="fas fa-star"></i></li>
                                                            <li class="_1rating_num"><span> <i class="fas fa-chevron-down"></i> </span> {{item.__meta__.allreview}}</li>
                                                        </ul>
                                                    </div>
                                                </div>

                                                <p class="_2card_details_city">{{item.school.city}}/{{item.school.state}}</p>
                                            </div>
                                            <p class="_2card_status _2taxt">
                                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
                                                    Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi u"
                                            </p>

                                            <p>
                                                <a href="" class="see_more">See more</a>
                                            </p>

                                            <button @click="$router.push(`/scoach_review/${item.id}`)" class="_1btn">Write a Review</button>
                                        </div>
                                    </div>
                                </div>
                                <!-- Left -->

                                <!-- Right -->
                                <div class="col-xl-12 col-md-12 col-lg-5 _2coach_main_right">
                                    <div class="_2coach_title">
                                        <p class="_2coach_title_one">Health Score:</p>

                                        <p class="_2coach_title_two _2coach_title_two_red"> {{ item | healthScore }}
                                            
                                            <!-- <span>91.98%</span> -->
                                        
                                        </p>
                                    </div>

                                    <div class="_2coach_main_right_main"  @click="$router.push(`/school_coach/${item.id}`)" >
                                        <p class="_2coach_main_right_title">Known for:</p>
                                            <!-- 
                                        <ul class="coach-main-known-list"  >
                                            <li  v-for="(item,index) in item.topAtrribute" :key="index">
                                                <figure>
                                                    <img :src="item.info.image" alt="">
                                                </figure>
                                                <p>{{item.info.content}}</p>
                                            </li>
                                            <li>
                                                <figure>
                                                    <img src="/images/plus.gif" alt="">
                                                </figure>
                                                <p>Health Score<span>55 out of 100</span></p>
                                            </li>
                                            <li>
                                                <figure>
                                                    <img src="/images/veh.gif" alt="">
                                                </figure>
                                                <p>Delivery<span>No</span></p>
                                            </li>
                                            <li>
                                                <figure>
                                                    <img src="/images/veh.gif" alt="">
                                                </figure>
                                                <p>Delivery<span>No</span></p>
                                            </li>
                                        </ul> -->
                                        <div class="known-for-list">
                                            <ul>
                                                <li><img src="/attribute/1.png" alt=""><span>Health Score</span></li>
                                                <li><img src="/attribute/2.png" alt=""><span>Great Communicator</span></li>
                                                <li><img src="/attribute/3.png" alt=""><span>Creates a Healthy Environment</span></li>
                                                <li><img src="/attribute/4.png" alt=""><span>Pushes you to be Better</span></li>
                                                <li><img src="/attribute/5.png" alt=""><span>Extension of your Parents</span></li>
                                                <li><img src="/attribute/6.png" alt=""><span>Earns your Respect</span></li>
                                                <li><img src="/attribute/7.png" alt=""><span>Remembers their promises</span></li>
                                                <li><img src="/attribute/8.png" alt=""><span>Adaptable</span></li>
                                                <li><img src="/attribute/9.png" alt=""><span>Natures your talents</span></li>
                                                <li><img src="/attribute/10.png" alt=""><span>Rides the storm</span></li>
                                            </ul>
                                        </div>

                                        <!-- <ul class="_2coach_main_right_list">
                                            <li>
                                                <i class="fab fa-algolia"></i>
                                                Health Score 55 out of 100
                                            </li>

                                            <li>
                                                <i class="fab fa-algolia"></i>
                                                Delivery No
                                            </li>

                                            <li>
                                                <i class="fab fa-algolia"></i>
                                            Accepts Credit Cards Yes
                                            </li>

                                            <li>
                                                <i class="fab fa-algolia"></i>
                                                Paking Private Lot
                                            </li>
                                        </ul>

                                        <ul class="_2coach_main_right_list">
                                            <li>
                                                <i class="fab fa-algolia"></i>
                                                Health Score 55 out of 100
                                            </li>

                                            <li>
                                                <i class="fab fa-algolia"></i>
                                                Delivery No
                                            </li>

                                            <li>
                                                <i class="fab fa-algolia"></i>
                                                Accepts Credit Cards Yes
                                            </li>

                                            <li>
                                                <i class="fab fa-algolia"></i>
                                                Paking Private Lot
                                            </li>
                                        </ul> -->
                                    </div>
                                </div>
                                <!-- Right -->
                            </div>
                        </div>
                    </div>
                    <div class="_1coach_items" v-if="pageOptinoInfo == 'school'"  v-for="(item,index) in searchData" :key="index"  >
                        <p class="worst yellow">{{ (item.avg_rating>=3)? 'Best Rated' : 'Worst Rated'}}</p>

                        <div class="_2coach_main">
                            <div class="row">
                                <!-- Left -->
                                <div class="col-xl-12 col-md-12 col-lg-7 _2coach_main_left">
                                    <div class="_2card">
                                        <div class="_2card_pic">
                                            <img class="_2card_img" src="/images/ps.png" alt="" title="">
                                        </div>

                                        <div class="_2card_details">
                                            <div class="_2card_details_top">
                                                <div class="_2card_details_left">
                                                    <p class="_2title" style=" cursor: pointer; "  @click="$router.push(`/school/${item.id}`)" >{{item.schoolName}} {{item.sport}} </p>
                                                    <div class="_1rating">
                                                        <ul class="_1rating_list">
                                                            <li :class="(item.avgRating.averageRating>0)? '_1rating_active' : ''"><i class="fas fa-star"></i></li>
                                                            <li :class="(item.avgRating.averageRating>1)? '_1rating_active' : ''" ><i class="fas fa-star"></i></li>
                                                            <li :class="(item.avgRating.averageRating>2)? '_1rating_active' : ''" ><i class="fas fa-star"></i></li>
                                                            <li :class="(item.avgRating.averageRating>3)? '_1rating_active' : ''" ><i class="fas fa-star"></i></li>
                                                            <li :class="(item.avgRating.averageRating>4)? '_1rating_active' : ''" ><i class="fas fa-star"></i></li>
                                                            <li class="_1rating_num"><span> <i class="fas fa-chevron-down"></i> </span> {{item.__meta__.allreview}}</li>
                                                        </ul>
                                                    </div>
                                                </div>

                                                <p class="_2card_details_city">{{item.city}}/{{item.state}}</p>
                                            </div>
                                            <p class="_2card_status _2taxt">
                                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
                                                    Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi u"
                                            </p>

                                            <p>
                                                <a href="" class="see_more">See more</a>
                                            </p>

                                            <!-- <button @click="$router.push(`/scoach_review/${item.id}`)" class="_1btn">Write a Review</button> -->
                                        </div>
                                    </div>
                                </div>
                                <!-- Left -->

                                <!-- Right -->
                                <div class="col-xl-12 col-md-12 col-lg-5 _2coach_main_right">
                                    <div class="_2coach_title">
                                        <p class="_2coach_title_one">Health Score:</p>

                                        <p class="_2coach_title_two _2coach_title_two_red"> 10.00
                                            
                                            <!-- <span>91.98%</span> -->
                                        
                                        </p>
                                    </div>

                               
                                </div>
                                <!-- Right -->
                            </div>
                        </div>
                    </div>
                    <div class="_1coach_items" v-if="pageOptinoInfo == 'legend'"  v-for="(item,index) in searchData" :key="index"  >
                        <p class="worst yellow">{{ (item.avg_rating>=3)? 'Best Rated' : 'Worst Rated'}}</p>

                        <div class="_2coach_main">
                            <div class="row">
                                <!-- Left -->
                                <div class="col-xl-12 col-md-12 col-lg-7 _2coach_main_left">
                                    <div class="_2card">
                                        <div class="_2card_pic">
                                            <img class="_2card_img" src="/images/ps.png" alt="" title="">
                                        </div>

                                        <div class="_2card_details">
                                            <div class="_2card_details_top">
                                                <div class="_2card_details_left">
                                                    <p class="_2title" style=" cursor: pointer; "  @click="$router.push(`/profile/${item.id}`)" >{{item.name}} - </p>
                                                    <div class="_1rating">
                                                        <ul class="_1rating_list">
                                                            <li :class="(item.avgRating.averageRating>0)? '_1rating_active' : ''"><i class="fas fa-star"></i></li>
                                                            <li :class="(item.avgRating.averageRating>1)? '_1rating_active' : ''" ><i class="fas fa-star"></i></li>
                                                            <li :class="(item.avgRating.averageRating>2)? '_1rating_active' : ''" ><i class="fas fa-star"></i></li>
                                                            <li :class="(item.avgRating.averageRating>3)? '_1rating_active' : ''" ><i class="fas fa-star"></i></li>
                                                            <li :class="(item.avgRating.averageRating>4)? '_1rating_active' : ''" ><i class="fas fa-star"></i></li>
                                                            <li class="_1rating_num"><span> <i class="fas fa-chevron-down"></i> </span> {{item.__meta__.allreview}}</li>
                                                        </ul>
                                                    </div>
                                                </div>

                                                <p class="_2card_details_city">{{item.address}}</p>
                                            </div>
                                            <p class="_2card_status _2taxt">
                                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
                                                    Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi u"
                                            </p>

                                            <p>
                                                <a href="" class="see_more">See more</a>
                                            </p>

                                            <!-- <button @click="$router.push(`/scoach_review/${item.id}`)" class="_1btn">Write a Review</button> -->
                                        </div>
                                    </div>
                                </div>
                                <!-- Left -->

                                <!-- Right -->
                                <div class="col-xl-12 col-md-12 col-lg-5 _2coach_main_right">
                                    <div class="_2coach_title">
                                        <p class="_2coach_title_one">Health Score:</p>

                                        <p class="_2coach_title_two _2coach_title_two_red">10.00
                                            
                                            <!-- <span>91.98%</span> -->
                                        
                                        </p>
                                    </div>

                                    <div class="_2coach_main_right_main">
                                        <p class="_2coach_main_right_title">Known for:</p>

                                        <!-- <ul class="coach-main-known-list">
                                            <li>
                                                <figure>
                                                    <img src="/images/plus.gif" alt="">
                                                </figure>
                                                <p>Health Score<span>55 out of 100</span></p>
                                            </li>
                                            <li>
                                                <figure>
                                                    <img src="/images/plus.gif" alt="">
                                                </figure>
                                                <p>Health Score<span>55 out of 100</span></p>
                                            </li>
                                            <li>
                                                <figure>
                                                    <img src="/images/veh.gif" alt="">
                                                </figure>
                                                <p>Delivery<span>No</span></p>
                                            </li>
                                            <li>
                                                <figure>
                                                    <img src="/images/veh.gif" alt="">
                                                </figure>
                                                <p>Delivery<span>No</span></p>
                                            </li>
                                        </ul> -->
                                         <div class="known-for-list">
                                            <ul>
                                                <li><img src="/attribute/1.png" alt=""><span>Health Score</span></li>
                                                <li><img src="/attribute/2.png" alt=""><span>Great Communicator</span></li>
                                                <li><img src="/attribute/3.png" alt=""><span>Creates a Healthy Environment</span></li>
                                                <li><img src="/attribute/4.png" alt=""><span>Pushes you to be Better</span></li>
                                                <li><img src="/attribute/5.png" alt=""><span>Extension of your Parents</span></li>
                                                <li><img src="/attribute/6.png" alt=""><span>Earns your Respect</span></li>
                                                <li><img src="/attribute/7.png" alt=""><span>Remembers their promises</span></li>
                                                <li><img src="/attribute/8.png" alt=""><span>Adaptable</span></li>
                                                <li><img src="/attribute/9.png" alt=""><span>Natures your talents</span></li>
                                                <li><img src="/attribute/10.png" alt=""><span>Rides the storm</span></li>
                                            </ul>
                                        </div>

                                        
                                    </div>
                                </div>
                                <!-- Right -->
                            </div>
                        </div>
                    </div>
                    <div class="_1coach_items" v-if="pageOptinoInfo == 'product'"  v-for="(item,index) in searchData" :key="index"  >
                        <p class="worst yellow">{{ (item.avg_rating>=3)? 'Best Rated' : 'Worst Rated'}}</p>

                        <div class="_2coach_main">
                            <div class="row">
                                <!-- Left -->
                                <div class="col-xl-12 col-md-12 col-lg-7 _2coach_main_left">
                                    <div class="_2card">
                                        <div class="_2card_pic">
                                            <img class="_2card_img" src="/images/ps.png" alt="" title="">
                                        </div>

                                        <div class="_2card_details">
                                            <div class="_2card_details_top">
                                                <div class="_2card_details_left">
                                                    <p class="_2title" style=" cursor: pointer; "  @click="$router.push(`/product/${item.id}`)" >{{item.name}} </p>
                                                    <div class="_1rating">
                                                        <ul class="_1rating_list">
                                                            <li :class="(item.avgRating.averageRating>0)? '_1rating_active' : ''"><i class="fas fa-star"></i></li>
                                                            <li :class="(item.avgRating.averageRating>1)? '_1rating_active' : ''" ><i class="fas fa-star"></i></li>
                                                            <li :class="(item.avgRating.averageRating>2)? '_1rating_active' : ''" ><i class="fas fa-star"></i></li>
                                                            <li :class="(item.avgRating.averageRating>3)? '_1rating_active' : ''" ><i class="fas fa-star"></i></li>
                                                            <li :class="(item.avgRating.averageRating>4)? '_1rating_active' : ''" ><i class="fas fa-star"></i></li>
                                                            <li class="_1rating_num"><span> <i class="fas fa-chevron-down"></i> </span> {{item.__meta__.allreview}}</li>
                                                        </ul>
                                                    </div>
                                                </div>

                                                <p class="_2card_details_city">{{item.address}}</p>
                                            </div>
                                            <p class="_2card_status _2taxt">
                                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
                                                    Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi u"
                                            </p>

                                            <p>
                                                <a href="" class="see_more">See more</a>
                                            </p>

                                            <!-- <button @click="$router.push(`/scoach_review/${item.id}`)" class="_1btn">Write a Review</button> -->
                                        </div>
                                    </div>
                                </div>
                                <!-- Left -->

                                <!-- Right -->
                                <div class="col-xl-12 col-md-12 col-lg-5 _2coach_main_right"> 
                                    <div class="_2coach_title">
                                        <p class="_2coach_title_one">Health Score:</p>

                                        <p class="_2coach_title_two _2coach_title_two_red"> 10.00
                                            
                                            <!-- <span>91.98%</span> -->
                                        
                                        </p>
                                    </div>
                                </div>
                                <!-- Right -->
                            </div>
                        </div>
                    </div>
                </div>

                <div class="_1coach_items">
                    <div class="_1coach_top">
                        <div class="_1coach_top_pic">
                            <img class="_1coach_top_img" src="images/fla.png" alt="" title="">
                        </div>

                        <div class="_1coach_top_right">
                            <p class="_1title">Editorial recommendations</p>

                            <p class="_1coach_top_by">By <a href="">Flank</a> | </p>
                        </div>
                    </div>

                    <div class="_1coach_main">
                        <div class="row">
                            <div class="col-xl-12 col-md-6 col-lg-3">
                                <div class="_1coach_main_one">
                                    <p class="_1title">Best Coach Reviews: The Ultimate List</p>

                                    <p class="_1coach_time">Sept,11,2019</p>

                                    <p class="_1coach_status">
                                        Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do 
                                        eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim
                                        ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut
                                        aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit
                                        in voluptate velit esse cillum dolore eu fugiat nulla pariatur.
                                        Excepteur sint occaecat cupidatat non proident, sunt in culpa qui
                                        officia deserunt mollit anim id est laborum.
                                    </p>
                                </div>
                            </div>

                            <!-- Card Items -->
                            <div class="col-xl-12 col-md-6 col-lg-3">
                                <div class="_1card">
                                    <p class="_2title">Our Top Choice</p>

                                    <p class="_1card_subtitle">Coach Name - Sport Type City/State</p>

                                    <div class="_1card_pic">
                                        <img class="_1card_img" src="/images/ps.png" alt="" title="">
                                    </div>

                                    <div class="_1card_details">
                                        <p class="_3title">Coach Name - Sport Type City/State</p>
                                        <div class="_1rating">
                                            <ul class="_1rating_list">
                                                <li class="_1rating_active"><i class="fas fa-star"></i></li>
                                                <li class="_1rating_active"><i class="fas fa-star"></i></li>
                                                <li class="_1rating_active"><i class="fas fa-star"></i></li>
                                                <li class="_1rating_active"><i class="fas fa-star"></i></li>
                                                <li class=""><i class="fas fa-star"></i></li>
                                                <li class="_1rating_num"><span> <i class="fas fa-chevron-down"></i> </span> 10</li>
                                            </ul>
                                        </div>
                                        <p class="_1card_tag">67.0 Health Seore</p>
                                        <p class="_1text">
                                            When you're after a true empowering coach
                                            , coach Jhon Doe nails all the healthy coaching attributes.
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <!-- Card Items -->

                            <!-- Card Items -->
                            <div class="col-xl-12 col-md-6 col-lg-3">
                                <div class="_1card">
                                    <p class="_2title">Our Top Choice</p>

                                    <p class="_1card_subtitle">Coach Name - Sport Type City/State</p>

                                    <div class="_1card_pic">
                                        <img class="_1card_img" src="/images/ps.png" alt="" title="">
                                    </div>

                                    <div class="_1card_details">
                                        <p class="_3title">Coach Name - Sport Type City/State</p>
                                        <div class="_1rating">
                                            <ul class="_1rating_list">
                                                <li class="_1rating_active"><i class="fas fa-star"></i></li>
                                                <li class="_1rating_active"><i class="fas fa-star"></i></li>
                                                <li class="_1rating_active"><i class="fas fa-star"></i></li>
                                                <li class="_1rating_active"><i class="fas fa-star"></i></li>
                                                <li class=""><i class="fas fa-star"></i></li>
                                                <li class="_1rating_num"><span> <i class="fas fa-chevron-down"></i> </span> 10</li>
                                            </ul>
                                        </div>
                                        <p class="_1card_tag">67.0 Health Seore</p>
                                        <p class="_1text">
                                            When you're after a true empowering coach
                                            , coach Jhon Doe nails all the healthy coaching attributes.
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <!-- Card Items -->

                            <!-- Card Items -->
                            <div class="col-xl-12 col-md-6 col-lg-3">
                                <div class="_1card">
                                    <p class="_2title">Our Top Choice</p>

                                    <p class="_1card_subtitle">Coach Name - Sport Type City/State</p>

                                    <div class="_1card_pic">
                                        <img class="_1card_img" src="/images/ps.png" alt="" title="">
                                    </div>

                                    <div class="_1card_details">
                                        <p class="_3title">Coach Name - Sport Type City/State</p>
                                        <div class="_1rating">
                                            <ul class="_1rating_list">
                                                <li class="_1rating_active"><i class="fas fa-star"></i></li>
                                                <li class="_1rating_active"><i class="fas fa-star"></i></li>
                                                <li class="_1rating_active"><i class="fas fa-star"></i></li>
                                                <li class="_1rating_active"><i class="fas fa-star"></i></li>
                                                <li class=""><i class="fas fa-star"></i></li>
                                                <li class="_1rating_num"><span> <i class="fas fa-chevron-down"></i> </span> 10</li>
                                            </ul>
                                        </div>
                                        <p class="_1card_tag">67.0 Health Seore</p>
                                        <p class="_1text">
                                            When you're after a true empowering coach
                                            , coach Jhon Doe nails all the healthy coaching attributes.
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <!-- Card Items -->
                        </div>
                    </div>
                </div>

                <div v-if="!isLoading && searchData.length>0" >

                    <div class="_1coach_items"   v-for="(item,index) in similar" :key="index" v-if="pageOptinoInfo == 'coach' && ((index%2) == 0)"  >
                        <p class="worst yellow">{{ (item.avg_rating>=3)? 'Best Rated' : 'Worst Rated'}}</p>

                        <div class="_2coach_main">
                            <div class="row">
                                <!-- Left -->
                                <div class="col-xl-12 col-md-12 col-lg-7 _2coach_main_left">
                                    <div class="_2card">
                                        <div class="_2card_pic">
                                            <img class="_2card_img" src="/images/ps.png" alt="" title="">
                                        </div>

                                        <div class="_2card_details">
                                            <div class="_2card_details_top">
                                                <div class="_2card_details_left">
                                                    <p class="_2title" style=" cursor: pointer; "  @click="$router.push(`/school_coach/${item.id}`)" >{{item.name}} -  {{item.school.sport}} </p>
                                                    <div class="_1rating">
                                                        <ul class="_1rating_list">
                                                            <li :class="(item.avg_rating>0)? '_1rating_active' : ''"><i class="fas fa-star"></i></li>
                                                            <li :class="(item.avg_rating>1)? '_1rating_active' : ''" ><i class="fas fa-star"></i></li>
                                                            <li :class="(item.avg_rating>2)? '_1rating_active' : ''" ><i class="fas fa-star"></i></li>
                                                            <li :class="(item.avg_rating>3)? '_1rating_active' : ''" ><i class="fas fa-star"></i></li>
                                                            <li :class="(item.avg_rating>4)? '_1rating_active' : ''" ><i class="fas fa-star"></i></li>
                                                            <li class="_1rating_num"><span> <i class="fas fa-chevron-down"></i> </span> {{item.__meta__.allreview}}</li>
                                                        </ul>
                                                    </div>
                                                </div>

                                                <p class="_2card_details_city">{{item.school.city}}/{{item.school.state}}</p>
                                            </div>
                                            <p class="_2card_status _2taxt">
                                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
                                                    Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi u"
                                            </p>

                                            <p>
                                                <a href="" class="see_more">See more</a>
                                            </p>

                                            <button @click="$router.push(`/scoach_review/${item.id}`)" class="_1btn">Write a Review</button>
                                        </div>
                                    </div>
                                </div>
                                <!-- Left -->

                                <!-- Right -->
                                <div class="col-xl-12 col-md-12 col-lg-5 _2coach_main_right">
                                    <div class="_2coach_title">
                                        <p class="_2coach_title_one">Health Score:</p>

                                        <p class="_2coach_title_two _2coach_title_two_red"> {{ item | healthScore }}
                                            
                                            <!-- <span>91.98%</span> -->
                                        
                                        </p>
                                    </div>

                                    <div class="_2coach_main_right_main"   @click="$router.push(`/school_coach/${item.id}`)">
                                        <p class="_2coach_main_right_title">Known for:</p>

                                        <!-- <ul class="coach-main-known-list"  >
                                            <li  v-for="(item,index) in item.topAtrribute" :key="index">
                                                <figure>
                                                    <img :src="item.info.image" alt="">
                                                </figure>
                                                <p>{{item.info.content}}</p>
                                            </li>
                                        </ul> -->
                                         <div class="known-for-list">
                                            <ul>
                                                <li><img src="/attribute/1.png" alt=""><span>Health Score</span></li>
                                                <li><img src="/attribute/2.png" alt=""><span>Great Communicator</span></li>
                                                <li><img src="/attribute/3.png" alt=""><span>Creates a Healthy Environment</span></li>
                                                <li><img src="/attribute/4.png" alt=""><span>Pushes you to be Better</span></li>
                                                <li><img src="/attribute/5.png" alt=""><span>Extension of your Parents</span></li>
                                                <li><img src="/attribute/6.png" alt=""><span>Earns your Respect</span></li>
                                                <li><img src="/attribute/7.png" alt=""><span>Remembers their promises</span></li>
                                                <li><img src="/attribute/8.png" alt=""><span>Adaptable</span></li>
                                                <li><img src="/attribute/9.png" alt=""><span>Natures your talents</span></li>
                                                <li><img src="/attribute/10.png" alt=""><span>Rides the storm</span></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <!-- Right -->
                            </div>
                        </div>
                    </div>
                    <div class="_1coach_items" v-for="(item,index) in similar" :key="index"  v-if="pageOptinoInfo == 'school' && ((index%2) == 0) "  >
                        <p class="worst yellow">{{ (item.avg_rating>=3)? 'Best Rated' : 'Worst Rated'}}</p>

                        <div class="_2coach_main">
                            <div class="row">
                                <!-- Left -->
                                <div class="col-xl-12 col-md-12 col-lg-7 _2coach_main_left">
                                    <div class="_2card">
                                        <div class="_2card_pic">
                                            <img class="_2card_img" src="/images/ps.png" alt="" title="">
                                        </div>

                                        <div class="_2card_details">
                                            <div class="_2card_details_top">
                                                <div class="_2card_details_left">
                                                    <p class="_2title" style=" cursor: pointer; "  @click="$router.push(`/school/${item.id}`)" >{{item.schoolName}} {{item.sport}} </p>
                                                    <div class="_1rating">
                                                        <ul class="_1rating_list">
                                                            <li :class="(item.avgRating.averageRating>0)? '_1rating_active' : ''"><i class="fas fa-star"></i></li>
                                                            <li :class="(item.avgRating.averageRating>1)? '_1rating_active' : ''" ><i class="fas fa-star"></i></li>
                                                            <li :class="(item.avgRating.averageRating>2)? '_1rating_active' : ''" ><i class="fas fa-star"></i></li>
                                                            <li :class="(item.avgRating.averageRating>3)? '_1rating_active' : ''" ><i class="fas fa-star"></i></li>
                                                            <li :class="(item.avgRating.averageRating>4)? '_1rating_active' : ''" ><i class="fas fa-star"></i></li>
                                                            <li class="_1rating_num"><span> <i class="fas fa-chevron-down"></i> </span> {{item.__meta__.allreview}}</li>
                                                        </ul>
                                                    </div>
                                                </div>

                                                <p class="_2card_details_city">{{item.city}}/{{item.state}}</p>
                                            </div>
                                            <p class="_2card_status _2taxt">
                                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
                                                    Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi u"
                                            </p>

                                            <p>
                                                <a href="" class="see_more">See more</a>
                                            </p>

                                            <!-- <button @click="$router.push(`/scoach_review/${item.id}`)" class="_1btn">Write a Review</button> -->
                                        </div>
                                    </div>
                                </div>
                                <!-- Left -->

                                <!-- Right -->
                                <div class="col-xl-12 col-md-12 col-lg-5 _2coach_main_right">
                                    <div class="_2coach_title">
                                        <p class="_2coach_title_one">Health Score:</p>

                                        <p class="_2coach_title_two _2coach_title_two_red"> 10.00
                                            
                                            <!-- <span>91.98%</span> -->
                                        
                                        </p>
                                    </div>
                                </div>
                                <!-- Right -->
                            </div>
                        </div>
                    </div>
                    <div class="_1coach_items" v-for="(item,index) in similar" :key="index"  v-if="pageOptinoInfo == 'legend' && ((index%2) == 0)   "  >
                        <p class="worst yellow">{{ (item.avg_rating>=3)? 'Best Rated' : 'Worst Rated'}}</p>

                        <div class="_2coach_main">
                            <div class="row">
                                <!-- Left -->
                                <div class="col-xl-12 col-md-12 col-lg-7 _2coach_main_left">
                                    <div class="_2card">
                                        <div class="_2card_pic">
                                            <img class="_2card_img" src="/images/ps.png" alt="" title="">
                                        </div>

                                        <div class="_2card_details">
                                            <div class="_2card_details_top">
                                                <div class="_2card_details_left">
                                                    <p class="_2title" style=" cursor: pointer; "  @click="$router.push(`/profile/${item.id}`)" >{{item.name}} - </p>
                                                    <div class="_1rating">
                                                        <ul class="_1rating_list">
                                                            <li :class="(item.avgRating.averageRating>0)? '_1rating_active' : ''"><i class="fas fa-star"></i></li>
                                                            <li :class="(item.avgRating.averageRating>1)? '_1rating_active' : ''" ><i class="fas fa-star"></i></li>
                                                            <li :class="(item.avgRating.averageRating>2)? '_1rating_active' : ''" ><i class="fas fa-star"></i></li>
                                                            <li :class="(item.avgRating.averageRating>3)? '_1rating_active' : ''" ><i class="fas fa-star"></i></li>
                                                            <li :class="(item.avgRating.averageRating>4)? '_1rating_active' : ''" ><i class="fas fa-star"></i></li>
                                                            <li class="_1rating_num"><span> <i class="fas fa-chevron-down"></i> </span> {{item.__meta__.allreview}}</li>
                                                        </ul>
                                                    </div>
                                                </div>

                                                <p class="_2card_details_city">{{item.address}}</p>
                                            </div>
                                            <p class="_2card_status _2taxt">
                                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
                                                    Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi u"
                                            </p>

                                            <p>
                                                <a href="" class="see_more">See more</a>
                                            </p>

                                            <!-- <button @click="$router.push(`/scoach_review/${item.id}`)" class="_1btn">Write a Review</button> -->
                                        </div>
                                    </div>
                                </div>
                                <!-- Left -->

                                <!-- Right -->
                                <div class="col-xl-12 col-md-12 col-lg-5 _2coach_main_right">
                                    <div class="_2coach_title">
                                        <p class="_2coach_title_one">Health Score:</p>

                                        <p class="_2coach_title_two _2coach_title_two_red">10.00
                                            
                                            <!-- <span>91.98%</span> -->
                                        
                                        </p>
                                    </div>

                                    <!-- <div class="_2coach_main_right_main">
                                        <p class="_2coach_main_right_title">Known for:</p>

                                        <ul class="coach-main-known-list">
                                            <li>
                                                <figure>
                                                    <img src="/images/plus.gif" alt="">
                                                </figure>
                                                <p>Health Score<span>55 out of 100</span></p>
                                            </li>
                                            <li>
                                                <figure>
                                                    <img src="/images/plus.gif" alt="">
                                                </figure>
                                                <p>Health Score<span>55 out of 100</span></p>
                                            </li>
                                            <li>
                                                <figure>
                                                    <img src="/images/veh.gif" alt="">
                                                </figure>
                                                <p>Delivery<span>No</span></p>
                                            </li>
                                            <li>
                                                <figure>
                                                    <img src="/images/veh.gif" alt="">
                                                </figure>
                                                <p>Delivery<span>No</span></p>
                                            </li>
                                        </ul>
                                    </div> -->
                                </div>
                                <!-- Right -->
                            </div>
                        </div>
                    </div>
                    
                </div>



                <div class="_1coach_items"  >
                    <div class="_1coach_barch">
                        <p class="worst black">Flank's <span>Chocie</span></p>
                        <p class="_1title">Higly rated, sustainable instructors that benefit the players communities where they coach</p>
                    </div>

                    <div class="_2coach_main">
                        <div class="row">
                            <!-- Card -->
                            <div class="col-xl-12 col-md-3 col-lg-3">
                                <div class="_1card">
                                    <p class="_1card_star">4 Stars & Up</p>

                                    <div class="_1card_pic">
                                        <img class="_1card_img" src="/images/ps.png" alt="" title="">
                                    </div>

                                    <div class="_1card_details">
                                        <p class="_3title">Coach Name - Sport Type City/State</p>
                                        <div class="_1rating">
                                            <ul class="_1rating_list">
                                                <li class="_1rating_active"><i class="fas fa-star"></i></li>
                                                <li class="_1rating_active"><i class="fas fa-star"></i></li>
                                                <li class="_1rating_active"><i class="fas fa-star"></i></li>
                                                <li class="_1rating_active"><i class="fas fa-star"></i></li>
                                                <li class=""><i class="fas fa-star"></i></li>
                                                <li class="_1rating_num"><span> <i class="fas fa-chevron-down"></i> </span>10</li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Card -->

                            <!-- Card -->
                            <div class="col-xl-12 col-md-3 col-lg-3">
                                <div class="_1card">
                                    <p class="_1card_star">3 Stars & Up</p>

                                    <div class="_1card_pic">
                                        <img class="_1card_img" src="/images/ps.png" alt="" title="">
                                    </div>

                                    <div class="_1card_details">
                                        <p class="_3title">Coach Name - Sport Type City/State</p>
                                        <div class="_1rating">
                                            <ul class="_1rating_list">
                                                <li class="_1rating_active"><i class="fas fa-star"></i></li>
                                                <li class="_1rating_active"><i class="fas fa-star"></i></li>
                                                <li class="_1rating_active"><i class="fas fa-star"></i></li>
                                                <li class=""><i class="fas fa-star"></i></li>
                                                <li class=""><i class="fas fa-star"></i></li>
                                                <li class="_1rating_num"><span> <i class="fas fa-chevron-down"></i> </span> 10</li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Card -->

                            <!-- Card -->
                            <div class="col-xl-12 col-md-3 col-lg-3">
                                <div class="_1card">
                                    <p class="_1card_star">2 Stars & Up</p>

                                    <div class="_1card_pic">
                                        <img class="_1card_img" src="/images/ps.png" alt="" title="">
                                    </div>

                                    <div class="_1card_details">
                                        <p class="_3title">Coach Name - Sport Type City/State</p>
                                        <div class="_1rating">
                                            <ul class="_1rating_list">
                                                <li class="_1rating_active"><i class="fas fa-star"></i></li>
                                                <li class="_1rating_active"><i class="fas fa-star"></i></li>
                                                <li class=""><i class="fas fa-star"></i></li>
                                                <li class=""><i class="fas fa-star"></i></li>
                                                <li class=""><i class="fas fa-star"></i></li>
                                                <li class="_1rating_num"><span> <i class="fas fa-chevron-down"></i> </span>10</li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Card -->

                            <!-- Card -->
                            <div class="col-xl-12 col-md-3 col-lg-3">
                                <div class="_1card">
                                    <p class="_1card_star">1 Stars & Up</p>

                                    <div class="_1card_pic">
                                        <img class="_1card_img" src="/images/ps.png" alt="" title="">
                                    </div>

                                    <div class="_1card_details">
                                        <p class="_3title">Coach Name - Sport Type City/State</p>
                                        <div class="_1rating">
                                            <ul class="_1rating_list">
                                                <li class="_1rating_active"><i class="fas fa-star"></i></li>
                                                <li class=""><i class="fas fa-star"></i></li>
                                                <li class=""><i class="fas fa-star"></i></li>
                                                <li class=""><i class="fas fa-star"></i></li>
                                                <li class=""><i class="fas fa-star"></i></li>
                                                <li class="_1rating_num"><span> <i class="fas fa-chevron-down"></i> </span> 10</li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Card -->
                        </div>
                    </div>
                </div>

                 <div v-if="!isLoading && searchData.length>0" >

                    <div class="_1coach_items"  v-for="(item,index) in searchData" :key="index" v-if="pageOptinoInfo == 'coach' && ((index%2) != 0)"   >
                        <p class="worst yellow">{{ (item.avg_rating>=3)? 'Best Rated' : 'Worst Rated'}}</p>

                        <div class="_2coach_main">
                            <div class="row">
                                <!-- Left -->
                                <div class="col-xl-12 col-md-12 col-lg-7 _2coach_main_left">
                                    <div class="_2card">
                                        <div class="_2card_pic">
                                            <img class="_2card_img" src="/images/ps.png" alt="" title="">
                                        </div>

                                        <div class="_2card_details">
                                            <div class="_2card_details_top">
                                                <div class="_2card_details_left">
                                                    <p class="_2title" style=" cursor: pointer; "  @click="$router.push(`/school_coach/${item.id}`)" >{{item.name}} -  {{item.school.sport}}  </p>
                                                    <div class="_1rating">
                                                        <ul class="_1rating_list">
                                                            <li :class="(item.avg_rating>0)? '_1rating_active' : ''"><i class="fas fa-star"></i></li>
                                                            <li :class="(item.avg_rating>1)? '_1rating_active' : ''" ><i class="fas fa-star"></i></li>
                                                            <li :class="(item.avg_rating>2)? '_1rating_active' : ''" ><i class="fas fa-star"></i></li>
                                                            <li :class="(item.avg_rating>3)? '_1rating_active' : ''" ><i class="fas fa-star"></i></li>
                                                            <li :class="(item.avg_rating>4)? '_1rating_active' : ''" ><i class="fas fa-star"></i></li>
                                                            <li class="_1rating_num"><span> <i class="fas fa-chevron-down"></i> </span> {{item.__meta__.allreview}}</li>
                                                        </ul>
                                                    </div>
                                                </div>

                                                <p class="_2card_details_city">{{item.school.city}}/{{item.school.state}}</p>
                                            </div>
                                            <p class="_2card_status _2taxt">
                                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
                                                    Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi u"
                                            </p>

                                            <p>
                                                <a href="" class="see_more">See more</a>
                                            </p>

                                            <button @click="$router.push(`/scoach_review/${item.id}`)" class="_1btn">Write a Review</button>
                                        </div>
                                    </div>
                                </div>
                                <!-- Left -->

                                <!-- Right -->
                                <div class="col-xl-12 col-md-12 col-lg-5 _2coach_main_right">
                                    <div class="_2coach_title">
                                        <p class="_2coach_title_one">Health Score:</p>

                                        <p class="_2coach_title_two _2coach_title_two_red"> {{ item | healthScore }}
                                            
                                            <!-- <span>91.98%</span> -->
                                        
                                        </p>
                                    </div>

                                    <div class="_2coach_main_right_main"   @click="$router.push(`/school_coach/${item.id}`)">
                                        <p class="_2coach_main_right_title">Known for:</p>

                                        <!-- <ul class="coach-main-known-list"  >
                                            <li  v-for="(item,index) in item.topAtrribute" :key="index">
                                                <figure>
                                                    <img :src="item.info.image" alt="">
                                                </figure>
                                                <p>{{item.info.content}}</p>
                                            </li>
                                          
                                        </ul> -->

                                         <div class="known-for-list">
                                            <ul>
                                                <li><img src="/attribute/1.png" alt=""><span>Health Score</span></li>
                                                <li><img src="/attribute/2.png" alt=""><span>Great Communicator</span></li>
                                                <li><img src="/attribute/3.png" alt=""><span>Creates a Healthy Environment</span></li>
                                                <li><img src="/attribute/4.png" alt=""><span>Pushes you to be Better</span></li>
                                                <li><img src="/attribute/5.png" alt=""><span>Extension of your Parents</span></li>
                                                <li><img src="/attribute/6.png" alt=""><span>Earns your Respect</span></li>
                                                <li><img src="/attribute/7.png" alt=""><span>Remembers their promises</span></li>
                                                <li><img src="/attribute/8.png" alt=""><span>Adaptable</span></li>
                                                <li><img src="/attribute/9.png" alt=""><span>Natures your talents</span></li>
                                                <li><img src="/attribute/10.png" alt=""><span>Rides the storm</span></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <!-- Right -->
                            </div>
                        </div>
                    </div>
                    <div class="_1coach_items" v-for="(item,index) in searchData" :key="index"  v-if="pageOptinoInfo == 'school' && ((index%2) != 0)" >
                        <p class="worst yellow">{{ (item.avg_rating>=3)? 'Best Rated' : 'Worst Rated'}}</p>

                        <div class="_2coach_main">
                            <div class="row">
                                <!-- Left -->
                                <div class="col-xl-12 col-md-12 col-lg-7 _2coach_main_left">
                                    <div class="_2card">
                                        <div class="_2card_pic">
                                            <img class="_2card_img" src="/images/ps.png" alt="" title="">
                                        </div>

                                        <div class="_2card_details">
                                            <div class="_2card_details_top">
                                                <div class="_2card_details_left">
                                                    <p class="_2title" style=" cursor: pointer; "  @click="$router.push(`/school/${item.id}`)" >{{item.schoolName}} {{item.sport}} </p>
                                                    <div class="_1rating">
                                                        <ul class="_1rating_list">
                                                            <li :class="(item.avgRating.averageRating>0)? '_1rating_active' : ''"><i class="fas fa-star"></i></li>
                                                            <li :class="(item.avgRating.averageRating>1)? '_1rating_active' : ''" ><i class="fas fa-star"></i></li>
                                                            <li :class="(item.avgRating.averageRating>2)? '_1rating_active' : ''" ><i class="fas fa-star"></i></li>
                                                            <li :class="(item.avgRating.averageRating>3)? '_1rating_active' : ''" ><i class="fas fa-star"></i></li>
                                                            <li :class="(item.avgRating.averageRating>4)? '_1rating_active' : ''" ><i class="fas fa-star"></i></li>
                                                            <li class="_1rating_num"><span> <i class="fas fa-chevron-down"></i> </span> {{item.__meta__.allreview}}</li>
                                                        </ul>
                                                    </div>
                                                </div>

                                                <p class="_2card_details_city">{{item.city}}/{{item.state}}</p>
                                            </div>
                                            <p class="_2card_status _2taxt">
                                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
                                                    Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi u"
                                            </p>

                                            <p>
                                                <a href="" class="see_more">See more</a>
                                            </p>

                                            <!-- <button @click="$router.push(`/scoach_review/${item.id}`)" class="_1btn">Write a Review</button> -->
                                        </div>
                                    </div>
                                </div>
                                <!-- Left -->

                                <!-- Right -->
                                <div class="col-xl-12 col-md-12 col-lg-5 _2coach_main_right">
                                    <div class="_2coach_title">
                                        <p class="_2coach_title_one">Health Score:</p>

                                        <p class="_2coach_title_two _2coach_title_two_red"> 10.00
                                            
                                            <!-- <span>91.98%</span> -->
                                        
                                        </p>
                                    </div>

                                    
                                </div>
                                <!-- Right -->
                            </div>
                        </div>
                    </div>
                    <div class="_1coach_items"  v-for="(item,index) in searchData" :key="index"  v-if="pageOptinoInfo == 'legend' && ((index%2) != 0)" >
                        <p class="worst yellow">{{ (item.avg_rating>=3)? 'Best Rated' : 'Worst Rated'}}</p>

                        <div class="_2coach_main">
                            <div class="row">
                                <!-- Left -->
                                <div class="col-xl-12 col-md-12 col-lg-7 _2coach_main_left">
                                    <div class="_2card">
                                        <div class="_2card_pic">
                                            <img class="_2card_img" src="/images/ps.png" alt="" title="">
                                        </div>

                                        <div class="_2card_details">
                                            <div class="_2card_details_top">
                                                <div class="_2card_details_left">
                                                    <p class="_2title" style=" cursor: pointer; "  @click="$router.push(`/profile/${item.id}`)" >{{item.name}} - </p>
                                                    <div class="_1rating">
                                                        <ul class="_1rating_list">
                                                            <li :class="(item.avgRating.averageRating>0)? '_1rating_active' : ''"><i class="fas fa-star"></i></li>
                                                            <li :class="(item.avgRating.averageRating>1)? '_1rating_active' : ''" ><i class="fas fa-star"></i></li>
                                                            <li :class="(item.avgRating.averageRating>2)? '_1rating_active' : ''" ><i class="fas fa-star"></i></li>
                                                            <li :class="(item.avgRating.averageRating>3)? '_1rating_active' : ''" ><i class="fas fa-star"></i></li>
                                                            <li :class="(item.avgRating.averageRating>4)? '_1rating_active' : ''" ><i class="fas fa-star"></i></li>
                                                            <li class="_1rating_num"><span> <i class="fas fa-chevron-down"></i> </span> {{item.__meta__.allreview}}</li>
                                                        </ul>
                                                    </div>
                                                </div>

                                                <p class="_2card_details_city">{{item.address}}</p>
                                            </div>
                                            <p class="_2card_status _2taxt">
                                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
                                                    Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi u"
                                            </p>

                                            <p>
                                                <a href="" class="see_more">See more</a>
                                            </p>

                                            <!-- <button @click="$router.push(`/scoach_review/${item.id}`)" class="_1btn">Write a Review</button> -->
                                        </div>
                                    </div>
                                </div>
                                <!-- Left -->

                                <!-- Right -->
                                <div class="col-xl-12 col-md-12 col-lg-5 _2coach_main_right">
                                    <div class="_2coach_title">
                                        <p class="_2coach_title_one">Health Score:</p>

                                        <p class="_2coach_title_two _2coach_title_two_red">10.00
                                            
                                            <!-- <span>91.98%</span> -->
                                        
                                        </p>
                                    </div>
                                </div>
                                <!-- Right -->
                            </div>
                        </div>
                    </div>
                   >
                </div>
                
                <div class="_1reiew_box">
                    <p class="_1reiew_box_title">Tell us how can improve</p>

                    <p class="_1reiew_con">If you need help, Please <a href="">visit the help section</a> or contact us below</p>

                    <textarea class="_1reiew_taxtarea" rows="5" placeholder="Your voice is important. Help us make it easier to find the coach you want"></textarea>
                    <button class="_1btn" type="button">Submit</button>
                </div>
            </div>
        </div>
        <div class="backtop">
            <p>Back to top</p>
        </div>



        <footer class="new-footer">
            <div class="new-footer-top"></div>
        </footer>
        <Modal width="850px"  v-model="addNew.modal"  :closable='false' >
           <div class="sss">
                <div class="">
                    <div class="bulid-section build-section-1" v-if="addNew.step == 1" >
                        <div class="build-section-title">
                            <h3>Build together</h3>
                            <div class="build-close" style="cursor:pointer;" @click="addNew.modal = false" >
                                <img src="/images/Step-1.png" alt="">
                            </div>
                        </div>
                        <div class="build-section-inner">
                            <div class="build-section-inner-top">
                                <div class="build-left">
                                    <div class="build-item-box active">
                                        <div class="build-item-box-active">
                                            <span>1</span>
                                        </div>
                                        <p>Add School/Coach</p>
                                    </div>
                                    <div class="build-item-box">
                                        <div class="build-box-round">
                                            <span>2</span>
                                        </div>
                                        <p>Registration</p>
                                    </div>
                                    <div class="build-item-box">
                                        <div class="build-box-round">
                                            <span>3</span>
                                        </div>
                                        <p>Submit Review</p>
                                    </div>
                                    <div class="build-item-box">
                                        <div class="build-box-round">
                                            <span>4</span>
                                        </div>
                                        <p>Confirmation</p>
                                    </div>
                                </div>
                                <div class="build-right">
                                    <div class="build-right-title">
                                        <h3>What are you working on?</h3>
                                        <p>* We’ll guide you step-by-step to add the school/coach you need.</p>
                                    </div>
                                    <div class="build-right-form">
                                        <p>(Avg. Time of Completion - 2 minutes)</p>
                                        <div class="build-right-form-inner">
                                            <form action="#">
                                                <div class="build-input">
                                                    <label for="">School name <span class="required">*</span></label>
                                                    <input type="text" v-model="step1Form.schoolName" >
                                                </div>
                                                <div class="build-input">
                                                    <label for="">Coach name <span class="required">*</span></label>
                                                    <input type="text" v-model="step1Form.name" >
                                                </div>
                                                <div class="build-input">
                                                    <label for="">City <span class="required">*</span></label>
                                                    <input type="text" v-model="step1Form.city" >
                                                </div>
                                                <div class="build-input">
                                                    <label for="">Division <span class="required">*</span></label>
                                                    <select name="" id="" v-model="step1Form.division" >
                                                        <option value="Club/Travel">Club/Travel</option>
                                                        <option value="FL">FL</option>
                                                        <option value="High School">High School</option>
                                                        <option value="Junior College">Junior College</option>
                                                        <option value="MCLA">MCLA</option>
                                                        <option value="MO">MO</option>
                                                        <option value="NAIA">NAIA</option>
                                                        <option value="NCAA DI">NCAA DI</option>
                                                        <option value="NCAA DII">NCAA DII</option>
                                                        <option value="NCAA DIII">NCAA DIII</option>
                                                    </select>
                                                </div>
                                                <div class="build-input">
                                                    <label for="">State <span class="required">*</span></label>
                                                    <input type="text" v-model="step1Form.state" >
                                                </div>
                                                <div class="build-input">
                                                    <label for="">Sport </label>
                                                    <select name="" id="" v-model="step1Form.sport" >
                                                        <option v-for="(item,index) in allSports" :key="index" :value="item.sport">{{item.sport}}</option>
                                                        
                                                    </select>
                                                </div>
                                            </form>
                                            <div class="build-redirect" >
                                                <p>Information submitted on this site is subject to the <a href="#">Privacy Policy.</a></p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- <div class="build-section-inner-bottom">
                                <div class="build-cancel">
                                    <p>Cancel</p>
                                </div>
                                <div class="build-btn">
                                    <ul>
                                        <li><button>Back</button></li>
                                        <li class="go-btn"><button>Next</button></li>
                                    </ul>
                                </div>
                            </div> -->
                        </div>
                    </div>
                    <div class="bulid-section build-section-2"  v-if="addNew.step == 2">
                        <div class="build-section-title">
                            <h3>Build together</h3>
                            <div class="build-close" style="cursor:pointer;" @click="addNew.modal = false" >
                                <img src="/images/Step-1.png" alt="">
                            </div>
                        </div>
                        <div class="build-section-inner">
                            <div class="build-section-inner-top">
                                <div class="build-left">
                                    <div class="build-item-box">
                                        <div class="build-box-round">
                                            <!-- <span>1</span> -->
                                            <img src="/images/conf.png" alt="">
                                        </div>
                                        <p>Add School/Coach</p>
                                    </div>
                                    <div class="build-item-box active">
                                        <div class="build-item-box-active">
                                            <span>2</span>
                                        </div>
                                        <p>Registration/Login</p>
                                    </div>
                                    <div class="build-item-box">
                                        <div class="build-box-round">
                                            <span>3</span>
                                        </div>
                                        <p>Submit Review</p>
                                    </div>
                                    <div class="build-item-box">
                                        <div class="build-box-round">
                                            <span>4</span>
                                        </div>
                                        <p>Confirmation</p>
                                    </div>
                                </div>
                                <div class="build-right">
                                    <div class="build-right-title">
                                        <h3>What are you working on?</h3>
                                        <p>* We’ll guide you step-by-step to add the school/coach you need.</p>
                                    </div>
                                    <div class="build-right-form">
                                        <p>(Avg. Time of Completion - 2 minutes)</p>
                                        <div class="build-right-form-inner" v-if="addNew.isReg " >
                                            <form action="#">
                                                <div class="build-input">
                                                    <label for="">Your First name <span class="required">*</span></label>
                                                    <input type="text" v-model="step2Form.firstName" >
                                                </div>
                                                <div class="build-input">
                                                    <label for="">Your Last name <span class="required">*</span></label>
                                                    <input type="text" v-model="step2Form.lastName">
                                                </div>
                                                <div class="build-input">
                                                    <label for="">Email <span class="required">*</span></label>
                                                    <input type="email" v-model="step2Form.email">
                                                </div>
                                                <!-- <div class="build-input">
                                                    <label for="">Division <span class="required">*</span></label>
                                                    <select name="" id="">
                                                        <option value="one"></option>
                                                        <option value="one"></option>
                                                        <option value="one"></option>
                                                        <option value="one"></option>
                                                    </select>
                                                </div> -->
                                                <div class="build-input">
                                                    <label for="">Password <span class="required">*</span></label>
                                                    <input type="password" v-model="step2Form.password">
                                                </div>
                                                <div class="build-input">
                                                    <label for="">Re-enter password <span class="required">*</span></label>
                                                    <input type="password" v-model="step2Form.password_confirmation">
                                                </div>
                                                <!-- <div class="build-input">
                                                    <label for="">Sport </label>
                                                    <select name="" id="">
                                                        <option value="one"></option>
                                                        <option value="one"></option>
                                                        <option value="one"></option>
                                                        <option value="one"></option>
                                                    </select>
                                                </div> -->
                                            </form>
                                            <div class="build-redirect">
                                                <p>Already have an account Please <a @click="addNew.isReg = false" > Login .</a></p>
                                            </div>
                                        </div>
                                        <div class="build-right-form-inner" v-else>
                                            <form action="#">
                                               
                                                <div class="build-input">
                                                    <label for="">Email <span class="required">*</span></label>
                                                    <input type="email" v-model="formData.email">
                                                </div>
                                               
                                                <div class="build-input">
                                                    <label for="">Password <span class="required">*</span></label>
                                                    <input type="password" v-model="formData.password">
                                                </div>
                                            </form>
                                            <div class="build-redirect">
                                                <p>Don't have any account. Please <a @click="addNew.isReg = true" >Register</a></p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- <div class="build-section-inner-bottom">
                                <div class="build-cancel">
                                    <p>Cancel</p>
                                </div>
                                <div class="build-btn">
                                    <ul>
                                        <li class="go-btn"><button>Submit</button></li>
                                    </ul>
                                </div>
                            </div> -->
                        </div>
                    </div>
                    <div class="bulid-section build-section-2"  v-if="addNew.step == 3">
                        <div class="build-section-title">
                            <h3>Build together</h3>
                            <div class="build-close" style="cursor:pointer;" @click="addNew.modal = false" >
                                <img src="/images/Step-1.png" alt="">
                            </div>
                        </div>
                        <div class="build-section-inner">
                            <div class="build-section-inner-top">
                                <div class="build-left">
                                    <div class="build-item-box active">
                                        <div class="build-box-round">
                                            <!-- <span>1</span> -->
                                            <img src="/images/conf.png" alt="">
                                        </div>
                                        <p>Your work</p>
                                    </div>
                                    <div class="build-item-box">
                                        <div class="build-box-round">
                                            <!-- <span>1</span> -->
                                            <img src="/images/conf.png" alt="">
                                        </div>
                                        <p>Registration/Login</p>
                                    </div>
                                    <div class="build-item-box active">
                                        <div class="build-item-box-active">
                                            <span>3</span>
                                        </div>
                                        <p>Submit Review</p>
                                    </div>
                                    <div class="build-item-box">
                                        <div class="build-box-round">
                                            <span>4</span>
                                        </div>
                                        <p>Confirmation</p>
                                    </div>
                                </div>
                                <div class="build-right">
                                    <div class="build-right-title">
                                        <h3>What are you working on?</h3>
                                        <p>* We’ll guide you step-by-step to add the school/coach you need.</p>
                                    </div>
                                    <div class="build-right-form">
                                        <p>(Avg. Time of Completion - 2 minutes)</p>
                                        <div class="build-right-form-inner build-right-form-non">
                                            <form action="#">
                                                <div class="build-review">
                                                    <div v-if="onHover" >
                                                        <ul>
                                                            <li  @mouseover="changeDataHover(1)"   @mouseleave="changeDataHoverLeave"  @click="changeOldRatingV2(1)" :class="(drating.index > 0)? drating.class: ''" ><span    ><i class="fas fa-star"></i></span></li>
                                                            <li  @mouseover="changeDataHover(2)"   @mouseleave="changeDataHoverLeave"  @click="changeOldRatingV2(2)" :class="(drating.index > 1)? drating.class: ''" ><span    ><i class="fas fa-star"></i></span></li>
                                                            <li  @mouseover="changeDataHover(3)"   @mouseleave="changeDataHoverLeave"  @click="changeOldRatingV2(3)" :class="(drating.index > 2)? drating.class: ''" ><span    ><i class="fas fa-star"></i></span></li>
                                                            <li  @mouseover="changeDataHover(4)"   @mouseleave="changeDataHoverLeave"  @click="changeOldRatingV2(4)" :class="(drating.index > 3)? drating.class: ''" ><span    ><i class="fas fa-star"></i></span></li>
                                                            <li  @mouseover="changeDataHover(5)"   @mouseleave="changeDataHoverLeave"  @click="changeOldRatingV2(5)" :class="(drating.index > 4)? drating.class: ''" ><span    ><i class="fas fa-star"></i></span></li>
                                                        </ul>
                                                        <p>Select your rating</p>
                                                    </div>
                                                    <div v-else>
                                                        <ul>
                                                            <li @mouseover="changeDataHover(1)"   @mouseleave="changeDataHoverLeave"  @click="changeOldRatingV2(1)" :class="(oldrating.index > 0)? oldrating.class: ''" ><span    ><i class="fas fa-star"></i></span></li>
                                                            <li @mouseover="changeDataHover(2)"   @mouseleave="changeDataHoverLeave"  @click="changeOldRatingV2(2)" :class="(oldrating.index > 1)? oldrating.class: ''" ><span    ><i class="fas fa-star"></i></span></li>
                                                            <li @mouseover="changeDataHover(3)"   @mouseleave="changeDataHoverLeave"  @click="changeOldRatingV2(3)" :class="(oldrating.index > 2)? oldrating.class: ''" ><span    ><i class="fas fa-star"></i></span></li>
                                                            <li @mouseover="changeDataHover(4)"   @mouseleave="changeDataHoverLeave"  @click="changeOldRatingV2(4)" :class="(oldrating.index > 3)? oldrating.class: ''" ><span    ><i class="fas fa-star"></i></span></li>
                                                            <li @mouseover="changeDataHover(5)"   @mouseleave="changeDataHoverLeave"  @click="changeOldRatingV2(5)" :class="(oldrating.index > 4)? oldrating.class: ''" ><span    ><i class="fas fa-star"></i></span></li>
                                                        </ul>
                                                        <p>Select your rating</p>
                                                    </div>
                                                    
                                                </div>
                                                <div class="build-textarea">
                                                    <textarea v-model="step3Form.content" name="" id="" rows="10" placeholder="Your review helps others learn about good and bad coaches.

                                                    You have been lied to. 
                                                    Your values don't count.
                                                    They don't take you seriously.                                                                                                                                                                                                                                                                     
                                                    You owe this to yourself"></textarea>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- <div class="build-section-inner-bottom">
                                <div class="build-cancel">
                                    <p>Cancel</p>
                                </div>
                                <div class="build-btn">
                                    <ul>
                                        <li class="go-btn"><button>Submit</button></li>
                                    </ul>
                                </div>
                            </div> -->
                        </div>
                    </div>
                    <div class="bulid-section build-section-2"  v-if="addNew.step == 4">
                        <div class="build-section-title">
                            <h3>Build together</h3>
                           <div class="build-close" style="cursor:pointer;" @click="addNew.modal = false" >
                                <img src="/images/Step-1.png" alt="">
                            </div>
                        </div>
                        <div class="build-section-inner">
                            <div class="build-section-inner-top">
                                <div class="build-left">
                                    <div class="build-item-box ">
                                        <div class="build-box-round">
                                            <!-- <span>1</span> -->
                                            <img src="/images/conf.png" alt="">
                                        </div>
                                        <p>Add School/Coach</p>
                                    </div>
                                    <div class="build-item-box ">
                                        <div class="build-box-round">
                                            <!-- <span>2</span> -->
                                            <img src="/images/conf.png" alt="">
                                        </div>
                                        <p>Registration/Login</p>
                                    </div>
                                    <div class="build-item-box ">
                                        <div class="build-box-round">
                                            <!-- <span>2</span> -->
                                            <img src="/images/conf.png" alt="">
                                        </div>
                                        <p>Submit Review</p>
                                    </div>
                                    <div class="build-item-box active">
                                        <div class="build-item-box-active">
                                            <!-- <span>3</span> -->
                                            <img src="/images/conf.png" alt="">
                                        </div>
                                        <p>Confirmation</p>
                                    </div>
                                </div>
                                <div class="build-right">
                                    <div class="build-right-title">
                                        <h3>What are you working on?</h3>
                                        <p>* We’ll guide you step-by-step to add the school/coach you need.</p>
                                    </div>
                                    <div class="build-right-form">
                                        <div class="build-right-form-inner build-right-form-non">
                                            <div class="build-confirmation-text">
                                                <h3>Great! Way to Flank! <br> Your review has been submitted</h3>
                                                <p>Please allow us 24-48 hours to pull your information into one place, and see your low risk insight instantly benefit the player communities where you play(ed).</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- <div class="build-section-inner-bottom">
                                <div class="build-cancel">
                                    <p>Cancel</p>
                                </div>
                                <div class="build-btn">
                                    <ul>
                                        <li class="go-btn"><button>Continue Browsing</button></li>
                                    </ul>
                                </div>
                            </div> -->
                        </div>
                    </div>
                </div>
           </div>
           <div slot="footer">
               <div v-if="addNew.step == 1" class="mFooter" >
                   <p class="mCancel"  @click="addNew.modal=false">Cancel</p>
                    
                    <Button class="mNext" @click="addNewItem">Next</Button>
               </div>
               <div v-if="addNew.step == 2" class="mFooter" >
                   <p class="mCancel"  @click="addNew.modal=false">Cancel</p>
                    <Button  class="mBack" @click="addNew.modal=false">Back</Button>

                    <Button v-if="addNew.isReg"  class="mNext" @click="register">Next</Button>
                    <Button v-else class="mNext" @click="login">Next</Button>
               </div>
                
               <div v-if="addNew.step == 3" class="mFooter"  >
                    <p class="mCancel"  @click="addNew.modal=false">Cancel</p>
                    
                    <Button class="mNext" @click="reviewSubmit">Submit</Button>
               </div>
                
               <div v-if="addNew.step == 4" class="mFooter"  >
                   
                     <Button class="mNext" @click="addNew.modal=false">Continue Browsing</Button>
               </div>
                
               
            </div>
        </Modal>
    </div>
</template>

<script>
import {mapGetters} from 'vuex' 
export default {
    data(){
        return{
            str:'',
            showStr:'',
            place:'',
            page:1,
            flag:1,
            price:'',
            attribute:'',
            sstr:1,
            splace:1,
            sports:[],
            allPlaces:[],
            allSports:[],
            similar:[],
            filterFlag:false,
            pageOption: 'coach',
            iam:false,
            showCurrentPage:0,
            sort:'normal',
            isLoading:true,
            isStringMenu:false,
            dropName:'',
            div:'High School',
            drating:{
                class:'',
                text:'Select your rating',
                index: 0
            },
            oldrating:{
                class:'',
                text:'',
                index:0,
            },
            onHover: false,
            onTest: false,
            addNew:{
                step:1,
                modal:false,
                onHover:false,
                isReg: true
            },
            step1Form:{
                schoolName:'',
                city:'',
                division:'',
                state:'',
                sport:'',
                name:'',

            },
             step2Form:{
                firstName:'',
                lastName:'',
                email:'',
                password:'',
                
                password_confirmation :'',
                birthday:'',
                packType:''
            },
            step3Form:{
                reviewFor:'',
                school_id:'',
                content:"",
                rating:'',
            },
            newCoach:{},
             formData:{
                email:'',
                password:'',
                remember: false,
            },

        }
    },
    methods:{
        changeDataHover(index){
            this.drating.index = index
            this.onHover = true
            if(index == 1){
                this.drating.class = 'review-star-1'
                this.drating.text = 'Eek! Methinks not.'

            }
            else if(index == 2){
                this.drating.class = 'review-star-2'
                this.drating.text = "Meh. I've experienced better."
            }
            else if(index == 3){
                this.drating.class = 'review-star-3'
                this.drating.text = 'A-OK.'
            }
            else if(index == 4){
                this.drating.class = 'review-star-4'
                this.drating.text = "Yay! I'm a fan"
            }
            else if(index == 5){
                this.drating.class = 'review-star-5'
                this.drating.text = "Woohoo! As good as it gets!"
            }
           
        },
        changeOldRating(index){
             this.oldrating.index = index
            if(index == 1){
                this.oldrating.class = 'review-star-1'
                this.oldrating.text = 'Eek! Methinks not.'

            }
            else if(index == 2){
                this.oldrating.class = 'review-star-2'
                this.oldrating.text = "Meh. I've experienced better."
            }
            else if(index == 3){
                this.oldrating.class = 'review-star-3'
                this.oldrating.text = 'A-OK.'
            }
            else if(index == 4){
                this.oldrating.class = 'review-star-4'
                this.oldrating.text = "Yay! I'm a fan"
            }
            else if(index == 5){
                this.oldrating.class = 'review-star-5'
                this.oldrating.text = "Woohoo! As good as it gets!"
            }

             this.SearchByKey()

        },
        changeOldRatingV2(index){
             this.oldrating.index = index
            if(index == 1){
                this.oldrating.class = 'review-star-1'
                this.oldrating.text = 'Eek! Methinks not.'

            }
            else if(index == 2){
                this.oldrating.class = 'review-star-2'
                this.oldrating.text = "Meh. I've experienced better."
            }
            else if(index == 3){
                this.oldrating.class = 'review-star-3'
                this.oldrating.text = 'A-OK.'
            }
            else if(index == 4){
                this.oldrating.class = 'review-star-4'
                this.oldrating.text = "Yay! I'm a fan"
            }
            else if(index == 5){
                this.oldrating.class = 'review-star-5'
                this.oldrating.text = "Woohoo! As good as it gets!"
            }

            

        },
        async  addNewItem(){
            if(this.step1Form.schoolName == '') return this.i("All Fields are required!")
            if(this.step1Form.city == '') return this.i("All Fields are required!")
            if(this.step1Form.division == '') return this.i("All Fields are required!")
            if(this.step1Form.name == '') return this.i("All Fields are required!")
            if(this.step1Form.sport == '') return this.i("All Fields are required!")
            if(this.step1Form.state == '') return this.i("All Fields are required!")
            const res = await this.callApi('post','/coaches',this.step1Form)

            if(res.status == 200){
                this.newCoach = res.data
                this.i("New Coach Created !")
                if(this.isLoggedIn) this.addNew.step = 3
                else this.addNew.step = 2
            }
            else{
                this.swr()
                this.addNew.modal = false
            }
            
        },
        async register(){

             if(this.step2Form.firstName == '') return this.i("Frist name is empty!")
            if(this.step2Form.lastName == '') return this.i("Last name is empty!")
            if(this.step2Form.email == '') return this.i("Email  is empty!")
            if(this.step2Form.password == '') return this.i("Password  is empty!")
             if(this.step2Form.password_confirmation  !==  this.step2Form.password) return this.i("Password Doesn't match !")
                
            this.step2Form.packType = 1
            const res = await this.callApi('post','/users',this.step2Form)
            if(res.status==200){
                this.s('Registration Completed !')
                this.$store.dispatch('setAuthInfo',res.data)
                this.addNew.step = 3
                 
            }
            else if(res.status === 400){
                for(let d of res.data){
            
                    this.e(d.message)
                }
            }
            else{
                console.log(res)
                this.swr()
            }
        },
        async login(){
            if(this.formData.email == '') return this.i("email is empty")
            if(this.formData.password == '') return this.i("Password is empty")
            const res = await this.callApi('post','authentication/login',this.formData) 
            if(res.status===200){
                this.s("Login Successfully !")
                this.$store.dispatch('setAuthInfo',res.data)

               
                 
                 this.addNew.step = 3
                  
                
            }
            else if(res.status==401){
                this.e(res.data.message)
            }
            else{
                this.swr();
            }
        },
        async reviewSubmit(){
             
            
            if(this.step3Form.content == ''){
                this.i("You must write something in the review box!")
                return
            }
            if(this.drating.index == 0 ){
                this.i('Please rate this coach !')
                return;
            }
            this.step3Form.rating = this.oldrating.rating
            if(this.newCoach.name){
                this.step3Form.reviewFor =this.newCoach.id
                this.step3Form.rating = this.newCoach.school_id
               
            }
            else {
                 this.addNew.modal = false
               
                return this.swr()
            }
          
            
           // this.reviewData.uploadList = this.uploadList
          //  this.reviewData.AttributeInfo = this.AttributeInfo

            const res = await this.callApi('post','/app/storeSchoolCoachReview',this.step3Form)
            if(res.status===200){
                this.s('Review posted successfully!')
                this.addNew.step = 4
            }
            else{
                this.swr();
            }
           
            
        },
        
        changeDataHoverLeave(){
            this.onHover = false
            // this.drating.index = 0
            // this.drating.class = 0
            // this.drating.text = 0

        },
        chnageType(item , division=''){
            this.pageOption = item
            this.div = division
            this.SearchByKey()
        },
        changePriceType(item){
            this.price = item
            this.SearchByKey()
        },
        changeDivType(item){
            if(item != 'clear'){
                this.div = item
            }
            else {
                this.div = ''
            }
            this.SearchByKey()
        },
        changesSortType(item){
            this.sort = item
            this.changeSortName(item)
            this.SearchByKey()
        },
        pageOptionDropChange(item){

            this.pageOption= item
            this.isStringMenu = false
            this.SearchByKey()
        
        },  
        changeSortName(item){
            if(item == 'normal')
                this.dropName = 'Recomended'
            else if(item == 'most')
                this.dropName = 'Most Reviewed'
            else if(item == 'rated')
                this.dropName = 'Highest Rated'
            else if(item == 'Worst')
                this.dropName = 'Worst Rated'
        },
        async SearchByKey(){

            if(this.pageOption != 'product'){
                if(this.str == '' ) return this.i("Please Write a name")
                if(this.place == '') return this.i("Please Write a City")
            }

            const res = await this.callApi('get', `/app/SearchData?place=${this.place}&str=${this.str}&pageOption=${this.pageOption}&sort=${this.sort}&div=${this.div}&rate=${this.oldrating.index}&sports=${this.sports}&attribute=${this.attribute}`)
            if(res.status === 200){
                this.$store.commit('setPageOptino', this.pageOption )
                this.$store.commit('setSearchData', res.data.mainData.data)
                delete res.data.mainData.data
                this.$store.commit('setPagination', res.data.mainData )
                 this.similar = res.data.similarData
                this.sstr = this.str
                this.showStr = this.str
                this.splace = this.place
                this.onTest = true
                this.showCurrentPage = (Math.ceil((this.pagination.total)/(this.pagination.perPage)))
                this.isLoading = false
            }
            else{
                this.swr();
                this.isLoading = false
            }
        },
        async paginateDataInfo(e){
            this.page = e
             const res = await this.callApi('get', `/app/SearchData?place=${this.place}&str=${this.str}&page=${this.page}&pageOption=${this.pageOption}&price=${this.price}&sort=${this.sort}`)
            if(res.status === 200){
                 this.$store.commit('setPageOptino', this.pageOption )
                this.$store.commit('setSearchData', res.data.data)
                delete res.data.data
                this.$store.commit('setPagination', res.data )
               
                this.sstr = this.str
                this.splace = this.place
                
                this.showCurrentPage = (Math.ceil((this.pagination.total)/(this.pagination.perPage)))
                this.isLoading = false
            }
            else{
                this.swr();
                this.isLoading = false
            }
        },
        async searchPlace(){
             const res = await this.callApi('get', `/app/searchPlace?place=${this.place}`)
            if(res.status === 200){
               this.allPlaces = res.data
            }
            else{
                this.swr();
                this.isLoading = false
            }
        },
        filterFlagAction(){
            this.filterFlag = (this.filterFlag)? false : true
        },
        letChangePlace(item){
           this.place = item.name
           this.allPlaces = []
           this.SearchByKey();
        }

    },
    computed: {
        ...mapGetters({
        searchData: 'getSearchData',
        pagination: 'getPagination',
        pageOptinoInfo: 'getPageOptino'
        })
    },
    filters:{
        healthScore(item){
             let a = (item.avgRating.averageHealthy)? item.avgRating.averageHealthy : 0
             let b = (item.avgRating.averageHarmful)? item.avgRating.averageHarmful : 0
            return parseFloat( (parseFloat(a).toFixed(2) - parseFloat(b).toFixed(2) ) * 6.66  ).toFixed(2)
        }
    },
   async  created(){
       
        this.place = (this.$route.query.place)? this.$route.query.place : ''
        this.str = (this.$route.query.str)? this.$route.query.str :''
        this.pageOption = (this.$route.query.pageOption)? this.$route.query.pageOption :'coach'
        this.sort = (this.$route.query.sort)? this.$route.query.sort :'normal'
        this.div = (this.$route.query.div)? this.$route.query.div :''
       

        this.changeSortName(this.sort)
        
        await this.SearchByKey()
        const res = await this.callApi("get",'/app/getAllSports')
        if(res.status == 200){
            this.allSports = res.data
        }
        this.isLoading = false
        // this. showCurrentPage = (Math.ceil(this.pagination.total)/(this.pagination.perPage)-this.pagination.page)

    }

}
</script>

<style>
.ivu-modal-body {
    padding: 0px !important;
    font-size: 12px;
    line-height: 1.5;
}

.active_ON{
    background: #0096d8 !important;
    color: #fff !important;
}
.pagination_mark{
        text-align: center;
}
.pointer_like{
    cursor: pointer;
}
.active_coach{
    color: red !important;
}
.ssrolable{
	max-height: 250px;
    overflow: auto;
    z-index: 111;
}
.mFooter{
    display: flex;
    align-items: center;
    justify-content: flex-end;
}
.mCancel{
    cursor: pointer;
    color: #d32323;
    padding: 0 15px;
    font-size: 14px;
}
.mBack{
    background: rgb(253, 254, 255) !important;
    color:  rgb(211, 35, 35) !important;
    font-weight: 500 !important;
    font-size: 13px;
    border: 1px solid  rgb(211, 35, 35) !important;
}
.mNext{
    background: rgb(211, 35, 35) !important;
    color: #fff !important;
    font-weight: 500 !important;
    font-size: 13px;
}
.build-item-box-active{
    width: 40px;
    height: 40px;
    display: flex;
    flex-flow: row;
    justify-content: center;
    align-items: center;
    border-radius: 50%;
    background: #fff;
    margin: auto;
    border: 1px solid #d32323;
}
</style>
