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
                                <Select v-model="flag" style="width:200px">
                                    <Option :value="1" >Coach</Option>
                                    <Option :value="2" >School</Option>
                                </Select>
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
                        <h3>Showing 1-{{searchData.length}} of {{pagination.total}}</h3>
                    </div>
                    <div class="find-page-nav">
                        <ul class="filter">
                            <li class="filter-list"><span><i class="fas fa-random"></i></span> All Filters <span class="filter-tag tag-one">Show All Filters</span></li>
                            <li class="filter-list">
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
                            <li class="filter-list"><span><i class="far fa-clock"></i></span> Cash Back <span class="filter-tag tag-ten">Restaurents that let you join the waitlist remotely on Flank</span></li>
                        </ul>
                    </div>
                </div>
            </div>
        </section>

        <section class="third-section find-search-third-section">
            <div class="container">
                <div class="section-content">
                    <div class="row">
                        <div class="col-md-8">
                            <!-- <div class="sponsor-part">
                                <div class="sponsor-title">
                                    <h2>Sponsored Results</h2>
                                    <p><i class="fas fa-info-circle"></i> <span>Business owners paid for these ads. For more information visi <a href="">Flank for business owners</a></span></p>
                                </div>
                                <div class="sponsor-list">
                                    <div class="sponsor-media sponsor-item">
                                        <div class="sponsor-media-left">
                                            <figure>
                                                <img src="/image/ls (1).jpg" alt="">
                                            </figure>
                                            <div class="sponsor-media-carousel">
                                                <span><i class="fas fa-chevron-left"></i></span>
                                                <span><i class="fas fa-chevron-right"></i></span>
                                            </div>
                                        </div>
                                        <div class="sponsor-media-body">
                                            <div class="body-part-one">
                                                <h3><a href="">Sutter St. Cafe</a></h3>
                                                <div class="badge-review">
                                                    <p><span class="rating-bg high"><i class="fas fa-star"></i></span><span class="rating-bg high"><i class="fas fa-star"></i></span><span class="rating-bg high"><i class="fas fa-star"></i></span><span class="rating-bg high"><i class="fas fa-star"></i></span><span><i class="fas fa-star"></i></span> <small>176 reviews</small></p>
                                                </div>
                                                <div class="dir-link">
                                                    <p>$ &nbsp; • &nbsp; <a href="">Cafes</a>, <a href="">Delis</a></p>
                                                </div>
                                            </div>
                                            <div class="body-part-two">
                                                <p>(415) 362-8342</p>
                                                <p>450 Sutter St</p>
                                                <p>Union Square</p>
                                            </div>
                                            <div class="body-para">
                                                <h4><span><i class="fas fa-utensils"></i></span> &nbsp; Popular for its <strong>Veggie Combo</strong></h4>
                                                <p>“I had not visited this little hole-in-the-wall sandwich shop/cafe in about four years and did not know until today that there had been a change in ownership back in 2014. WOW! What…” <a href="">read more</a></p>
                                                <div class="order-card">
                                                    <p>Offers takeout and delivery</p>
                                                    <button>Start Order</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="sponsor-media sponsor-item">
                                        <div class="sponsor-media-left">
                                            <figure>
                                                <img src="/image/ls (1).jpg" alt="">
                                            </figure>
                                            <div class="sponsor-media-carousel">
                                                <span><i class="fas fa-chevron-left"></i></span>
                                                <span><i class="fas fa-chevron-right"></i></span>
                                            </div>
                                        </div>
                                        <div class="sponsor-media-body">
                                            <div class="body-part-one">
                                                <h3><a href="">Sutter St. Cafe</a></h3>
                                                <div class="badge-review">
                                                    <p><span class="rating-bg high"><i class="fas fa-star"></i></span><span class="rating-bg high"><i class="fas fa-star"></i></span><span class="rating-bg high"><i class="fas fa-star"></i></span><span class="rating-bg high"><i class="fas fa-star"></i></span><span><i class="fas fa-star"></i></span> <small>176 reviews</small></p>
                                                </div>
                                                <div class="dir-link">
                                                    <p>$ &nbsp; • &nbsp; <a href="">Cafes</a>, <a href="">Delis</a></p>
                                                </div>
                                            </div>
                                            <div class="body-part-two">
                                                <p>(415) 362-8342</p>
                                                <p>450 Sutter St</p>
                                                <p>Union Square</p>
                                            </div>
                                            <div class="body-para">
                                                <h4><span><i class="fas fa-utensils"></i></span> &nbsp; Popular for its <strong>Veggie Combo</strong></h4>
                                                <p>“I had not visited this little hole-in-the-wall sandwich shop/cafe in about four years and did not know until today that there had been a change in ownership back in 2014. WOW! What…” <a href="">read more</a></p>
                                                <div class="order-card">
                                                    <p>Offers takeout and delivery</p>
                                                    <button>Start Order</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div> -->
                            <div class="sponsor-part">
                                <div class="sponsor-title">
                                    <h2>All Results</h2>
                                </div>
                                <div class="sponsor-all-list">
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
                                                <h3><span>{{index+1}}.</span> <a href="">{{item.name}}</a></h3>
                                                <div class="badge-review">
                                                    <p>
                                                        <span class="rating-bg high"><i class="fas fa-star"></i></span>
                                                        <span class="rating-bg high"><i class="fas fa-star"></i></span>
                                                        <span class="rating-bg high"><i class="fas fa-star"></i></span>
                                                        <span class="rating-bg high"><i class="fas fa-star"></i></span>
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
                                    <!-- <div class="sponsor-media sponsor-item">
                                        <div class="sponsor-media-left">
                                            <figure>
                                                <img src="/image/ls (1).jpg" alt="">
                                            </figure>
                                            <div class="sponsor-media-carousel">
                                                <span><i class="fas fa-chevron-left"></i></span>
                                                <span><i class="fas fa-chevron-right"></i></span>
                                            </div>
                                        </div>
                                        <div class="sponsor-media-body">
                                            <div class="body-part-one">
                                                <h3><span>2.</span> <a href="">Sutter St. Cafe</a></h3>
                                                <div class="badge-review">
                                                    <p><span class="rating-bg high"><i class="fas fa-star"></i></span><span class="rating-bg high"><i class="fas fa-star"></i></span><span class="rating-bg high"><i class="fas fa-star"></i></span><span class="rating-bg high"><i class="fas fa-star"></i></span><span><i class="fas fa-star"></i></span> <small>176 reviews</small></p>
                                                </div>
                                                <div class="dir-link">
                                                    <p>$ &nbsp; • &nbsp; <a href="">Cafes</a>, <a href="">Delis</a></p>
                                                </div>
                                            </div>
                                            <div class="body-part-two">
                                                <p>(415) 362-8342</p>
                                                <p>450 Sutter St</p>
                                                <p>Union Square</p>
                                            </div>
                                            <div class="body-para">
                                                <h4><span><i class="fas fa-utensils"></i></span> &nbsp; Popular for its <strong>Veggie Combo</strong></h4>
                                                <p>“I had not visited this little hole-in-the-wall sandwich shop/cafe in about four years and did not know until today that there had been a change in ownership back in 2014. WOW! What…” <a href="">read more</a></p>
                                                <div class="order-card">
                                                    <p>Offers takeout and delivery</p>
                                                    <button>Start Order</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div> -->
                                    <div class="sponsor-search-list">
                                        <div class="text-center">
                                            <p><span><i class="fas fa-search"></i></span> People also searched for</p>
                                        </div>
                                        <ul>
                                            <li><a href="">Sushi</a></li>
                                            <li><a href="">Pizza</a></li>
                                            <li><a href="">Coffee & Tea</a></li>
                                            <li><a href="">Bars</a></li>
                                            <li><a href="">Sea Foods</a></li>
                                        </ul>
                                        <ul>
                                            <li><a href="">Japaneese Food</a></li>
                                            <li><a href="">Pizza</a></li>
                                            <li><a href="">Coffee & Tea</a></li>
                                            <li><a href="">Bars</a></li>
                                            <li><a href="">Sea Foods</a></li>
                                        </ul>
                                    </div>
                                    <div class="sponsor-media sponsor-item">
                                        <div class="sponsor-media-left">
                                            <figure>
                                                <img src="/image/ls (1).jpg" alt="">
                                            </figure>
                                            <div class="sponsor-media-carousel">
                                                <span><i class="fas fa-chevron-left"></i></span>
                                                <span><i class="fas fa-chevron-right"></i></span>
                                            </div>
                                        </div>
                                        <div class="sponsor-media-body">
                                            <div class="body-part-one">
                                                <h3><span>3.</span> <a href="">Sutter St. Cafe</a></h3>
                                                <div class="badge-review">
                                                    <p><span class="rating-bg high"><i class="fas fa-star"></i></span><span class="rating-bg high"><i class="fas fa-star"></i></span><span class="rating-bg high"><i class="fas fa-star"></i></span><span class="rating-bg high"><i class="fas fa-star"></i></span><span><i class="fas fa-star"></i></span> <small>176 reviews</small></p>
                                                </div>
                                                <div class="dir-link">
                                                    <p>$ &nbsp; • &nbsp; <a href="">Cafes</a>, <a href="">Delis</a></p>
                                                </div>
                                            </div>
                                            <div class="body-part-two">
                                                <p>(415) 362-8342</p>
                                                <p>450 Sutter St</p>
                                                <p>Union Square</p>
                                            </div>
                                            <div class="body-para">
                                                <h4><span><i class="fas fa-utensils"></i></span> &nbsp; Popular for its <strong>Veggie Combo</strong></h4>
                                                <p>“I had not visited this little hole-in-the-wall sandwich shop/cafe in about four years and did not know until today that there had been a change in ownership back in 2014. WOW! What…” <a href="">read more</a></p>
                                                <div class="order-card">
                                                    <p>Offers takeout and delivery</p>
                                                    <button>Start Order</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="paginationCount">
                                        <ul>
                                            <li class="active"><a href="">1</a></li>
                                            <li><a href="">2</a></li>
                                            <li><a href="">3</a></li>
                                            <li><a href="">4</a></li>
                                            <li><a href="">5</a></li>
                                            <li><a href="">Next&nbsp;<i class="fas fa-chevron-right"></i></a></li>
                                        </ul>
                                    </div>
                                    <div class="sponsor-media sponsor-item">
                                        <div class="sponsor-media-left">
                                            <figure>
                                                <img src="/image/ls (1).jpg" alt="">
                                            </figure>
                                            <div class="sponsor-media-carousel">
                                                <span><i class="fas fa-chevron-left"></i></span>
                                                <span><i class="fas fa-chevron-right"></i></span>
                                            </div>
                                        </div>
                                        <div class="sponsor-media-body">
                                            <div class="body-part-one">
                                                <h3><span>4.</span> <a href="">Sutter St. Cafe</a></h3>
                                                <div class="badge-review">
                                                    <p><span class="rating-bg high"><i class="fas fa-star"></i></span><span class="rating-bg high"><i class="fas fa-star"></i></span><span class="rating-bg high"><i class="fas fa-star"></i></span><span class="rating-bg high"><i class="fas fa-star"></i></span><span><i class="fas fa-star"></i></span> <small>176 reviews</small></p>
                                                </div>
                                                <div class="dir-link">
                                                    <p>$ &nbsp; • &nbsp; <a href="">Cafes</a>, <a href="">Delis</a></p>
                                                </div>
                                            </div>
                                            <div class="body-part-two">
                                                <p>(415) 362-8342</p>
                                                <p>450 Sutter St</p>
                                                <p>Union Square</p>
                                            </div>
                                            <div class="body-para">
                                                <h4><span><i class="fas fa-utensils"></i></span> &nbsp; Popular for its <strong>Veggie Combo</strong></h4>
                                                <p>“I had not visited this little hole-in-the-wall sandwich shop/cafe in about four years and did not know until today that there had been a change in ownership back in 2014. WOW! What…” <a href="">read more</a></p>
                                                <div class="order-card">
                                                    <p>Offers takeout and delivery</p>
                                                    <button>Start Order</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="search-in-city">
                                <div class="city-part-list">
                                    <div class="inner-title">
                                        <h3>Related Searches in San Francisco, CA</h3>
                                    </div>
                                    <div class="city-item-list">
                                        <ul>
                                            <li><a href="">Cheap Dinner</a></li>
                                            <li><a href="">Cheap Dinner Japaneese</a></li>
                                            <li><a href="">Cheap Dinner</a></li>
                                            <li><a href="">Cheap Dinner</a></li>
                                            <li><a href="">Cheap Dinner</a></li>
                                        </ul>
                                        <ul>
                                            <li><a href="">Cheap Dinner</a></li>
                                            <li><a href="">Cheap Dinner Japaneese</a></li>
                                            <li><a href="">Cheap Dinner</a></li>
                                            <li><a href="">Cheap Dinner</a></li>
                                            <li><a href="">Cheap Dinner</a></li>
                                        </ul>
                                        <ul>
                                            <li><a href="">Cheap Dinner</a></li>
                                            <li><a href="">Cheap Dinner Japaneese</a></li>
                                            <li><a href="">Cheap Dinner</a></li>
                                            <li><a href="">Cheap Dinner</a></li>
                                            <li><a href="">Cheap Dinner</a></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="city-part-list">
                                    <div class="inner-title">
                                        <h3>Get things done with Flank</h3>
                                    </div>
                                    <div class="figure-list">
                                        <div class="item-figure">
                                            <figure>
                                                <img src="/image/auto-repair.png" alt="">
                                            </figure>
                                        </div>
                                        <div class="item-figure">
                                            <figure>
                                                <img src="/image/auto-repair.png" alt=""> 
                                            </figure>
                                        </div>
                                        <div class="item-figure">
                                            <figure>
                                                <img src="/image/auto-repair.png" alt="">
                                            </figure>
                                        </div>
                                        <div class="item-figure">
                                            <figure>
                                                <img src="/image/auto-repair.png" alt="">
                                            </figure>
                                        </div>
                                        <div class="item-figure">
                                            <figure>
                                                <img src="/image/auto-repair.png" alt="">
                                            </figure>
                                        </div>
                                        <div class="item-figure">
                                            <figure>
                                                <img src="/image/auto-repair.png" alt="">
                                            </figure>
                                        </div>
                                        <div class="item-figure">
                                            <figure>
                                                <img src="/image/auto-repair.png" alt="">
                                            </figure>
                                        </div>
                                        <div class="item-figure">
                                            <figure>
                                                <img src="/image/auto-repair.png" alt="">
                                            </figure>
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

        }
    },
    methods:{
        async SearchByKey(){
            const res = await this.callApi('get', `/app/SearchData?place=${this.place}&str=${this.str}&flag=${this.flag}&page=${this.page}`)
            if(res.status === 200){
                this.searchData = res.data.data
                this.pagination = res.data 
                delete this.pagination.data
                this.sstr = this.str
                this.splace = this.place
            }
            else{
                this.swr();
            }
        }

    },
     async asyncData({app, store,redirect, params,query}){
        try {
            let {data} = await app.$axios.get(`/app/SearchData?place=${query.place}&str=${query.str}&flag=1&page=1`)
          
            return{
                searchData : data.data,
                pagination : data,

            }
		}catch (error) {
            return redirect('/404')
		}
   },
    created(){
        console.log(this.$route)
        this.place = this.$route.query.place
        this.splace = this.$route.query.place
        this.str = this.$route.query.str
        this.sstr = this.$route.query.str

    }

}
</script>

<style>

</style>
