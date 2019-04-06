<template>
<div>
        
        <!-- Header-->
        
        <header>
            <div class="header-second">
                <div class="container">
                    <a href="index.html" class="navbar-brand"><img class="img-responsive" src="/image/default.png" alt=""></a>
                    <h2>Write a Review</h2>
                   <!-- <div class="pull-right">
                       <ul class="logsign wr">
                           <li><a href="login.html">Log In</a></li>
                           <li><a href="signup.html">Sign Up</a></li>
                       </ul>
                   </div> -->
                </div>
            </div>
        </header>
        
        <section class="rd second-section bg wr-page">
            <div class="container">
                <div class="section-content">
                    <div class="row">
                        <div class="col-md-8">
                            <div class="wr-page-title">
                                <h1><a @click="$router.push(`/profile/${legendData.id}`)"><strong>{{legendData.name}}</strong></a></h1>
                                <p><a href="">Read our review guidelines</a></p>
                            </div>
                            <br>
                            <div class="full-text-area-box">
                                <div class="textarea">
                                    <div class="star-review" style="background: #fff; text-align: center;" >
                                        <p><small>Select your rating</small></p>
                                        <Rate v-model="rating" icon="md-star" @on-change="reviewData.rating=rating" />
                                    </div>
                                    <textarea v-model="reviewData.content" class="form-control" id="my_textarea" rows="15" placeholder="Your review helps others learn about great local businesses. 
                                    Please don't review this business if you received a freebie for writing this review, or if you're connected in any way to the owner or employees." name="message"></textarea>
                                    
                                </div>
                                <button @click="postReview">Post a Review</button>
                            </div>
                            <div class="text-area-checkbox">
                                <ul>
                                    <li><span>Does He ride the storm?</span>&nbsp;&nbsp;<input v-model="reviewData.q1" type="checkbox"></li>
                                    <li><span>Cookie Cutter approach?</span>&nbsp;&nbsp;<input v-model="reviewData.q2"  type="checkbox"></li>
                                    <li><span>Does he pass the sniff test?</span>&nbsp;&nbsp;<input v-model="reviewData.q3"  type="checkbox"></li>
                                    <li><span>Does he bring supplies?</span>&nbsp;&nbsp;<input v-model="reviewData.q4"  type="checkbox"></li>
                                    <li><span>Quick heals for games?</span>&nbsp;&nbsp;<input v-model="reviewData.q5"  type="checkbox"></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="sidebar open none">
                    <button>
                        <span><i class="fas fa-caret-right"></i></span>
                    </button>
                    
                    <div class="sidebar-inner">
                        <h2>Recent Review</h2>
                        <div class="sidebar-review-individual">
                                <div class="media">
                                    <div class="media-left">
                                        <img src="/image/30s.jpg" alt="">
                                    </div>
        
                                    <div class="media-body">
                                        <p>Anthone C</p>
                                        <p><span><i class="fas fa-male"></i>0</span><span><i class="fas fa-star"></i>3</span></p>
                                    </div>
                                </div>
                                <p class="sidebar-rev"><span><i class="fas fa-star"></i></span><span><i class="fas fa-star"></i></span><span><i class="fas fa-star"></i></span><span><i class="fas fa-star"></i></span><span><i class="fas fa-star"></i></span>&nbsp;&nbsp;<small>3/5/2019</small></p>
                                <p>The best tongue sandwich in NYC. If you just want a,snake, give a hot dog.</p>
                            </div>
                            <div class="sidebar-review-individual">
                                <div class="media">
                                    <div class="media-left">
                                        <img src="/image/30s.jpg" alt="">
                                    </div>
        
                                    <div class="media-body">
                                        <p>Anthone C</p>
                                        <p><span><i class="fas fa-male"></i>0</span><span><i class="fas fa-star"></i>3</span></p>
                                    </div>
                                </div>
                                <p class="sidebar-rev"><span><i class="fas fa-star"></i></span><span><i class="fas fa-star"></i></span><span><i class="fas fa-star"></i></span><span><i class="fas fa-star"></i></span><span><i class="fas fa-star"></i></span>&nbsp;&nbsp;<small>3/5/2019</small></p>
                                <p>The best tongue sandwich in NYC. If you just want a,snake, give a hot dog.</p>
                            </div>
                            <div class="sidebar-review-individual">
                                <div class="media">
                                    <div class="media-left">
                                        <img src="/image/30s.jpg" alt="">
                                    </div>
        
                                    <div class="media-body">
                                        <p>Anthone C</p>
                                        <p><span><i class="fas fa-male"></i>0</span><span><i class="fas fa-star"></i>3</span></p>
                                    </div>
                                </div>
                                <p class="sidebar-rev"><span><i class="fas fa-star"></i></span><span><i class="fas fa-star"></i></span><span><i class="fas fa-star"></i></span><span><i class="fas fa-star"></i></span><span><i class="fas fa-star"></i></span>&nbsp;&nbsp;<small>3/5/2019</small></p>
                                <p>The best tongue sandwich in NYC. If you just want a,snake, give a hot dog.</p>
                            </div>
                            <div class="sidebar-review-individual">
                                <div class="media">
                                    <div class="media-left">
                                        <img src="/image/30s.jpg" alt="">
                                    </div>
        
                                    <div class="media-body">
                                        <p>Anthone C</p>
                                        <p><span><i class="fas fa-male"></i>0</span><span><i class="fas fa-star"></i>3</span></p>
                                    </div>
                                </div>
                                <p class="sidebar-rev"><span><i class="fas fa-star"></i></span><span><i class="fas fa-star"></i></span><span><i class="fas fa-star"></i></span><span><i class="fas fa-star"></i></span><span><i class="fas fa-star"></i></span>&nbsp;&nbsp;<small>3/5/2019</small></p>
                                <p>The best tongue sandwich in NYC. If you just want a,snake, give a hot dog.</p>
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
            reviewData:{
                reviewFor:'',
                content:"",
                rating:'',
                q1:false,
                q2:false,
                q3:false,
                q4:false,
                q5:false,
            },
            legendData:{},
            userData:{},
            rating:0,
            
            
        }
    },
    methods:{
        async getUserInfo(id){
            const res = await this.callApi('get',`/legends/${id}`)
            if(res.status ===200){
                this.legendData = res.data.legend
                this.userData = res.data.user
                this.reviewData.reviewFor = this.userData.id
            }
            else{
                this.swr()
            }
        },
        async postReview(){
            if(this.reviewData.content == ''){
                this.i("You must write something in the review box!")
                return
            }
            if(this.reviewData.content == ''){
                this.i('Please rate this coach !')
                return;
            }
            if(this.isLoggedIn == false){
                this.i('Please login first !')
                this.$router.push('/login');
            }
            const res = await this.callApi('post','reviews',this.reviewData)
            if(res.status===200){
                this.s('Review posted successfully!')
                this.$router.push('/profile/'+legendData.id)
            }
            else{
                this.swr();
            }
            
        },
         
    },
    created(){
        
         this.getUserInfo(this.$route.params.id)
    }
}
</script>

<style scoped>
.demo-upload-list{
        display: inline-block;
        width: 60px;
        height: 60px;
        text-align: center;
        line-height: 60px;
        border: 1px solid transparent;
        border-radius: 4px;
        overflow: hidden;
        background: #fff;
        position: relative;
        box-shadow: 0 1px 1px rgba(0,0,0,.2);
        margin-right: 4px;
    }
    .demo-upload-list img{
        width: 100%;
        height: 100%;
    }
    .demo-upload-list-cover{
        display: none;
        position: absolute;
        top: 0;
        bottom: 0;
        left: 0;
        right: 0;
        background: rgba(0,0,0,.6);
    }
    .demo-upload-list:hover .demo-upload-list-cover{
        display: block;
    }
    .demo-upload-list-cover i{
        color: #fff;
        font-size: 20px;
        cursor: pointer;
        margin: 0 2px;
    }
</style>

