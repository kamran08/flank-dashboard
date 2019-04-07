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
                   <!-- <div class="pull-right">
                       <ul class="logsign">
                           <li><a href="">Log In</a></li>
                           <li><a href="">Sign Up</a></li>
                       </ul>
                   </div> -->
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
        
        <section class="rd second-section bg">
            <div class="container">
                <div class="section-content">
                    <div class="review-content">
                        <h1 v-if="!isEdit" ><strong>{{legendData.name}}</strong> <small><i class="fas fa-check-circle"></i> Claimed</small>&nbsp;&nbsp;&nbsp; <strong v-if="isLoggedIn && user_id == userData.id" > <a v-if="!isEdit" @click="editOn" >Edit</a></strong></h1>
                        <div class="header-input big-input" v-else >
                                <input v-model="formData.name" type="text"> <h1 v-if="isEdit" @click="legendUpdate"><a >Save</a></h1>
                            </div>
                        <div class="coach-review star-review">
                            <p>
                                <span class="rating-bg"><i class="fas fa-star"></i></span>
                                <span class="rating-bg"><i class="fas fa-star"></i></span>
                                <span class="rating-bg"><i class="fas fa-star"></i></span>
                                <span class="rating-bg"><i class="fas fa-star"></i></span>
                                <span class=""><i class="fas fa-star"></i></span>
                                &nbsp;746 reviews
                            <span id="showReviewDetails"><i class="fas fa-chart-bar"></i>&nbsp;Details <small>Review details</small></span>
                            </p>
                        </div>

                        <div class="review-map-section">
                            <div class="row">
                                <div class="col-md-4 col-sm-4">
                                    <div class="review-map">
                                        <div id="googleMap">
                                            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3619.1319108944804!2d91.86157565011207!3d24.893481749986655!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3750552cd77aff43%3A0x77aa5c2368933e2d!2sNirvana+Inn!5e0!3m2!1sbn!2sbd!4v1468246452415"></iframe>  
                                        </div>
                                        <div class="map-details">
                                           <p v-if="!isEdit"><i class="fas fa-map-marker-alt"></i><span>&nbsp;&nbsp;&nbsp;<strong>{{legendData.address}}</strong></span></p>
                                            <input type="text"  v-model="formData.address"  v-else class="adress-input">
                                           <p><i class="fas fa-directions"></i>&nbsp;&nbsp;<a href="">Get Directions</a></p>
                                           <p v-if="!isEdit"><i class="fas fa-phone"></i>&nbsp;&nbsp;{{legendData.phone}}</p>
                                           <input type="text" v-model="formData.phone"  v-else class="adress-input">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-8 col-sm-8">
                                    <div class="review-gallary">
                                        <div class="review-option">
                                            <button @click="$router.push(`/addreview/${legendData.id}`)" v-if=" user_id !== userData.id"  ><i class="fas fa-star"></i>&nbsp;Write a Review</button>
                                            
                                            <ul>
                                                <li @click="addImageModal=true" ><a ><i class="fas fa-camera"></i>&nbsp;Add Photo</a></li>
                                                <!-- <li><a href=""><i class="fas fa-share-square"></i>&nbsp;Share</a></li>
                                                <li><a href=""><i class="fas fa-bookmark"></i>&nbsp;Save</a></li> -->
                                            </ul>
                                        </div>
                                        <div class="figure">
                                            <ul>
                                                <li><img src="/uploads/default.png" alt=""></li>
                                                <li><img src="/uploads/default.png" alt=""></li>
                                                <li><img src="/uploads/default.png" alt=""></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-8 col-sm-8">
                                <div class="reviewComment">
                                    <h2>Ask the Community</h2>
                                    <hr>
                                    <div class="comment-individual">
                                        <p><strong>Is it okay to order a pastrami sandwich to share?</strong></p>
                                        <div class="media">
                                            <div class="media-left">
                                                <img src="/image/30s.jpg" alt="">
                                            </div>

                                            <div class="media-body">
                                                <p>Perfectly fine. It's actually what my girlfriend and I did on our trip and then we had room to also include some other sides like the very delicious matzo ball soup.</p>
                                                <span><small>1 year ago</small></span>&nbsp;&nbsp;&#8226;&nbsp;&nbsp;<span><small>7 people found this helpful</small></span>
                                            </div>
                                        </div>
                                        <p><a href="">View 22 more answers</a></p>
                                    </div>
                                    <hr>
                                </div>
                                <div class="reviewItem">
                                    <h2>Recommended Reviews <span>for Name of Coach</span></h2>
                                    <hr>
                                    <div class="searchByReview">
                                        <div class="searchReview">
                                            <input type="text" class="form-control" placeholder="Search within the reviews">
                                            <button><i class="fas fa-search"></i></button>
                                            <div class="sortTag">Sort by&nbsp;<strong>Flank Sort&nbsp;<span><i class="fas fa-sort-down"></i>
                                                  
                                               </span>
                                                <ul>
                                                        <li><a href="">Flank Sort</a></li>
                                                        <li><a href="">Newest Sort</a></li>
                                                    </ul>
                                                </strong>
                                                
                                            </div>
                                            
                                            <hr>
                                        </div>
                                        
                                        <div class="star-review">
                                            <p><span class="rating-bg"><i class="fas fa-star"></i></span><span class="rating-bg"><i class="fas fa-star"></i></span><span class="rating-bg"><i class="fas fa-star"></i></span><span class="rating-bg"><i class="fas fa-star"></i></span><span class=""><i class="fas fa-star"></i></span></p>
                                            <hr>
                                            <p class="moreD"><a href="">Start your review of <strong>New Coach</strong>.</a></p>
                                        </div>
                                        <hr>
                                        <div class="review-final" v-for="(item,index) in reviews" :key="index" >
                                            <div class="row">
                                                <div class="col-md-6 col-sm-6">
                                                    <div class="media">
                                                        <div class="media-left">
                                                            <img class="media-object" src="/image/80.png" alt="">
                                                        </div>
                                                        <div class="media-body">
                                                            <p><strong><a href="">{{item.reviwer.firstName}}</a></strong></p>
                                                            <small><strong>San Francisco Bay Area, CA</strong></small>
                                                            <p><span><i class="fas fa-male"></i>&nbsp;856</span><span><i class="fas fa-male"></i>&nbsp;1304</span><span><span><i class="fas fa-camera"></i>&nbsp;1304</span></span></p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6 col-sm-6">
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
                                                        <br><br><br>
                                                        <p id="resultReview"><strong>Was the review...?</strong></p>
                                                        <ul>
                                                            <li><i class="fas fa-grin-beam"></i>&nbsp;Useful</li>
                                                            <li><i class="fas fa-grin-beam"></i>&nbsp;Funny</li>
                                                            <li><i class="fas fa-grin-beam"></i>&nbsp;Useful</li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="pageCount">
                                            <p>Page 1 of 531</p>
                                            <ul>
                                                <li class="active"><a href="">1</a></li>
                                                <li><a href="">2</a></li>
                                                <li><a href="">3</a></li>
                                                <li><a href="">4</a></li>
                                                <li><a href="">5</a></li>
                                                <li><a href="">Next&nbsp;<i class="fas fa-chevron-right"></i></a></li>
                                            </ul>
                                        </div>
                                        <hr>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4 col-sm-4">
                                <div class="business-info-sec reviewComment">
                                    <h3>More  info</h3>
                                    <div class="business-name">
                                        <p>Does He ride the storm? &nbsp;&nbsp;<span> <strong>5/10</strong></span></p>
                                        <p>Cookie Cutter approach? &nbsp;&nbsp;<span><strong>5/10</strong></span></p>
                                        <p>Does he pass the sniff test? &nbsp;&nbsp;<span><strong>5/10</strong></span></p>
                                        <p>Does he bring supplies?  &nbsp;&nbsp;<span><strong>5/10</strong></span></p>
                                        <p>Quick heals for games? &nbsp;&nbsp;<span><strong>5/10</strong></span></p>
                                        
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <Modal title="View Image" v-model="addImageModal">
           <div class="">
                <div >
                 <img :src="imgName" style="width: 100%">
            </div>
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
           </div>
           <div slot="footer">
                <Button  @click="addImageModal=false">Cancle</Button>
                <Button type="info" @click="uploadsPhotos">Upload</Button>
            </div>
        </Modal>

    </div>
