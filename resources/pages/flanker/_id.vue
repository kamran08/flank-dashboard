<template>
    <body>
        
        <!-- Header-->
        
        <header>
            <!-- <div class="header-second">
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
                   <div class="pull-right">
                       <ul class="logsign">
                           <li><a href="">Log In</a></li>
                           <li><a href="">Sign Up</a></li>
                       </ul>
                   </div>
                </div>
            </div> -->
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
        
       <section class="rd second-section bg profile-second-section">
            <div class="container">
                <div class="section-content">
                    <div class="profile-thumb-section">
                        <div class="row">
                            <div class="col-md-9">
                                <div class="profile-thumb">
                                    <figure>
                                       <div class="Details_profie_img_div" v-if=" userData.id==user_id" >
                                            <Upload
                                            ref="upload"
                                            type="drag"
                                            :with-credentials="true"
                                            :on-success="handleSuccess"
                                            :format="['jpg','jpeg','png']"
                                            :max-size="2048"
                                            action="/app/user/updateProfileImage">
                                            <!-- action="/app/uploadServiceImages"> -->
                                            <div  >
                                            <img :src="userData.img" alt=""  style="width: 140px;height: 150px;">
                                                <p   class="Details_profie_img_edit">Upload Image</p>
                                            </div>
                                        </Upload>
                                            
                                        </div>
                                        <div class="Details_profie_img_div" v-else >
                                            <div  >
                                            <img :src="userData.img" alt=""  style="width: 140px;height: 150px;">
                                            </div>
                                        </div>
                                        
                                    </figure>
                                </div>
                                <div class="profile-name">
                                    <div>
                                         <div v-if="isEdit"  >
                                             <Row>
                                                  FirstName：
                                                <Input  prefix="ios-contact" v-model="editData.firstName" style="width: auto" placeholder="Enter something..." />
                                             </Row>
                                             <Row>
                                                   LastName：
                                                <Input  prefix="ios-contact" v-model="editData.lastName" style="width: auto" placeholder="Enter something..." />
                                             </Row>
                                             <Row>
                                                Address:    
                                                <Input   type="textarea" :rows="3" v-model="editData.address" style="width: auto" placeholder="Enter your address..." />
                                            </Row>
                                             
                                             
                                         </div>
                                         <h1 v-else >{{userData.firstName}} {{userData.lastName}}</h1>
                                        
                                    </div>
                                    <div  v-if="!isEdit" >
                                        <p >{{userData.address}}</p>
                                    </div>
                                   
                                    
                                    <ul>
                                        <!-- <li><span><i class="fas fa-male"></i></span>&nbsp;&nbsp;<span><strong>303</strong> Friends</span></li> -->
                                        <li><span class="high"><i class="fas fa-star"></i></span>&nbsp;&nbsp;<span><strong>{{userData.reviews.length}}</strong> Reviews</span></li>
                                        <!-- <li><span><i class="fas fa-camera"></i>&nbsp;&nbsp;<span><strong>41</strong> Photos</span></span></li> -->
                                    </ul>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="user-profile-action"> <i class=""></i>
                                   
                                    <ul>
                                        
                                        <li v-if="isEdit" @click=" updateProfile" ><a ><span><i class="far fa-save"></i></span>&nbsp;&nbsp;<span>Save</span></a></li>
                                        <li  v-else-if=" !isEdit && userData.id==user_id" @click="EditProfileOn" ><a ><span><i class="fas fa-wrench"></i></span>&nbsp;&nbsp;<span>Edit Profile</span></a></li>
                                        <li><a href=""><span><i class="fas fa-user-friends"></i></span>&nbsp;&nbsp;<span>Add Friend</span></a></li>
                                        <li><a href=""><span><i class="fas fa-lightbulb"></i></span>&nbsp;&nbsp;<span>Compliment</span></a></li>
                                        <li><a href=""><span><i class="fas fa-envelope"></i></span>&nbsp;&nbsp;<span>Send Message</span></a></li>
                                        <li><a href=""><span><i class="fas fa-user-friends"></i></span>&nbsp;&nbsp;<span>Follow Bryan B.</span></a></li>
                                        <li><a href=""><span><i class="fas fa-sync"></i></span>&nbsp;&nbsp;<span>Simillar Reviews</span></a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="third-section user-details-section">
            <div class="container">
                <div class="section-content">
                    <div class="row">
                        <div class="col-md-3">
                            <div class="profile-link">
                                <h2>{{userData.firstName}}'s Profile</h2>
                                <ul>
                                   <li class="active-line"><a href=""><span><i class="fas fa-male"></i></span>&nbsp;&nbsp;<span>Profile Overview</span></a></li>
                                    <li><a href=""><span><i class="fas fa-user-friends"></i></span>&nbsp;&nbsp;<span>Friends</span></a></li>
                                    <li><a href=""><span class="high"><i class="fas fa-star"></i></span>&nbsp;&nbsp;<span>Reviews</span></a></li>
                                    <li><a href=""><span><i class="fas fa-camera"></i></span>&nbsp;&nbsp;<span>Business Photos</span></a></li>
                                    <li><a href=""><span><i class="far fa-lightbulb"></i></span>&nbsp;&nbsp;<span>Compliments</span></a></li>
                                    <li><a href=""><span><i class="fas fa-lightbulb"></i></span>&nbsp;&nbsp;<span>Tips</span></a></li>
                                    <li><a href=""><span><i class="far fa-bookmark"></i></span>&nbsp;&nbsp;<span>Bookmarks</span></a></li>
                                    <li><a href=""><span><i class="fas fa-bookmark"></i></span>&nbsp;&nbsp;<span>Collections</span></a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="profile-review reviewItem">
                                <h2>Reviews</h2>
                                <div class="review-sort">
                                    <div class="sortTag noleft">Sort by :&nbsp;<strong>Date&nbsp;<span><i class="fas fa-sort-down"></i></span>
                                        <ul>
                                            <li><a href="">Alphabatical</a></li>
                                            <li><a href="">Rating</a></li>
                                            <li><a href="">Date</a></li>
                                            <li><a href="">Useful</a></li>
                                            <li><a href="">Funnny</a></li>
                                        </ul>
                                        </strong>
                                    </div>
                                    <hr>
                                </div>
                                <div class="profile-fill-review" v-for="(item,index) in userData.reviews" :key="index" >
                                    <div class="profile-item">
                                            <div class="media">
                                                <div class="media-left">
                                                    <img class="media-object" :src="item.reviewfor.img" alt="">
                                                </div>
                                                <div class="media-body">
                                                    <p><strong><a href="">{{item.reviewfor.name}}</a></strong></p>
                                                    <!-- <small><a href="">Mexican</a></small> -->
                                                    <p>
                                                        <small>{{item.reviewfor.address}}</small>
                                                    </p>
                                                </div>
                                            </div>
                                            <div class="read-review">
                                                <div class="star-review">
                                                    <p><span class="high rating-bg"><i class="fas fa-star"></i></span><span class="high rating-bg"><i class="fas fa-star"></i></span><span class="high rating-bg"><i class="fas fa-star"></i></span><span class="high rating-bg"><i class="fas fa-star"></i></span><span class="high"><i class="fas fa-star"></i></span>&nbsp;<small>3/3/2019</small></p>
                                                </div>
                                                <p>{{item.content}} </p>
        
                                                <div class="profile-gallary">
                                                    <ul>
                                                        <li v-if="item.images[0]" ><a :href="item.images[0].url"><img :src="item.images[0].url"></a></li>
                                                        <li v-if="item.images[1]"><a :href="item.images[1].url"><img :src="item.images[1].url"></a></li>
                                                        <li v-if="item.images[2]"><a :href="item.images[2].url"><img :src="item.images[2].url"></a></li>
                                                    </ul>
                                                </div>
                                                <p id="resultReview"><strong>Was the review...?</strong></p>
                                                <ul>
                                                    <li><i class="fas fa-grin-beam"></i>&nbsp;Useful</li>
                                                    <li><i class="fas fa-grin-beam"></i>&nbsp;Funny</li>
                                                    <li><i class="fas fa-grin-beam"></i>&nbsp;Useful</li>
                                                </ul>
                                            </div>
                                    </div>
                                </div>
                                <div class="profile-fill-more">
                                    <p><a href="">More reviews by Kat L.</a></p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="profile-about">
                                <h3>About {{userData.firstName}} {{userData.lastName}}</h3>
                                <p>Rating Distribution</p>

                                <div class="about-rating">
                                    <table>
                                        <tr>
                                            <td class="histogram-label histogram-label-1">5 Stars</td>
                                            <td class="histogram-bar histogram-bar-1" :style="{ padding:'0px '+ratingD[4].padding+'px'}" ></td>
                                            <td class="histogram-number">{{ratingD[4].total}}</td>
                                        </tr>
                                        <tr>
                                            <td class="histogram-label histogram-label-2">4 Stars</td>
                                            <td class="histogram-bar histogram-bar-2" :style="{ padding:'0px '+ratingD[3].padding +'px'}" ></td>
                                            <td class="histogram-number">{{ratingD[3].total}}</td>
                                        </tr>
                                        <tr>
                                            <td class="histogram-label histogram-label-3">3 Stars</td>
                                            <td class="histogram-bar histogram-bar-3" :style="{ padding:'0px '+ratingD[2].padding+'px'}" ></td>
                                            <td class="histogram-number">{{ratingD[2].total}}</td>
                                        </tr>
                                        <tr>
                                            <td class="histogram-label histogram-label-4">2 Stars</td>
                                            <td class="histogram-bar histogram-bar-4" :style="{ padding:'0px '+ratingD[1].padding+'px'}" ></td>
                                            <td class="histogram-number">{{ratingD[1].total}}</td>
                                        </tr>
                                        <tr>
                                            <td class="histogram-label histogram-label-5">1 Stars</td>
                                            <td class="histogram-bar histogram-bar-5" :style="{ padding:'0px '+ratingD[0].padding+'px'}" ></td>
                                            <td class="histogram-number">{{ratingD[0].total}}</td>
                                        </tr>
                                    </table>
                                    <p><a href="">View more graphs</a></p>
                                </div>
                                <div class="about-side-bar">
                                    <p>Review Votes</p>
                                    <ul v-if="imosCount" >
                                        <li  ><span><i class="fas fa-lightbulb"></i></span> <span>Useful <strong>{{imosCount.useful}}</strong></span></li>
                                        <li  ><span><i class="far fa-laugh-wink"></i></span> <span>Funny <strong>{{imosCount.funny}}</strong></span></li>
                                        <li  ><span><i class="fas fa-grin-beam"></i></span> <span>Cool <strong>{{imosCount.cool}}</strong></span></li>
                                    </ul>
                                </div>

                                <!-- <div class="about-side-bar">
                                    <p>Stats</p>
                                    <ul>
                                        <li><span><i class="fas fa-grin-beam"></i></span> <span>Bookmarks <strong>17</strong></span></li>
                                        <li><span><i class="fas fa-grin-beam"></i></span> <span>First <strong>7</strong></span></li>
                                        <li><span><i class="fas fa-grin-beam"></i></span> <span>Followers <strong>12</strong></span></li>
                                    </ul>
                                </div> -->
                                <!-- <div class="about-side-bar">
                                    <p>2 Compliments</p>
                                    <ul class="icon-bg">
                                        <li><span><i class="fas fa-grin-beam"></i></span> <small>1</small></li>
                                        <li><span><i class="fas fa-grin-beam"></i></span> <small>1</small></li>
                                    </ul>
                                </div> -->

                                <div class="about-side-bar">
                                    <p>Locations</p>
                                    <p class="in-ab">{{userData.address}}</p>
                                </div>
                                <div class="about-side-bar">
                                    <p>Yelping Since</p>
                                    <p class="in-ab">September 2016</p>
                                </div>
                                <div class="about-side-bar">
                                    <p>Find Me In</p>
                                    <p class="in-ab">a dog park, with no dog, petting all the dogs</p>
                                </div>
                                <div class="about-side-bar">
                                    <p>My Hometown</p>
                                    <p class="in-ab">Jackson, MS</p>
                                </div>
                                <div class="about-side-bar">
                                    <p>Why You Should Read My Reviews</p>
                                    <p class="in-ab">I love food and get extremely excited about the ones that are good</p>
                                </div>
                                <div class="about-side-bar">
                                    <p>The Last Great Book I Read</p>
                                    <p class="in-ab">The Girl with All the Gifts</p>
                                </div>
                                <div class="about-side-bar">
                                    <p>My First Concert</p>
                                    <p class="in-ab">Backstreet Boys</p>
                                </div>
                                <div class="about-side-bar">
                                    <p>My Last Meal On Earth</p>
                                    <p class="in-ab">Molinari's Hot Renzo Sandwich</p>
                                </div>
                                <div class="about-side-bar">
                                    <p>Most Recent Discovery</p>
                                    <p class="in-ab">Bananas are curved because they grow towards the sun</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </body>
