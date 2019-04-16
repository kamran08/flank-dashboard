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
                                <div class="demo-upload-list" v-for="(item,index) in uploadList" :key="index">
                                    <template >
                                        <img :src="item">
                                        <div class="demo-upload-list-cover">
                                            <Icon type="ios-eye-outline" @click.native="handleView(item)"></Icon>
                                            <Icon type="ios-trash-outline" @click.native="handleRemove(index)"></Icon>
                                        </div>
                                    </template>
                                </div>
                                <Upload
                                    ref="upload"
                                    :show-upload-list="false"
                                    :default-file-list="defaultList"
                                    :on-success="handleSuccess"
                                    :format="['jpg','jpeg','png']"
                                    :max-size="2048"
                                    :on-format-error="handleFormatError"
                                    :on-exceeded-size="handleMaxSize"
                                    :before-upload="handleBeforeUpload"
                                    multiple
                                    type="drag"
                                    action="/app/upload-review-file"
                                    style="display: inline-block;width:58px;">
                                    <div style="width: 58px;height:58px;line-height: 58px;" v-if="uploadList.length<3" >
                                        <Icon type="ios-camera" size="20"></Icon>
                                    </div>
                                </Upload>
                                <Modal title="View Image" v-model="visible">
                                    <img :src="imgName" v-if="visible" style="width: 100%">
                                </Modal>
                                <ul>
                                    <li>Atrrtibute  Yes No </li>
                                    <li v-for="(item,index) in AttributeInfo" :key="index" ><span>{{item.content}}</span> <span>&nbsp;&nbsp;<input v-model="item.isPositive" type="checkbox"></span> <span>&nbsp;&nbsp;<input v-model="item.isNegative" type="checkbox"></span> </li>


                                    <!-- <li><span>Cookie Cutter approach?</span>&nbsp;&nbsp;<input v-model="reviewData.q2"  type="checkbox"></li>
                                    <li><span>Does he pass the sniff test?</span>&nbsp;&nbsp;<input v-model="reviewData.q3"  type="checkbox"></li>
                                    <li><span>Does he bring supplies?</span>&nbsp;&nbsp;<input v-model="reviewData.q4"  type="checkbox"></li>
                                    <li><span>Quick heals for games?</span>&nbsp;&nbsp;<input v-model="reviewData.q5"  type="checkbox"></li> -->
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
            },
            rating:0,
            defaultList: [
                    {
                        'name': 'a42bdcc1178e62b4694c830f028db5c0',
                        'url': 'https://o5wwk8baw.qnssl.com/a42bdcc1178e62b4694c830f028db5c0/avatar'
                    },
                    {
                        'name': 'bc7521e033abdd1e92222d733590f104',
                        'url': 'https://o5wwk8baw.qnssl.com/bc7521e033abdd1e92222d733590f104/avatar'
                    }
            ],
            imgName: '',
            visible: false,
            uploadList: []
            
            
        }
    },
     async asyncData({app, store,redirect, params}){
        try {
            let {data} = await app.$axios.get(`/legends/${params.id}`)
          
            return{
                legendData : data.legend,
                userData : data.user,
                AttributeInfo : data.AttributeInfo,
            }
		}catch (error) {
            console.log(error)
            return redirect('/')
		}
    },
    methods:{
        async postReview(){
             if(this.isLoggedIn == false){
                this.i('Please login first !')
                this.$router.push('/login');
                return
            }
            if(this.reviewData.content == ''){
                this.i("You must write something in the review box!")
                return
            }
            if(this.reviewData.content == ''){
                this.i('Please rate this coach !')
                return;
            }
           
            
            this.reviewData.uploadList = this.uploadList
            this.reviewData.AttributeInfo = this.AttributeInfo

            const res = await this.callApi('post','reviews',this.reviewData)
            if(res.status===200){
                this.s('Review posted successfully!')
                this.$router.push('/profile/'+this.legendData.id)
            }
            else{
                this.swr();
            }
            
        },
        handleView (item) {
                this.imgName = item;
                this.visible = true;
        },
        handleRemove (index) {
            this.uploadList.splice(index, 1);
        },
        handleSuccess (res, file) {
            console.log(res)
            this.uploadList.push(res.file)
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
        handleBeforeUpload () {
            const check = this.uploadList.length < 3;
            if (!check) {
                this.$Notice.warning({
                    title: 'Up to 3 pictures can be uploaded.'
                });
            }
            return check;
        }
         
    },
    created(){
    this.reviewData.reviewFor = this.legendData.id
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

