<template>
    <div>
        <section class="rd second-section bg">
            <div class="container">
                <div class="section-content">
                    <div class="review-content">
                        <div class="review-map-section">
                            <div class="row">
                                <div class="col-md-12"> 
                                    <div class="review-gallary">
                                        <div class="figure">
                                            <ul>
                                                <li @click="galleryModalOn(img_index)"><img  :src="(uploadList[img_index])? uploadList[img_index].url  : '/uploads/default.png' " ></li>
                                                <li @click="galleryModalOn((img_index+1))" ><img :src="(uploadList[img_index+1])? uploadList[img_index+1].url  : '/uploads/default.png' " ></li>
                                                <li @click="galleryModalOn((img_index+2))" ><img :src="(uploadList[img_index+2])? uploadList[img_index+2].url  : '/uploads/default.png' " ></li>
                                                <li @click="galleryModalOn((img_index+3))" ><img :src="(uploadList[img_index+3])? uploadList[img_index+3].url  : '/uploads/default.png' " ></li>
                                            </ul>
                                            <div class="gallary-button">
                                                <div class="button-left" @click="prevImage" >
                                                    <span><i class="fas fa-chevron-left"></i></span>
                                                </div>
                                                <div class="button-right" @click="nextImage" >
                                                    <span><i class="fas fa-chevron-right"></i></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-8 col-sm-8">
                                <div class="product-profile school-profile">
                                    <div class="product-thumb-data">
                                        <div class="product-thumb">
                                            <figure>
                                                <img :src="legendData.logo" alt="">
                                            </figure>
                                        </div>
                                        <div class="product-data">
                                            <div class="product-data-indi">
                                                <div class="product-data-icon">
                                                    <span><i class="fas fa-passport"></i></span>
                                                </div>
                                                <div class="product-data-des">
                                                    <h2><strong>{{legendData.schoolName}} | {{legendData.sport}}</strong></h2>
                                                    <div class="badge-review">
                                                        <p>
                                                             <span :class="(averageRating>0)? ' high rating-bg' : ''"><i class="fas fa-star"></i></span>
                                                            <span :class="(averageRating>1)? ' high rating-bg' : ''"><i class="fas fa-star"></i></span>
                                                            <span :class="(averageRating>2)? ' high rating-bg' : ''"><i class="fas fa-star"></i></span>
                                                            <span :class="(averageRating>3)? ' high rating-bg' : ''"><i class="fas fa-star"></i></span>
                                                            <span :class="(averageRating>4)? ' high rating-bg' : ''"><i class="fas fa-star"></i></span>
                                                            &nbsp;<small class="review-number">{{totalReview}} reviews</small>
                                                        </p>
                                                    </div>
                                                    <p><strong class="u-space-r-half">
                                                             {{legendData.city}}
                                                             {{(legendData.state)? ' ,'+legendData.state : '' }}
                                                             {{(legendData.division)? ' ,'+legendData.division : '' }}
                                                        </strong></p>
                                                </div>
                                            </div>
                                            <!-- <div class="product-data-indi product-data-indi-2">
                                                <div class="product-data-icon">
                                                    <span><i class="fas fa-calendar-week"></i></span>
                                                </div>
                                                <div class="product-data-des">
                                                    <p><strong>From:</strong> Saturday, Jun 1, 2:30 pm</p>
                                                    <p><strong>To:</strong> 10:00 pm</p>
                                                    <p><a href="">Add to calender <span><i class="fas fa-caret-down"></i></span></a></p>
                                                </div>
                                            </div> -->
                                        </div>
                                    </div>
                                </div>

                                <div class="reviewComment" >
                                    <h2>Ask the Community</h2>
                                    <hr>
                                    <div class="comment-individual">
                                         <Button @click="askModal=true" >Ask a question</Button>
                                    </div>
                                    <hr>
                                </div>
                                <div class="reviewComment askCommunity"  >
                                    <h2>Ask the Community</h2>
                                    <template v-if="totalQuestion>0 && isLoading==false " >
                                        <div class="question-set" v-for="(item,index) in questionList" :key="index" >
                                            <div class="comment-individual">
                                                <div class="media">
                                                    <div class="media-left">
                                                        <p><strong>Question:</strong></p>
                                                    </div>
        
                                                    <div class="media-body">
                                                        <p>{{item.content}}</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <p v-if="totalQuestion==1" class="all-que"><a href="">View question details</a></p>
                                        <p v-else class="all-que"><nuxt-link :to="{name: 'coachquestionlist-id', params: { id:legendData.id } }" >See all {{totalQuestion}} questions for {{legendData.schoolName}}</nuxt-link></p>
                                    </template>
                                    
                                    <h4 v-else-if="isLoading==true" class="noReview" >Content is Loading...</h4>

                                    <h4 v-else class="noReview" >No question yet!</h4>
                                    <hr>

                                    <!-- <div class="pageCount">
                                        <ul>
                                            <li><a href=""><i class="fas fa-chevron-left"></i>&nbsp;Prev</a></li>
                                            <li><a href="">Next&nbsp;<i class="fas fa-chevron-right"></i></a></li>
                                        </ul>
                                    </div>
                                    <hr> -->
                                </div>
                                <div class="reviewItem">
                                    <h2>Recommended Reviews <span>for Coaches</span></h2>
                                    <hr>
                                    <div class="searchByReview">
                                        <div class="searchReview">
                                                <div class="input-grp">
                                                    <!-- <input type="text" class="form-control"   placeholder="Search within the reviews">
                                                    <button @click="pageniateReview" ><i class="fas fa-search"></i></button> -->
                                                        <Select v-model="coach_id" filterable @on-change="pageniateReview" style="width: 50%;">
                                                            <Option value="-1">All</Option>
                                                            <Option v-for="(item,index) in coaches" :value="item.id" :key="index">{{ item.name }}</Option>
                                                        </Select>
                                                    
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
                                        </div>
                                        <div class="flip-card">
                                            <div class="row">
                                                <div class="col-md-4" v-for="(item,index) in coaches" :key="index"  >
                                                    <div class="flip-card-indi" >
                                                        <template  v-if="item.id==coach_id || coach_id==-1"  >
                                                            <div class="card-main" :class="(flip==index)? 'hide-card-main': ''"  >
                                                                <h3><span>Name:</span>{{item.name}}</h3>
                                                                <div class="card-toggle-button" @click="getcoachatrributeConteptData(item.id,index)" >
                                                                    <button  >Click here</button>
                                                                </div>
                                                            </div>
                                                            <div class="flipped-card" :class="(flip==index)? 'flipped-active-card': ''" >
                                                                <span class="close-flip" @click="flip=-1" ><i class="fas fa-times"></i></span>
                                                                <div class="business-info-sec reviewComment">
                                                                    <h3>More  info</h3>
                                                                    <div class="business-name" v-if="atrrtributepoint.length>0  && isLoading==false " >
                                                                        <ul>
                                                                            <li v-for="(item,index) in atrrtributepoint" :key="index" ><span><i class="fas fa-plus"></i>&nbsp;&nbsp;<span>{{item.content}} <strong>{{item | totalPercent}}</strong></span></span></li>
                                                                        </ul>
                                                                    </div>
                                                                    <h4 v-else-if="isLoading==true" class="noReview" >Content is Loading...</h4>
                                                                    <h4 v-else class="noReview" >No more yet!</h4>
                                                                </div>
                                                            </div>
                                                        </template>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <hr style="margin-bottom: 20px;">
                                        <div class="reviewOptionSort">
                                            <div class="sortTagFlank">Sort by&nbsp;<strong>Flank Sort&nbsp;<span><i class="fas fa-sort-down"></i></span>
                                                <ul>
                                                    <li><a href="">Flank Sort</a></li>
                                                    <li><a href="">Newest Sort</a></li>
                                                </ul>
                                                </strong>
                                            </div>
                                            <div class="searchReview">
                                                <form v-on:submit.prevent>
                                                    <input type="text" class="form-control" v-model="str" @keyup.enter="pageniateReview" placeholder="Search within the reviews">
                                                    <button @click="pageniateReview" ><i class="fas fa-search"></i></button>
                                                </form>
                                            </div>
                                        </div>
                                        <template v-if="reviews.length>0 && isLoading==false " >
                                            <div class="review-final" v-for="(item,index) in reviews" :key="index" >
                                                <div class="row">
                                                    <div class="col-md-5 col-sm-5">
                                                        <div class="media">
                                                            <div class="media-left">
                                                                <img class="media-object profile_picU" :src="item.reviwer.img" alt="">
                                                            </div>
                                                            <div class="media-body">
                                                                <p><strong>{{item.reviwer.firstName}}</strong></p>
                                                                <small><strong>{{item.reviwer.address}}</strong></small>
                                                                <p>
                                                                    <span><i class="fas fa-star"></i>&nbsp;{{item.reviwer.__meta__.totalreviewbyuser}}</span>
                                                                    <!-- <span><i class="fas fa-male"></i>&nbsp;1304</span>
                                                                    <span><span><i class="fas fa-camera"></i>&nbsp;1304</span></span> -->
                                                                    </p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-7 col-sm-7">
                                                        
                                                        <div class="read-review">
                                                            <div class="star-review">
                                                                <p>
                                                                    <span :class="(item.rating>0)? 'high rating-bg' : ''"><i class="fas fa-star"></i></span>
                                                                    <span :class="(item.rating>1)? 'high rating-bg' : ''"><i class="fas fa-star"></i></span>
                                                                    <span :class="(item.rating>2)? 'high rating-bg' : ''"><i class="fas fa-star"></i></span>
                                                                    <span :class="(item.rating>3)? 'high rating-bg' : ''"><i class="fas fa-star"></i></span>
                                                                    <span :class="(item.rating>4)? 'high rating-bg' : ''"><i class="fas fa-star"></i></span>
                                                                    &nbsp;<small>3/3/2019</small>
                                                                </p>
                                                            </div>
                                                            <p>{{item.content}}</p>
                                                            <div class="profile-gallary">
                                                                <ul>
                                                                    <li v-if="item.images[0]" ><a :href="item.images[0].url"><img :src="item.images[0].url"></a></li>
                                                                    <li v-if="item.images[1]"><a :href="item.images[1].url"><img :src="item.images[1].url"></a></li>
                                                                    <li v-if="item.images[2]"><a :href="item.images[2].url"><img :src="item.images[2].url"></a></li>
                                                                </ul>
                                                            </div>
                                                            <p id="resultReview"><strong>Was the review...?</strong></p>
                                                            <ul>
                                                                <template v-if="item.imos" >
                                                                    <li  @click="reviewImo('cool',index,item.imos)" :class="(item.imos.acool)? 'imo_back' : ''" ><i class="fas fa-grin-beam"></i>&nbsp;Cool&nbsp;&nbsp;{{item.imos.cool}}</li>
                                                                    <li  @click="reviewImo('funny',index,item.imos)" :class="(item.imos.afunny)? 'imo_back' : ''" ><i class="fas fa-grin-beam"></i>&nbsp;Funny&nbsp;&nbsp;{{item.imos.funny}}</li>
                                                                    <li  @click="reviewImo('useful',index,item.imos)" :class="(item.imos.auseful)? 'imo_back' : ''" ><i class="fas fa-grin-beam"></i>&nbsp;Useful&nbsp;&nbsp;{{item.imos.useful}}</li>
                                                                </template>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <hr>
                                                <div class="text-center ">
                                                    <div class="pagination-padding">
                                                        <Page :current="rpagination.page" :total="rpagination.total" @on-change="setPage($event)" :page-size="rpagination.perPage" />
                                                    </div>
                                                </div>
                                            <hr>
                                        </template>
                                          <h4 v-else-if="isLoading==true" class="noReview" >Content is Loading...</h4>
                                          <h4 v-else class="noReview" >No Review for {{legendData.schoolName}}'s Coaches</h4>
                                   
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4 reviewComment">
                                <div class="review-time-content">
                                    <ul>
                                        <li>
                                            <div class="biz-hours-icon">
                                                <span><i class="fas fa-passport"></i></span>
                                            </div>
                                            <div class="biz-hours-time">
                                                <div class="short-def-list">
                                                    <span   >
                                                         <strong class="u-space-r-half">
                                                             {{legendData.sport}}
                                                        </strong>
                                                    </span>
                                                   
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                                <div class="review-time-content">
                                    <ul>
                                        <li>
                                            <div class="biz-hours-icon">
                                                <span><i class="fas fa-map-marker-alt"></i></span>
                                            </div>
                                            <div class="biz-hours-time">
                                                <div class="short-def-list">
                                                    <span   >
                                                         <strong class="u-space-r-half">
                                                             {{legendData.city}}
                                                             {{(legendData.state)? ' ,'+legendData.state : '' }}
                                                             {{(legendData.division)? ' ,'+legendData.division : '' }}
                                                        </strong>
                                                    </span>
                                                   
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                                <div class="review-time-content" v-if="legendData.teamWebsite" >
                                    <ul>
                                        <li>
                                            <div class="biz-hours-icon">
                                                <span><i class="fas fa-globe"></i></span>
                                            </div>
                                            <div class="biz-hours-time">
                                                <div class="short-def-list">
                                                    <span   >
                                                         <a class="u-space-r-half" :href="legendData.teamWebsite" >{{legendData.teamWebsite}}</a>
                                                    </span>
                                                   
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                                <div class="review-time-content" v-if="legendData.roster"  >
                                    <ul>
                                        <li>
                                            <div class="biz-hours-icon">
                                                <span><i class="fas fa-copy"></i></span> 
                                            </div>
                                            <div class="biz-hours-time">
                                                <div class="short-def-list">
                                                    <span class="attribute-key">Roster</span>
                                                    <span>
                                                        <strong class="u-space-r-half"><span class="nowrap">{{legendData.roster}}</span></strong>
                                                    </span>
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                                <div class="review-time-content" v-if="legendData.alumni"  >
                                    <ul>
                                        <li>
                                            <div class="biz-hours-icon">
                                                <span><i class="fas fa-copy"></i></span> 
                                            </div>
                                            <div class="biz-hours-time">
                                                <div class="short-def-list">
                                                    <span class="attribute-key">Alumni</span>
                                                    <span>
                                                        <strong class="u-space-r-half"><span class="nowrap">{{legendData.alumni}}</span></strong>
                                                    </span>
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                                <div class="review-time-content" v-if="legendData.placedAthletes"  >
                                    <ul>
                                        <li>
                                            <div class="biz-hours-icon">
                                                <span><i class="fas fa-copy"></i></span> 
                                            </div>
                                            <div class="biz-hours-time">
                                                <div class="short-def-list">
                                                    <span class="attribute-key">Placed Athletes</span>
                                                    <span>
                                                        <strong class="u-space-r-half"><span class="nowrap">{{legendData.placedAthletes}}</span></strong>
                                                    </span>
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                                <div class="review-time-content" v-if="legendData.committedRecruit"  >
                                    <ul>
                                        <li>
                                            <div class="biz-hours-icon">
                                                <span><i class="fas fa-copy"></i></span> 
                                            </div>
                                            <div class="biz-hours-time">
                                                <div class="short-def-list">
                                                    <span class="attribute-key">Committed Recruit</span>
                                                    <span>
                                                        <strong class="u-space-r-half"><span class="nowrap">{{legendData.committedRecruit}}</span></strong>
                                                    </span>
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                                <div class="review-time-content" v-if="legendData.interestedAthletes"  >
                                    <ul>
                                        <li>
                                            <div class="biz-hours-icon">
                                                <span><i class="fas fa-copy"></i></span> 
                                            </div>
                                            <div class="biz-hours-time">
                                                <div class="short-def-list">
                                                    <span class="attribute-key">Interested Athletes</span>
                                                    <span>
                                                        <strong class="u-space-r-half"><span class="nowrap">{{legendData.interestedAthletes}}</span></strong>
                                                    </span>
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
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
        <Modal title="Image Gallery" v-model="galleryModal">
           <div class="row">
               <div class="col-md-8">
                    <figure>
                        <img v-if="uploadList[galleryIndex]" :src="uploadList[galleryIndex].url" style="width: 100%">
                        <div data-v-2c068581="" class="modal-button">
                            <div data-v-2c068581="" class="button-left">
                                <span data-v-2c068581="" @click="prevModalImage" ><i data-v-2c068581="" class="fas fa-chevron-left"></i></span>
                            </div> 
                            <div data-v-2c068581="" class="button-right" @click="nextModalImage" >
                                <span data-v-2c068581=""><i data-v-2c068581="" class="fas fa-chevron-right"></i></span>
                            </div>
                        </div>
                    </figure>
               </div>
               <div class="col-md-4">
                   <ul class="modal-list" >
                       <li  v-for="(item,index) in uploadList" :key="index" :class="(index==galleryIndex)? 'selected' : ''"><img :src="item.url" @click="galleryIndex=index" ></li>
                   </ul>
                   <!-- <div class="col-md-6"><img :src="imgName" style="width: 100%"></div>
                   <div class="col-md-6"><img :src="imgName" style="width: 100%"></div> -->

               </div>
           </div>
           <div slot="footer">
                <Button type="info"  @click="galleryModal=false">Close</Button>
            </div>
        </Modal>

    </div>