</template>

<script>
export default {
    data(){
        return{
            isEdit:false,
            user_id:0,
            editData:{
                firstName:'',
                lastName:'',
                address:'',

            }
        }
    },
    async asyncData({app, store,redirect, params}){
        try {
            let {data} = await app.$axios.get(`/users/${params.id}`)
          
            return{
                userData : data.user,
                ratingD : data.reviewRatings,
                imosCount : data.user.imosCount,
            }
		}catch (error) {
            console.log(error)
          //  return redirect('/')
		}
    },
    methods:{
        
        EditProfileOn(){
            console.log(this.getTheMaxValue)
            this.editData.firstName = this.userData.firstName
            this.editData.lastName = this.userData.lastName
            this.editData.address = this.userData.address
            this.isEdit = true
        },
        async updateProfile(){
            if(this.editData.firstName == '' || this.editData.lastName == '' || this.editData.address ==''){
                this.i('All fields are required!')
                return
            }
            
            const res = await this.callApi('put',`/users/${this.userData.id}`,this.editData)
            if(res.status===200){
                this.userData.firstName = this.editData.firstName
                this.userData.lastName = this.editData.lastName
                this.userData.address = this.editData.address
                this.isEdit = false
                this.s('Profile have been upadated!')
            }
            else if (res.status===401){
                this.e(res.data.message)
            }
            else{
                this.swr();
            }
        },
        handleSuccess (res, file) {
            this.userData.img = res.file 
        },

    },
    filters:{
        getIcon(value){
            if(value == 'Useful' ) return "fas fa-lightbulb";
            else if(value == 'Funny' ) return "far fa-laugh-wink"; 
            else if(value == 'Cool' ) return "fas fa-grin-beam";
        }
    },
    
    async created(){
        if(this.isLoggedIn) this.user_id = this.authInfo.id
        
    },

}
</script>

<style scoped>

.Details_profie_img_edit {
    position: absolute;
    cursor: pointer;
    bottom: -100%;
    background: #0000009e;
    color: #fff;
    font-size: 11px;
    left: 0;
    transition: .3s all ease;
    text-align: center;
    width: 100%;
    height: 40px;
    padding-top: 10px;
}
.Details_profie_img_div:hover .Details_profie_img_edit{
    bottom:0;
}
</style>