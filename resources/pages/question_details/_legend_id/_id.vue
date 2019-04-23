<template>
    <div>
        
        <!-- Header-->
        
        <header>
            <div class="header-second">
                <div class="container">
                    <a href="index.html" class="navbar-brand"><img class="img-responsive" src="assets/image/default.png" alt=""></a>
                    <form action="#">
                        <div class="equal-div">
                            <div class="input-group">
                                <span class="input-group-addon" id="basic-addon1">Find</span>
                                <input type="text" class="form-control" placeholder="tacos, cheap dinner, Max's" aria-describedby="basic-addon1">
                            </div>
                            <div class="input-group">
                               <span class="input-group-addon position-top" id="basic-addon1">Near</span>
                                <input type="text" class="form-control" placeholder="address, neighborhood, zip or state" value="New York, NY">
                                <span class="input-group-btn search-btn review-search-btn position-top"><i class="fas fa-search"></i></span>
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
                   <div class="pull-right">
                       <ul class="logsign">
                           <li><a href="">Log In</a></li>
                           <li><a href="">Sign Up</a></li>
                       </ul>
                   </div>
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
                   </ul>
               </div>
            </div>
        </header>
        
        <section class="rd second-section" v-if="questionData" >
            <div class="container">
                <div class="section-content">
                    <div class="review-content">
                        <div class="breadcrumbs">
                            <ul>
                                <li><nuxt-link :to="{name: 'profile-id', params: { id:legend_id } }">{{legendData.name}}</nuxt-link></li>
                                <li><span><i class="fas fa-chevron-right"></i></span><nuxt-link :to="{name: 'questionlist-id', params: { id:legend_id } }">Ask the Community</nuxt-link></li>
                                <li><span><i class="fas fa-chevron-right"></i></span>Details</li>
                            </ul>
                        </div>
                        
                        <div class="row" >
                            <div class="col-md-8">
                                <div class="full-question border-right">
                                    <div class="ques">
                                        <h3>{{questionData.content}}</h3>
                                        <span><small>Asked by <a >{{questionData.user.firstName}} {{questionData.user.lastName}} </a> </small></span>&nbsp;&nbsp;&#8226;&nbsp;&nbsp;<span><small>{{questionData.created_at}}</small></span>
                                        <span class="icon-flag"><i class="fas fa-flag"></i></span>
                                        <div class="bellow-link border-bottom">
                                            <p>{{questionData.allAnswers.length}} Answer</p>
                                            <!-- <div class="sortTag no_pos">Sort by&nbsp;<strong>Popular&nbsp;<span><i class="fas fa-sort-down"></i>
                                                        
                                            </span>
                                                <ul>
                                                    <li><a href="">Popular</a></li>
                                                    <li><a href="">Most Answerd</a></li>
                                                    <li><a href="">Newest First</a></li>
                                                </ul>
                                            </strong>
                                                
                                            </div> -->
                                        </div>
                                    </div>
                                    <template v-if="questionData.allAnswers.length" >
                                        <div class="comment-individual border-bottom" v-for="(item,index) in questionData.allAnswers" :key="index"  >
                                            <div class="media">
                                                <div class="media-left">
                                                    <img class="profile_picU" :src="item.user.img" alt="">
                                                </div>

                                                <div class="media-body">
                                                    <p>{{item.user.firstName}} {{item.user.lastName}} </p>
                                                    <span><small>Business Manager</small></span>
                                                    <br><br>
                                                    <p>{{item.content}}</p>
                                                    <span><small>{{item.created_at}}</small></span>
                                                </div>
                                                <!-- <div class="media-body-left">
                                                    <span><small>{{item.created_at}}</small></span>
                                                    <ul>
                                                        <li>Update</li>
                                                        <li>Delete</li>
                                                    </ul>
                                                </div> -->
                                            </div>
                                            <!-- <div class="check_review_button">
                                                <ul>
                                                    <li><button><span><i class="fas fa-arrow-up"></i></span> Helpful</button></li>
                                                    <li><button><span><i class="fas fa-arrow-down"></i></span> Not Helpful</button></li>
                                                </ul>
                                                <span class="icon-flag"><i class="fas fa-flag"></i></span>
                                            </div> -->
                                        </div>
                                    </template>
                                    

                                    <div class="question-button">
                                        <p>Provide an answer:</p>
                                        <button  @click="answerModal = true" >Post an Answer</button>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">

                                <div class="view-sect">
                                    <div class="view-media">
                                        <div class="media">
                                            <div class="media-left">
                                                <img class="profile_picU" :src="(legendData.firstImage)? legendData.firstImage.url : '/uploads/default.png'" alt="">
                                            </div>
                                            <div class="media-body">
                                                <h4><a href="">{{legendData.name}}</a></h4>
                                                <div class="star-review">
                                                    <p>
                                                        <span :class="(averageRating>0)? ' rating-bg' : ''"><i class="fas fa-star"></i></span>
                                                        <span :class="(averageRating>1)? ' rating-bg' : ''"><i class="fas fa-star"></i></span>
                                                        <span :class="(averageRating>2)? ' rating-bg' : ''"><i class="fas fa-star"></i></span>
                                                        <span :class="(averageRating>3)? ' rating-bg' : ''"><i class="fas fa-star"></i></span>
                                                        <span :class="(averageRating>4)? ' rating-bg' : ''"><i class="fas fa-star"></i></span>
                                                        &nbsp;<small v-if="legendData.__meta__" class="review-number">{{(legendData.__meta__.totalReview_count)? legendData.__meta__.totalReview_count : 0}} reviews</small>
                                                    </p>
                                                    <span></span>&nbsp;&nbsp;•&nbsp;&nbsp;<span>{{legendData.address}}</span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="other-ques">
                                            <h3 class="border-bottom">Other questions for The Inn Above Tide</h3>
                                            <div class="other-ques-det">
                                                <p>What your rates?</p>
                                                <p><a href="">View 1 answer</a></p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <h2 class="isloadingClass" v-else >Content is Loading....</h2>
        <Modal title="Answer Question" v-model="answerModal">
           <div class="">
            <Form  :label-width="80">
              
               <FormItem label="answer">
                   <Input v-model="answerData.content" type="textarea" :autosize="{minRows: 2,maxRows: 5}" placeholder="Ask your question ..."></Input>
               </FormItem>
            </Form>
           </div>
           <div slot="footer">
                <Button  @click="answerModal=false">Cancle</Button>
                <Button type="info" @click="answerQuestion">Answer</Button>
            </div>
        </Modal>
    </div>