</template>

<script>
export default {
    data(){
        return{
            isEdit:false,
            formData:{
                name:'',
                address:'',
                phone:''
            },
            img_index:0,
            user_id:0,
            addImageModal:false,
            defaultList: [],
            imgName: '/uploads/default.png',
            askModal:false,
            galleryModal:false,
            answerModal:false,
            askData:{
                content:'',
            },
           
            tempAIndex:'',
            atrrtributepoint:'',
            reviews:[],
            questionList:[],
            hours:[],
            galleryIndex:0,
            todayHour:{},
            rpagination:{},
            totalQuestion:0,
            reviewSearch:'',
            reviewStar:0,
            isLoading:true,
            flip:-1,
            coach_id:-1,
            page:1,
            str:'',
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
        galleryModalOn(index){
            if(this.uploadList[index]){
                 this.galleryIndex = index
                this.galleryModal = true
            }
        },
        prevImage(){
            if(this.img_index>0){
                this.img_index--;
            }
        },
        nextImage(){
            if(this.img_index+4<this.uploadList.length){
                this.img_index++;
            }
        },
        prevModalImage(){
            if(this.galleryIndex>0){
                this.galleryIndex--;
            }
        },
        nextModalImage(){
            if(this.galleryIndex+1<this.uploadList.length){
                this.galleryIndex++;
            }
        },
        openImageModal(){
            if(this.uploadList.length>0) this.imgName = this.uploadList[(this.uploadList.length-1)].url

            this.addImageModal=true
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

            this.askData.school_id = this.legendData.id
            const res = await this.callApi('post','/storequestions',this.askData)
            if(res.status===200){
                this.s("Your question has been posted successfully!")
                this.questionList.unshift(res.data)
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
        handleRemove (index) {
            this.uploadList.splice(index, 1);
        },
        handleSuccess (res, file) {
            console.log(res)
            let ob = {
                url:res.file
            }
            this.imgName = res.file
            this.uploadList.push(ob)
            // file.url = 'https://o5wwk8baw.qnssl.com/7eb99afb9d5f317c912f08b5212fd69a/avatar';
            // file.name = '7eb99afb9d5f317c912f08b5212fd69a';
        },
        handleFormatError (file) {
            this.$Notice.warning({
                title: 'The file format is incorrect',
                desc: 'File format of ' + file.name + ' is incorrect, please select jpg or png.'
            });
        },
        handleMaxSize (file) {
            this.$Notice.warning({
                title: 'Exceeding file size limit',
                desc: 'File  ' + file.name + ' is too large, no more than 2M.'
            });
        },
        getImoName(name,index){
           return 
        },
        handleView (item) {
            this.imgName = item;
        },
        async getcoachatrributeConteptData(id,index){
            this.atrrtributepoint = []

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
            let {data} = await app.$axios.get(`/schools/${params.id}`)
          
            return{
                legendData : data.School,
                coaches : data.School.coaches,
                uploadList : data.School.allimages,
                totalReview : data.School.__meta__.allreview_count,
                averageRating : (data.School.avgRating)? data.School.avgRating.averageRating : 0 ,
                
            }
		}catch (error) {
            console.log(error)
            return redirect('/')
		}
    },
   
   async created(){
       
        const [ res2, res4] = await Promise.all([
            this.callApi('get', `/app/getAdditionCoachInfo/${this.$route.params.id}`),
            this.callApi('get', `/app/SchoolCoachReview/${this.$route.params.id}`),
        ])
        if( res2.status===200 && res4.status === 200){
            
            this.reviews = res4.data.data
            this.rpagination = res4.data
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

<style scoped>
.profile_picU{
    width: 40px;
    
}
.imo_back{
    background: #62b4dc;
}
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
    .noReview[data-v-2c068581] {
        text-align: center;
        padding: 10px;
    }
    .table_extra_p{

    }
</style>









       






