
<template>

    <div>

        <div class="flank-page-header"> 
            <div class="flank-page-top">
                <div class="container">
                    <div class="flank-full">
                        <div class="flank-item-1">
                            <figure>
                                <img :src="legendData.school.logo" alt="">
                            </figure>
                            <div class="flank-header-cap">
                                <h1>Coach <br><span>{{legendData.name}}</span></h1>
                                <ul>
                                    <li><img src="/images/d.png" alt="">{{legendData.school.schoolName}}</li>
                                    <li>&bull;</li>
                                    <li>{{legendData.school.sport}}</li>
                                </ul>
                                <div class="flank-head-btn">
                                    <button>Review</button>
                                </div>
                            </div>
                        </div>
                        <div class="flank-item-2">
                            <div class="flank-item-2-inner">
                                <div class="flank-item-left-list">
                                    <table>
                                        <tbody>
                                            <tr>
                                                <td>Program type:</td>
                                                <td>{{legendData.school.schoolName}}</td>
                                            </tr>
                                            <tr>
                                                <td>City/state:</td>
                                                <td>{{legendData.school.city}} {{legendData.school.state}}</td>
                                            </tr>
                                            <tr>
                                                <td>Profile views:</td>
                                                <td>123 views</td>
                                            </tr>
                                            <tr>
                                                <td>Status:</td>
                                                <td><span class="green"></span>Active</td>
                                            </tr>
                                            <tr>
                                                <td>Streak:</td>
                                                <td>W5</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="flank-item-right-list">
                                    <div class="linear-border">
                                        <p>2018-19 season stats</p>
                                    </div>
                                    <div class="right-list-inner">
                                        <div class="right-list-inner-item">
                                            <h4>RTG</h4>
                                            <div class="review-star">
                                                <ul>
                                                    <li  :class="(averageRating>0)? '' : 'star-half'"><span><i class="fas fa-star"></i></span></li>
                                                    <li :class="(averageRating>1)? '' : 'star-half'" ><span><i class="fas fa-star"></i></span></li>
                                                    <li :class="(averageRating>2)? '' : 'star-half'" ><span><i class="fas fa-star"></i></span></li>
                                                    <li :class="(averageRating>3)? '' : 'star-half'" ><span><i class="fas fa-star"></i></span></li>
                                                    <li :class="(averageRating>4)? '' : 'star-half'"  ><span><i class="fas fa-star"></i></span></li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="right-list-inner-item">
                                            <h4>Hs</h4>
                                            <div class="ti">
                                                <p>0.0</p>
                                            </div>
                                        </div>
                                        <div class="right-list-inner-item">
                                            <h4>Heali</h4>
                                            <div class="ti">
                                                <p>0.0</p>
                                            </div>
                                        </div>
                                        <div class="right-list-inner-item">
                                            <h4>Harmi</h4>
                                            <div class="ti">
                                                <p>0.0</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="flank-page-bottom">
                <div class="container">
                    <div class="flank-page-bottom-nav">
                        <ul>
                            <li class="active"><a href="#">Overview</a></li>
                            <li><a href="#">Bio</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <div class="new-banner-section new-banner-section-1">
            <div class="container-fluid">
                <div class="inner-banner">
                    <figure>
                        <img src="/images/long-form-example.png" alt="">
                    </figure>
                </div>
            </div>
        </div>

        <div class="new-section-content">
            <div class="container">
                <div class="new-content-inner">
                    <div class="row">
                        <div class="new-inner-item-1">
                            <div class="col-md-3 col-sm-3">
                                <div class="switch-link-content">
                                    <div class="switch-link-title">
                                        <h4>Switch coach</h4>
                                    </div>
                                    <div class="switch-link-btn">
                                        <ul>
                                            <li><button>Coach name1</button></li>
                                            <li><button>Best rated coach</button></li>
                                        </ul>
                                    </div>
                                    <div class="switch-coach-sec">
                                        <div class="switch-coach active" v-for="(item,index) in similarCoaches" :key="index">
                                            <figure>
                                                <img src="/images/male.png" alt="">
                                            </figure>
                                            <div class="switch-coach-caption"  >
                                                <p><a :href="`/school_coach/${item.id}`" >{{item.name}}</a></p>
                                                
                                            </div>
                                        </div>
                                    </div>
                                    <div class="switch-link-foot">
                                        <p>Full staff</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="new-inner-item-2">
                            <div class="col-md-6 col-sm-6">
                                <div class="inner-item-table-sec">
                                    <div class="inner-item-table-title">
                                        <h4>Stats</h4>
                                    </div>
                                    <div class="inner-item-table">
                                        <table>
                                            <thead>
                                                <tr>
                                                    <th class="th-nor">Stats</th>
                                                    <th>HS</th>
                                                    <th>PC</th>
                                                    <th>PR</th>
                                                    <th>NR</th>
                                                    <th>PCT</th>
                                                    <th>HEALI</th>
                                                    <th>HARMI</th>
                                                    <th>DIFF</th>
                                                    <th>CORRI</th>
                                                    <th>STRK</th>
                                                    <th>L10</th>
                                                    <th>STI</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td class="th-nor">Regular season</td>
                                                    <td>00</td>
                                                    <td>00</td>
                                                    <td>00</td>
                                                    <td>00</td>
                                                    <td>00</td>
                                                    <td>00%</td>
                                                    <td>0.0%</td>
                                                    <td>+01</td>
                                                    <td>00%</td>
                                                    <td>01</td>
                                                    <td>01</td>
                                                    <td>1.00</td>
                                                </tr>
                                                <tr>
                                                    <td class="th-nor">Overall</td>
                                                    <td>00</td>
                                                    <td>00</td>
                                                    <td>00</td>
                                                    <td>00</td>
                                                    <td>00</td>
                                                    <td>00%</td>
                                                    <td>0.0%</td>
                                                    <td>+01</td>
                                                    <td>00%</td>
                                                    <td>01</td>
                                                    <td>01</td>
                                                    <td>1.00</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div class="inner-item-review-sec">
                                    <div class="left-linear-border">

                                    </div>
                                    <div class="inner-item-rev-item" v-for="(item,index) in topReviews" :key="index" >
                                        <figure>
                                            <img src="/images/act.png" alt="">
                                        </figure>
                                        <div class="rev-item-caption">
                                            <p class="readmore">"{{item.content}}"</p>
                                        </div>
                                    </div>
                                    <!-- <div class="inner-item-rev-item">
                                        <figure>
                                            <img src="/images/act.png" alt="">
                                        </figure>
                                        <div class="rev-item-caption">
                                            <p>"From the AD to the coach to the friendly pitching coach you can't go wrong with playing at St. Bonaventure."</p>
                                        </div>
                                    </div>
                                    <div class="inner-item-rev-item">
                                        <figure>
                                            <img src="/images/act.png" alt="">
                                        </figure>
                                        <div class="rev-item-caption">
                                            <p>"Met coach Efren and had a friendly conversation... nice guy."</p>
                                        </div>
                                    </div> -->
                                </div>
                                <div class="inner-item-reco-sec">
                                    <div class="inner-item-reco-title">
                                        <h4>Recommended Reviews <span>for Coach John Doe</span></h4>
                                    </div>
                                    <div class="inner-item-top-con">
                                        <figure>
                                            <img src="/images/sticker-3.png" alt="">
                                        </figure>
                                        <div class="top-con-cap">
                                            <p><span>Your trust is our top concern,</span> so coaches can't pay to alter or remove there reviews. <a href="#">Learn more</a></p>
                                        </div>
                                    </div>
                                    <div class="new-flank-form">
                                        <div class="new-flank-sort-sec">
                                            <div class="new-flank-search">
                                                <form action="#">
                                                    <div class="search-new-box">
                                                        <input type="text" placeholder="Search within the reviews">
                                                        <button type="submit"><span><i class="fas fa-search"></i></span></button>
                                                    </div>
                                                </form>
                                            </div>
                                            <div class="new-flank-sort">
                                                <div class="new-flank-select">
                                                    <h4>Sort by</h4>
                                                    <select name="" id="">
                                                        <option value="sort">Flank Sort</option>
                                                        <option value="sort">Flank Sort</option>
                                                        <option value="sort">Flank Sort</option>
                                                    </select>
                                                </div>
                                                <div class="new-flank-img">
                                                    <figure>
                                                        <img src="/images/nf.png" alt="">
                                                    </figure>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="new-flank-coach-rev">
                                            <div class="coach-rev-fixed">
                                                <figure>
                                                    <img src="/images/fixed-img.png" alt="">
                                                </figure>
                                                <div class="coach-rev-fixed-content">
                                                    <h4></h4>
                                                    <h5></h5>
                                                    <ul class="fixed-list">
                                                        <li><img src="/images/mw.png" alt=""><span></span></li>
                                                        <li><img src="/images/mstar.png" alt=""><span></span></li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="coach-rev-push">
                                                <ul class="coa-rev">
                                                    <li><span><i class="fas fa-star"></i></span></li>
                                                    <li><span><i class="fas fa-star"></i></span></li>
                                                    <li><span><i class="fas fa-star"></i></span></li>
                                                    <li><span><i class="fas fa-star"></i></span></li>
                                                    <li><span><i class="fas fa-star"></i></span></li>
                                                </ul>
                                                <div class="start-link">
                                                    <p>Start your review of <span>Coach John Doe</span></p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="new-flank-given-review">
                                    <div class="flank-given-review-item" v-for="(item,index) in reviews" :key="index" >
                                        <div class="linear-border"></div>
                                        <div class="review-item-inner">
                                            <div class="review-item-left">
                                                <div class="review-item-left-fig">
                                                    <figure>
                                                        <img :src="item.reviwer.img" alt="">
                                                    </figure>
                                                    <div class="review-item-left-fig-c">
                                                        <h4>{{item.reviwer.firstName}} {{item.reviwer.lastName}}</h4>
                                                        <h5>{{item.reviwer.address}}</h5>
                                                        <ul class="left-fig-link">
                                                            <li><img src="/images/mw.png" alt=""><span>3 Friends</span></li>
                                                            <li><img src="/images/mstar.png" alt=""><span>{{item.reviwer.__meta__.totalreviewbyuser}} reviews</span></li>
                                                        </ul>
                                                    </div>
                                                </div>
                                                <div class="review-figure-exper">
                                                    <ul>
                                                        <li>
                                                            <img src="/images/mstar.png" alt="">
                                                            <p><a>Share review</a></p>
                                                        </li>
                                                        <li>
                                                            <img src="/images/mstar.png" alt="">
                                                            <p><a>Embeded Review</a></p>
                                                        </li>
                                                        <li> 
                                                            <img src="/images/mstar.png" alt="">
                                                            <p><a>Send message</a></p>
                                                        </li>
                                                        <li>
                                                            <img src="/images/mstar.png" alt="">
                                                            <p><a>Follow valerie C.</a></p>
                                                        </li>
                                                    </ul>
                                                </div> 
                                            </div>
                                            <div class="review-item-right">
                                                <div class="review-item-right-rat">
                                                    <ul>
                                                        <li  :class="(item.rating>0)? '' : 'star-half'"><span><i class="fas fa-star"></i></span></li>
                                                        <li :class="(item.rating>1)? '' : 'star-half'" ><span><i class="fas fa-star"></i></span></li>
                                                        <li :class="(item.rating>2)? '' : 'star-half'" ><span><i class="fas fa-star"></i></span></li>
                                                        <li :class="(item.rating>3)? '' : 'star-half'" ><span><i class="fas fa-star"></i></span></li>
                                                        <li :class="(item.rating>4)? '' : 'star-half'"  ><span><i class="fas fa-star"></i></span></li>
                                                    </ul>
                                                    <div class="review-date">
                                                        <!-- <p>5/8/2019 <span>5:25:36</span></p> -->
                                                        <p>{{item.created_at}}</p>
                                                    </div>
                                                </div>
                                                <div class="review-item-right-details">
                                                    <p>{{item.content}}</p>
                                                </div>
                                                
                                                <!-- <div class="review-gallary">
                                                    <figure>
                                                        <img src="/images/1000s.jpg" alt="">
                                                        <figcaption><p>Very simple menu</p></figcaption>
                                                    </figure>
                                                </div> -->
                                                <div class="review-btn-sec">
                                                    <p>Was this review ...?</p>
                                                    <div class="review-btn">
                                                        <ul>
                                                            <li><img src="/images/ic1.png" alt=""><span>Official</span></li>
                                                            <li><img src="/images/ic2.png" alt=""><span>Bravery Bagde</span></li>
                                                            <li><img src="/images/ic3.png" alt=""><span>Distinguished</span></li>
                                                        </ul>
                                                        <div class="review-btn-img">
                                                            <figure>
                                                                <img src="/images/nf.png" alt="">
                                                            </figure>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="new-inner-item-1">
                            <div class="col-md-3 col-sm-3">
                                <!-- Health Meter -->
                                <div class="switch-link-content _1health">
                                    <div class="_1health_title">
                                        <p class="_1health_title_text">Health Meter</p>

                                        <img class="_1health_img" src="/image/coach-review45.jpg" alt="" title="">

                                        <p class="_1health_value">100%</p>
                                    </div>

                                    <p class="_1health_subtitle">HEALTHY</p>

                                    <div class="_1health_numbers">
                                        <p class="_1health_numbers_text"><span>100</span></p>
                                        <p class="_1health_numbers_text"><span></span></p>
                                        <p class="_1health_numbers_text _1health_numbers_text_o"><span>50</span></p>
                                        <p class="_1health_numbers_text"><span></span></p>
                                        <p class="_1health_numbers_text"><span>100</span></p>
                                    </div>

                                    <p class="_1health_subtitle _1health_subtitle_border">HEALTHY</p>

                                    <div class="_1health_main">
                                        <p class="_1health_main_title">Flank News:We've enhanced our Health Meter</p>

                                        <ul class="_1health_main_list">
                                            <li>We've always working to improve the autherticity of the attributeselected on Flank</li>
                                            <li>We've always working to improve the autherticity of the attributeselected on Flank</li>
                                            <li>We've always working to improve the autherticity of the attributeselected on Flank</li>
                                        </ul>
                                    </div>

                                    <p class="_1health_more">
                                        <a class="_1health_more_a" href="">LEARN MORE</a>
                                    </p>
                                </div>
                                <!-- Health Meter -->

                                <div class="switch-link-content"></div>

                                <div class="switch-link-content">
                                    <div class="switch-link-title">
                                        <h4>Latest videos</h4>
                                    </div>
                                    <div class="flank-video">
                                        <iframe src="https://www.youtube.com/embed/IV1h5qgpdFg" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                                    </div>

                                    <div class="playing-list">
                                        <ul>
                                            <li>
                                                <div class="playing-btn">
                                                    <span><i class="fas fa-play"></i></span>
                                                </div>
                                                <div class="video-info">
                                                    <p>Out of control coaches' Abusive Behaviour Often Under Reported</p>
                                                    <ul>
                                                        <li>Now playing <span>•</span></li>
                                                        <li><p>2:18</p></li>
                                                    </ul>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="playing-btn">
                                                    <span><i class="fas fa-play"></i></span>
                                                </div>
                                                <div class="video-info">
                                                    <p>Out of control coaches' Abusive Behaviour Often Under Reported</p>
                                                    <ul>
                                                        <li><p>2:18</p></li>
                                                    </ul>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="playing-btn">
                                                    <span><i class="fas fa-play"></i></span>
                                                </div>
                                                <div class="video-info">
                                                    <p>Out of control coaches' Abusive Behaviour Often Under Reported</p>
                                                    <ul>
                                                        <li><p>2:18</p></li>
                                                    </ul>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="video-foot-img">
                                        <figure>
                                            <img src="/images/flank.png" alt="">
                                        </figure>
                                    </div>
                                </div>
                                <div class="flank-banner-two">
                                    <figure>
                                        <img src="/images/worstbanner.png" alt="">
                                    </figure>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        

        <footer class="new-footer">
            <div class="new-footer-top"></div>
        </footer>
        
    </div>
