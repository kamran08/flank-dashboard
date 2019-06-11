<template>
        <div>
        
        <!-- Header-->
        

        
        <section class="rd second-section">
            <div class="container">
                <div class="section-content">
                    <div class="review-content">
                        <div class="breadcrumbs">
                            <ul>
                                <li><nuxt-link :to="{name: 'profile-id', params: { id:legend_id } }">{{legendData.name}}</nuxt-link></li>
                                <li><span><i class="fas fa-chevron-right"></i></span>Ask the Community</li>
                            </ul>
                        </div>

                        <div class="row">
                            <div class="col-md-8">
                                <div class="reviewComment no_margin border-right">
                                    <div class="comment_title border-bottom">
                                        <h2>Ask the Community</h2>
                                        <!-- <div class="sortTag no_pos">Sort by&nbsp;<strong>Popular&nbsp;
                                            <span><i class="fas fa-sort-down"></i></span>
                                            <ul>
                                                <li><a href="">Popular</a></li>
                                                <li><a href="">Most Answerd</a></li>
                                                <li><a href="">Newest First</a></li>
                                            </ul>
                                            </strong>
                                        </div> -->
                                    </div>
                                    <div class="comment-individual border-bottom" v-for="(item,index) in questionList" :key="index" >
                                        <p><strong>{{item.content}}</strong></p>
                                        <div class="media" v-if="item.answers.length>0" >
                                            <div class="media-left">
                                                <img class="profile_picU" :src="item.answers[0].user.img" alt="">
                                            </div>

                                            <div class="media-body">
                                                <p>{{item.answers[0].user.firstName}} {{item.answers[0].user.lastName}}</p>
                                                <span><small>Business Manager</small></span>
                                                <br><br>
                                                <p>{{item.answers[0].content}}</p>
                                                <span><small>{{item.answers[0].created_at}}</small></span>
                                            </div>
                                        </div>
                                        <p>
                                            <nuxt-link :to="{name: 'question_details-legend_id-id', params: { legend_id:legend_id , id:item.id } }" >View question details</nuxt-link>
                                        </p>
                                    </div>
                                    <div class="pageCount">
                                            <ul>
                                                <li @click="pageniateQuestion(-1)" ><a><i class="fas fa-chevron-left"></i>&nbsp;Prev</a></li>
                                                <li @click="pageniateQuestion(1)" ><a >Next&nbsp;<i class="fas fa-chevron-right"></i></a></li>
                                            </ul>
                                        </div>
                                    <div class="question-button">
                                        <p>Don’t see your question? Ask away!</p>
                                        <button @click="askModal=true" >Ask a question</button>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">

                                <div class="view-sect">
                                    <div class="view-media">
                                        <!-- <div class="media">
                                            <div class="media-left">
                                                <img src="image/80.png" alt="">
                                            </div>
                                            <div class="media-body">
                                                <h4><a href="">The Inn Above Tide</a></h4>
                                                <div class="star-review">
                                                    <p><span class="high rating-bg"><i class="fas fa-star"></i></span><span class="high rating-bg"><i class="fas fa-star"></i></span><span class="high rating-bg"><i class="fas fa-star"></i></span><span class="high rating-bg"><i class="fas fa-star"></i></span><span class=""><i class="fas fa-star"></i></span>&nbsp;<small>3/3/2019</small></p>
                                                    <span>$$</span>&nbsp;&nbsp;•&nbsp;&nbsp;<span>Japanese, Sushi Bars</span>
                                                    <span>Financial District</span>
                                                </div>
                                            </div>
                                        </div> -->
                                        <div class="media"  >
                                            <div class="media-left">
                                                <img class="profile_picU" :src="(legendData.firstImage)? legendData.firstImage.url : '/uploads/default.png'" alt="">
                                            </div>
                                            <div class="media-body">
                                                <h4><nuxt-link :to="{name: 'profile-id', params: { id:legend_id } }">{{legendData.name}}</nuxt-link></h4>
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
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <Modal title="Ask the Community" v-model="askModal">
           <div class="">
            <Form  :label-width="80">
              
               <FormItem label="Question">
                   <Input v-model="askData.content" type="textarea" :autosize="{minRows: 2,maxRows: 5}" placeholder="Ask your question ..."></Input>
               </FormItem>
            </Form>
           </div>
           <div slot="footer">
                <Button  @click="askModal=false">Cancle</Button>
                <Button type="info" @click="askQuestion">Ask</Button>
            </div>
        </Modal>
    </div>
</template>

<script>
export default {
    data(){
        return{
            legend_id:'',
            askModal:false,
            askData:{
                content:'',
            },
            legendData :{},
            userData:{},
            averageRating :0,
            healthPulse :{},
            rpagination:{},

        }
    },
    methods:{
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
            this.askData.legend_id = this.legend_id
            const res = await this.callApi('post','/questions',this.askData)
            if(res.status===200){
                this.s("Your question has been posted successfully!")
                res.data.answers = []
                this.questionList.unshift(res.data)
                this.askModal = false
            }
            else{
                this.swr();
            }

        },
         async pageniateQuestion(index){
             console.log(this.rpagination)
            if(this.rpagination.page+index <=0 || this.rpagination.page+index > this.rpagination.lastPage){
                this.i("No more pages left!")
                return
            }
            this.rpagination.page = this.rpagination.page+index
           
            const res = await this.callApi('get', `questions/${this.$route.params.id}?page=${this.rpagination.page}`)
            if(res.status===200){
                this.questionList = res.data.data
                this.rpagination = res.data
                delete this.rpagination.data
            }
            else{
                this.swr()
            }
        },

    },
     async asyncData({app, store,redirect, params}){
        try {
            let {data} = await app.$axios.get(`/questions/${params.id}`)
          
            return{
                questionList : data.data,
                rpagination : data
            }
		}catch (error) {
            console.log(error)
            return redirect('/')
		}
    },
    async created(){
        this.legend_id = this.$route.params.id
         const [res1] = await Promise.all([
            this.callApi('get', `legends/${this.$route.params.id}`),
        ])
        if(res1.status===200){ 
                this.legendData = res1.data.legend
                this.userData = res1.data.user
                this.averageRating = res1.data.averageRating
                this.healthPulse = res1.data.healthPulse
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
</style>

