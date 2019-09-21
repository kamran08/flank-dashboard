<template>
    <div class="flank-container">
        <div class="new-flank-nav">
            <div class="new-flank-nav-con">
                <div class="flank-new-brand">
                    <a href="#"><img src="/images/logo-new.png" alt=""></a>
                </div>
                <div class="flank-new-form">
                    <form action="">
                        <div class="flank-new-indi">
                            <div class="new-flank-selection">
                                <p>All <span><i class="fas fa-caret-down"></i></span></p>
                            </div>
                            <div class="new-flank-input">
                                <input type="text" v-model="str">
                            </div>
                        </div>
                        <div class="flank-new-indi">
                            <div class="new-flank-selection">
                                <p>Near</p>
                            </div>
                            <div class="new-flank-input">
                                <input type="text" v-model="place">
                            </div>
                        </div>
                        <div class="flank-new-search">
                            <button><span><i class="fas fa-search"></i></span></button>
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
                <p>1-16 of over 90,000 results for <span>"{{str}}"</span></p>
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
            <div class="new-flank-content">
                <div class="new-flank-content-rev">
                    <div class="new-content-rev-title">
                        <h2>Your past reviews</h2>
                        <p><a href="">See all past reviews</a></p>
                    </div>
                    <div class="new-content-rev-details">
                        <div class="new-content-rev-left">
                            <div class="new-best-rated rated-red">
                                <p>Best rated</p>
                            </div>
                            <figure>
                                <img src="/images/ps.png" alt="">
                            </figure>
                        </div>
                        <div class="new-content-rev-right">
                            <h2>Coach name - sport type</h2>
                            <p>School name</p>
                            <span class="city-s">City/State</span>
                            <div class="new-content-star">
                                <ul>
                                    <li><span class="bg"><i class="fas fa-star"></i></span></li>
                                    <li><span><i class="fas fa-star"></i></span></li>
                                    <li><span><i class="fas fa-star"></i></span></li>
                                    <li><span><i class="fas fa-star"></i></span></li>
                                    <li><span><i class="fas fa-star"></i></span></li>
                                </ul>
                                <p><span><i class="fas fa-chevron-down"></i></span><a href="">12</a></p>
                            </div>
                            <div class="new-comment-para">
                                <p>"This coach is not fance - he's unpretentious and has a few simple rules to follow. I appreciate that. The drilles are innovative, fresh and generous. My..." <a href="">Read more</a></p>
                            </div>
                            <div class="new-comment-btn">
                                <button>Write a Review</button>
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
                                                    <p class="_2title" @click="$router.push(`/school_coach/${item.id}`)" >{{item.name}} -  {{item.school.sport}} </p>
                                                    <div class="_1rating">
                                                        <ul class="_1rating_list">
                                                            <li :class="(item.avgRating.averageRating>0)? '_1rating_active' : ''"><i class="fas fa-star"></i></li>
                                                            <li :class="(item.avgRating.averageRating>1)? '_1rating_active' : ''" ><i class="fas fa-star"></i></li>
                                                            <li :class="(item.avgRating.averageRating>2)? '_1rating_active' : ''" ><i class="fas fa-star"></i></li>
                                                            <li :class="(item.avgRating.averageRating>3)? '_1rating_active' : ''" ><i class="fas fa-star"></i></li>
                                                            <li :class="(item.avgRating.averageRating>4)? '_1rating_active' : ''" ><i class="fas fa-star"></i></li>
                                                            <li class="_1rating_num"><span> <i class="fas fa-chevron-down"></i> </span> 10</li>
                                                        </ul>
                                                    </div>
                                                </div>

                                                <p class="_2card_details_city">City/State</p>
                                            </div>
                                            <p class="_2card_status _2taxt">
                                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
                                                    Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi u"
                                            </p>

                                            <p>
                                                <a href="" class="see_more">See more</a>
                                            </p>

                                            <button class="_1btn">Write a Review</button>
                                        </div>
                                    </div>
                                </div>
                                <!-- Left -->

                                <!-- Right -->
                                <div class="col-xl-12 col-md-12 col-lg-5 _2coach_main_right">
                                    <div class="_2coach_title">
                                        <p class="_2coach_title_one">Health Score:</p>

                                        <p class="_2coach_title_two _2coach_title_two_red">+10.89 <span>91.98%</span></p>
                                    </div>

                                    <div class="_2coach_main_right_main">
                                        <p class="_2coach_main_right_title">Known for:</p>

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
                                        </ul>
                                    </div>
                                </div>
                                <!-- Right -->
                            </div>
                        </div>
                    </div>
               
                

                    <div class="_1coach_items" v-if="pageOptinoInfo == 'legend'" v-for="(item,index) in searchData" :key="index" >
                        <p class="worst yellow">Best Rated</p>

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
                                                    <p class="_2title">Our Top Choice</p>
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
                                                </div>

                                                <p class="_2card_details_city">City/State</p>
                                            </div>
                                            <p class="_2card_status _2taxt">
                                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
                                                    Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi u"
                                            </p>

                                            <p>
                                                <a href="" class="see_more">See more</a>
                                            </p>

                                            <button class="_1btn">Write a Review</button>
                                        </div>
                                    </div>
                                </div>
                                <!-- Left -->

                                <!-- Right -->
                                <div class="col-xl-12 col-md-12 col-lg-5 _2coach_main_right">
                                    <div class="_2coach_title">
                                        <p class="_2coach_title_one">Health Score:</p>

                                        <p class="_2coach_title_two">+10.89 <span>91.98%</span></p>
                                    </div>

                                    <div class="_2coach_main_right_main">
                                        <p class="_2coach_main_right_title">Known for:</p>

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
                                        </ul>
                                    </div>
                                </div>
                                <!-- Right -->
                            </div>
                        </div>
                    </div>
                 

                    <div class="_1coach_items" v-if="pageOptinoInfo == 'product'" v-for="(item,index) in searchData" :key="index" >
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
                                                    <li class="_1rating_num"><span> <i class="fas fa-chevron-down"></i> </span> 2,472</li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- Card -->

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
                                                    <li class="_1rating_num"><span> <i class="fas fa-chevron-down"></i> </span> 2,472</li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- Card -->

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
                                                    <li class="_1rating_num"><span> <i class="fas fa-chevron-down"></i> </span> 2,472</li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- Card -->

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
                                                    <li class="_1rating_num"><span> <i class="fas fa-chevron-down"></i> </span> 2,472</li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- Card -->
                            </div>
                        </div>
                    </div>
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
        
    </div>