</template>

<script>


export default {
    data(){
        return{
            imgName: '/uploads/default.png',
            askModal:false,
            answerModal:false,
            askData:{
                content:'',
            },
           
            tempAIndex:'',
            atrrtributepoint:'',
            reviews:[],
            questionList:[],
            hours:[],
            similarCoaches:[],
            galleryIndex:0,
            todayHour:{},
            rpagination:{},
            totalQuestion:0,
            reviewSearch:'',
            reviewStar:0,
            isLoading:true,
            flip:-1,
            coach_id:-1,
            coach_index:-1,
            page:1,
            str:'',
            value2: 0,
            topReviews: [],
            
            chartData: [
                ['Days', 'Ratings'],
                [1, 5],
                [2, 4],
                [3, 3],
                [4, 5],
                [5, 4],
                [6, 2],
                [7, 5],
            ],
            chartOptions: {
                chart: {
                title: 'Company Performance',
                subtitle: 'Sales, Expenses, and Profit: 2014-2017',
                },
                 width: 300,
                  height: 300,
                colors: ['#e63131', '#e46a6a'],
                backgroundColor:'transparent',
                vAxis:{
                    
                    minValue:0,
                    maxValue:5,
                    gridlines: {
                        color: '#5C5C5C',
                        count: 5,
                    },
                    minorGridlines: {
                        color: '#5C5C5C',

                    },
                    textStyle:{
                        color: '#FFF',
                    }
                },
                hAxis:{
                    // maxValue: 1,
                    // format: '#%',
                    title:'Days',
                    titleTextStyle: {
                        color: '#FFF'
                    },
                    type:'string',
                     textStyle:{
                        color: '#FFF',
                    },
                    gridlines: {
                        color: '#5C5C5C',
                        count: 7,
                    },
                   
                   
                },
                trendlines: { 0: {} } ,

            },
       
        }
    },
    methods:{

        reviewPageWith(num){
            
        },
        async SearchReviewResult(){
           
            const res = await this.callApi('get', `reviews/${this.$route.params.id}?str=${this.reviewSearch}`)
            if(res.status===200){
                this.reviews = res.data.data
                this.rpagination = res.data
                delete this.rpagination.data
            }
            else{
                this.swr()
            }

        },
        setPage(index){
            this.page = index
            this.pageniateReview()
        },
        async pageniateReview(){
            console.log( ' aim here')
            if(this.coach_index != '-1'){
                this.coach_id = this.coaches[this.coach_index].id
            }
           let link = `/app/SchoolCoachReview/${this.$route.params.id}?page=${this.page}&str=${this.str}`
           if(this.coach_id != -1){
               link = link+`&coach=${this.coach_id}`
           }
            const res = await this.callApi('get',link )
            if(res.status===200){
                this.reviews = res.data.data
                this.rpagination = res.data
                delete this.rpagination.data
            }
            else{
                this.swr()
            }
        },
        prevModalImage(){
            if(this.galleryIndex>0){
                this.galleryIndex--;
            }
        },
        async answerModalOpen(item,index){
            this.answerData.question_id = item.id
            this.tempAIndex = index
            this.answerModal = true

        },
        async askQuestion(){
            if(this.askData.content == ''){
                this.i('You question field is empty!')
                return
            }
            if(this.isLoggedIn == false){
                this.i('Please login first !')
                this.$router.push('/login');
                return
            }

            this.askData.school_id = this.legendData.school.id
            const res = await this.callApi('post','/storequestions',this.askData)
            if(res.status===200){
                this.s("Your question has been posted successfully!")
                this.questionList.push(res.data)
                this.totalQuestion++
                this.askModal = false
            }
            else{
                this.swr();
            }

        },
        async reviewImo(imo,index,imoItem){
            if(this.isLoggedIn == false){
                this.i('Please login first !')
                this.$router.push('/login');
                return
            }
            let imoData = {
                review_id:this.reviews[index].id,
            }
            imoData[imo] = 1
            const res = await this.callApi('post','/stoteCoachReviewImo',imoData)
            if(res.status===200){
                this.s("you marked this review as "+imo+ "!")
                if(imo=='cool'){
                    imoItem.cool++
                    imoItem.acool=true
                }
                else if(imo=='funny'){
                    imoItem.funny++
                    imoItem.afunny=true
                }
                else if(imo=='useful'){
                    imoItem.useful++
                    imoItem.auseful = true
                }
            }
            else{
                this.swr();
            }

        },
        handleView (item) {
                this.imgName = item;
                
        },
        getImoName(name,index){
           return 
        },
        handleView (item) {
            this.imgName = item;
        },
        async getcoachatrributeConteptData(id,index){
            this.atrrtributepoint = []
            this.coach_index = index
            const res = await this.callApi('get', `/app/coachatrributeConteptData/${id}`)
            if(res.status == 200){
                this.atrrtributepoint = res.data
                this.flip = index
            }
            else{
                this.swr()
            }
        },
         
    },
    filters:{
        totalPercent(item){
            if(item.totalPoints<=0){
                return '0%'
            }
            return parseInt((item.totalPoints*100)/(item.points*item.totalvotes))+"%"
        }
    },
    async asyncData({app, store,redirect, params}){
        try {
            let {data} = await app.$axios.get(`/coaches/${params.id}`)
          
            return{
                legendData : data.School,
                school_id : data.School.school_id,
                totalReview : data.School.__meta__.allreview_count,
                averageRating : (data.School.avgRating)? data.School.avgRating.averageRating : 0 , 
                totalRating : (data.School.avgRating)? data.School.avgRating.totalRating : 0 , 
                
            }
		}catch (error) {
            console.log(error)
            return redirect('/')
		}
    },
   
   async created(){
       
        const [ res2, res4,res5,res6] = await Promise.all([
            this.callApi('get', `/app/getAdditionCoachInfo/${this.$route.params.id}`),
            this.callApi('get', `/app/singleSchoolCoachReview/${this.$route.params.id}`),
            this.callApi('get', `/app/getCoachTopReviews/${this.$route.params.id}`),
            this.callApi('get', `/app/getSimilarCoach/${this.school_id}`),
        ])
        if( res2.status===200 && res4.status === 200){
            
            this.reviews = res4.data.data
            this.similarCoaches = res6.data
            this.rpagination = res4.data
            this.topReviews = res5.data
            delete this.rpagination.data
            this.questionList = res2.data.questions
            this.totalQuestion = res2.data.__meta__.totalQuestion
            this.isLoading = false
            
        } else{
            this.swr()
            this.isLoading = false
        }
    }
}
</script>

<style>
/* .readmore {
  white-space: nowrap; 
    width: 441px;
  overflow: hidden;
  text-overflow: ellipsis; 
  
} */
</style>







       