</template>

<script>
export default {
    data(){
        return{
            
            isLoading:false,
            legendData :{},
            userData:{},
            averageRating :0,
            healthPulse :{},
            answerModal : false,
             answerData:{
                content:'',
            },
        }
    },
    async asyncData({app, store,redirect, params}){
        try {
            let {data} = await app.$axios.get(`/answers/${params.id}`)
          
            return{
                questionData : data
            }
		}catch (error) {
            console.log(error)
             return redirect('/')
		}
    },
    methods:{
        async answerQuestion(){
            if(this.answerData.content == ''){
                this.i('You asnwerfield field is empty!')
                return
            }
            if(this.isLoggedIn == false){
                this.i('Please login first !')
                this.$router.push('/login');
                return
            }
            this.answerData.question_id = this.questionData.id
            const res = await this.callApi('post','/answers',this.answerData)
            if(res.status===200){
                this.s("Your answer has been posted successfully!")
                res.data.user = this.authInfo
                this.questionData.allAnswers.unshift(res.data)
                this.answerModal = false
            }
            else{
                this.swr();
            }

        },
    },
    async created(){
        this.legend_id = this.$route.params.legend_id
         const [res1] = await Promise.all([
            this.callApi('get', `legends/${this.legend_id}`),
        ])
        if(res1.status===200){ 

                this.legendData = res1.data.legend
                this.userData = res1.data.user
                this.averageRating = res1.data.averageRating
                this.healthPulse = res1.data.healthPulse
                this.isLoading = false
        } else{
            this.swr()
        }
    }
}
</script>

<style scoped>
     .profile_picU{
        width: 40px;
    }
    .isloadingClass{
        margin: 0 auto;
        text-align: center;
        padding: 20px;
    }
</style>