</template>

<script>
import {mapGetters} from 'vuex'
export default {
    data(){
        return{
            str:'',
            place:'',
            page:1,
            flag:1,
            price:'',
            attribute:'',
            sstr:1,
            splace:1,
            sports:[],
            allSports:[],
            filterFlag:false,
            pageOption: 'coach',
            iam:false,
            showCurrentPage:0,
            sort:'normal',
            isLoading:true,
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

            const res = await this.callApi('get', `/app/SearchData?place=${this.place}&str=${this.str}&pageOption=${this.pageOption}&sort=${this.sort}&div=${this.div}&rate=${this.oldrating.index}&sports=${this.sports}&attribute=${this.attribute}`)
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
        filterFlagAction(){
            this.filterFlag = (this.filterFlag)? false : true
        }

    },
//      async asyncData({app, store,redirect, params,query}){
//         try {
//             let
//             let {data} = await app.$axios.get(`/app/SearchData?place=${query.place}&str=${query.str}&pageOption=legend`)
          
//             return{
//                 searchData : data.data,
//                 pagination : data,
               

//             }
// 		}catch (error) {
//             return redirect('/')
// 		}
//    },
    computed: {
        ...mapGetters({
        searchData: 'getSearchData',
        pagination: 'getPagination',
        pageOptinoInfo: 'getPageOptino'
        })
    },
   async  created(){
       
        this.place = (this.$route.query.place)? this.$route.query.place : ''
        this.str = (this.$route.query.str)? this.$route.query.str :''
        this.pageOption = (this.$route.query.pageOption)? this.$route.query.pageOption :'coach'
        this.sort = (this.$route.query.sort)? this.$route.query.sort :'normal'
        this.div = (this.$route.query.div)? this.$route.query.div :'High School'
       

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

</style>