</template>

<script>
export default {
    data(){
        return{
            isEdit:false,
            legendData:{},
            userData:{},
            formData:{
                name:'',
                address:'',
                phone:''
            },
            reviews:[],
            user_id:0,
            addImageModal:false,
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
            imgName: '/uploads/default.png',
            visible: false,
            uploadList: []
        }
    },
    methods:{
        async getUserInfo(id){
            const res = await this.callApi('get',`/legends/${id}`)
            if(res.status ===200){
                this.legendData = res.data.legend
                this.userData = res.data.user
                this.reviews = res.data.user.reviews
            }
            else{
                this.swr()
            }
        },
        
        async editOn(){
            this.formData.name = this.legendData.name
            this.formData.address = this.legendData.address
            this.formData.phone = this.legendData.phone
            this.isEdit = true
        },
        async legendUpdate(){
            if(this.formData.name == ''|| this.formData.address =='' || this.formData.phone == ''){
                this.i("All fields must be filled !")
                console.log('All fields must be filled !')
                return;
            }
            const res = await this.callApi('put',`/legends/${this.legendData.id}`,this.formData)
            if(res.status===200){
                this.s("Change have been made Successfully!")
                this.legendData.name = this.formData.name
                this.legendData.address = this.formData.address
                this.legendData.phone = this.formData.phone
                this.isEdit=false
            }
            else{
                this.swr();
            }
        },
        async uploadsPhotos(){
            if(this.uploadList.length<1){
                this.i("you didn't select any photos")
                return
            }

            const res = await this.callApi('post','/uploadLegendPhotos',{uploadList: this.uploadList})
            if(res.status===200){
                this.s("Images have been uploaded successfully!")
                this.addImageModal = false
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
        if(this.isLoggedIn) this.user_id = this.authInfo.id
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
