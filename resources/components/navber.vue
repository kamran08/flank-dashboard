<template>
<div>
    <div class="top-bar">
            <div class="container">
                <div class="top-bar-inner">
                    <div class="pull-left">
                        <div class="bar-logo">
                            <img src="/image/accountants.png" alt="">
                            <span>Get ahead of tax season</span>
                        </div>
                    </div>
                    <div class="pull-right">
                        <div class="bar-nav">
                            <ul>
                                <li><a href="">Accountants</a></li>
                                <li><a href="">CPA Firms</a></li>
                                <li><a href="">Small Business Accountants</a></li>
                                <li><a href="">Tax Services</a></li>
                            </ul>
                            <div id="bar-hide">
                                <span><i class="fas fa-times"></i></span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <nav class="navbar border-less-nav game-nav">
            <div class="navbar-logo">
                <ul>
                    <li><a href=""><img src="/image/downloa.png" alt=""></a></li>
                    <li><a @click="$router.push('/')" ><img src="/image/download.png" alt=""></a></li>
                </ul>
            </div>
            <div class="navbar-item">
                <ul>
                    <li><a href="">Get Fortnite</a></li>
                    <li><a href="">Battle Pass</a></li>
                    <li><a href="">Creative</a></li>
                    <li><a href="">Competitive</a></li>
                    <li><a href="">Watch</a></li>
                    <li><a href="">News</a></li>
                    <li><a href="">Faq</a></li>
                    <li><a href="">Help</a></li>
                    <li><nuxt-link to="/about" >About</nuxt-link></li>
                    <li @click="reviewModal=true" ><a>Give Review</a></li>
                </ul>
                <ul>
                    <li v-if="!isLoggedIn" ><nuxt-link class="nav-link" to="/login" ><i class="fas fa-user-shield"></i>&nbsp;&nbsp;Sign In</nuxt-link>
                    <li v-if="isLoggedIn && packType==1 " @click="$router.push(`/flanker/${authInfo.id}`)" ><a >Profile</a></li>
                    <li v-if="isLoggedIn && packType !=1 " @click="$router.push(`/profile/${authInfo.id}`)" ><a >Profile</a></li>
                    <li v-if="isLoggedIn" @click="logout" ><a >Log Out</a></li>
                    <li><a href="">Download</a></li>
                </ul>
            </div>
            <Modal
                v-model="reviewModal"
                title="Riview Modal"
                width='500'
            >
            <div class="row">
                 <div class="col-md-12">
                    <div class="form-group">
                        <p class=" msg_box_header">Write Review For?</p>
                        <div class="row">
                            <div class="col-md-3"  @click="rData.for=1"  ><Button :type="(rData.for == 1)? 'success': 'primary'" >School</Button></div>
                            <div class="col-md-3"  @click="rData.for=2"  ><Button :type="(rData.for == 2)? 'success': 'primary'" >Local Legend</Button></div>
                            <div class="col-md-3"  @click="rData.for=3"  ><Button :type="(rData.for == 3)? 'success': 'primary'" >Product Hero</Button></div>
                        </div>
                        <template v-if="rData.for == 2 || rData.for ==3" >
                            <Input v-model="rData.key" placeholder="Enter Coach Name ..." style="width: 300px" @on-keyup="SearchByKeyCoach" />
                            <div v-if="coachList.length>0" >
                                <p  class="pointer_like" v-for="(item,index) in coachList" :key="index" @click="goToLegendWall(item)" >{{item.name}}</p>
                               
                            </div>
                        </template>
                        <template v-else-if="rData.for==1" >
                            <Input v-model="rData.school" placeholder="Enter School Name ..." style="width: 300px" @on-keyup="SearchByKeySchool" />
                            <div v-if="schoolList.length>0" >
                                <p  class="pointer_like" v-for="(item,index) in schoolList" :key="index" @click="manageSchoolData(item)" >{{item.name}} | {{item.sport}}  </p>
                            </div>
                            
                            <template v-if="sData.school_id !=0" >
                                <hr>
                                <Input v-model="sData.school" placeholder="Enter School Coach Name ..." style="width: 300px" @on-keyup="SearchByKeySchoolCoach" />
                                <div v-if="schoolCoachList.length>0" >
                                    <p  class="pointer_like" v-for="(item,index) in schoolCoachList" :key="index" @click="goToCoachWall(item)" >{{item.name}}</p>
                                </div>
                                <Button @click="CreateNewCoach"  >Create a Coach</Button>
                            </template>
                        </template>
                    </div>
                </div>
                    
            </div>
            
            <div slot="footer">
                <Button @click="reviewModal = false">Close</Button> 
                <Button type="success">Send</Button>
            </div>
        </Modal>
       </nav>
</div>
</template>

<script>
    export default {
        data(){
            return{
                packType:0,
                reviewModal:false,
                rData:{
                    for:0,
                    key:'',
                    school:'',
                },
                coachList:[],
                schoolList:[],
                schoolCoachList:[],

                sData:{
                    school_id:0,
                }
                
            }
        },
        computed:{
           
        },
        methods:{
            async CreateNewCoach(){
                if(this.sData.school == ''){
                    this.i('Please Write a Coach Name')
                    return
                }
                 if(this.isLoggedIn == false){
                    this.i('Please login first !')
                    this.$router.push('/login');
                    return
                }
                let tempCoach = {
                    school_id: this.sData.school_id,
                    name:this.sData.school
                }
                const res = await this.callApi('post','/app/storeSchoolCoache',tempCoach)
                if(res.status == 200){
                    this.s('Coach created successfully!')
                }
                else{
                    this.swr()
                }
            },
            manageSchoolData(item){
                this.rData.school = item.name+" | "+item.sport
                this.sData.school_id = item.id
            },
            async SearchByKeySchoolCoach(){
               const res = await this.callApi('get',`/app/SearchByKeySchoolCoach?key=${this.rData.key}&school_id=${this.sData.school_id}`) 
               if(res.status=== 200){
                   this.schoolCoachList = res.data
               }
               else{
                   this.swr()
               }
            },
            async SearchByKeyCoach(){
               const res = await this.callApi('get',`/app/SearchByKeyCoach?key=${this.rData.key}`)
               if(res.status=== 200){
                   this.coachList = res.data
               }
               else{
                   this.swr()
               }
            },
            async SearchByKeySchool(){
               const res = await this.callApi('get',`/app/SearchByKeySchool?key=${this.rData.school}`)
               if(res.status=== 200){
                   this.schoolList = res.data
               }
               else{
                   this.swr()
               }
            },
            async goToLegendWall(item){
                 this.reviewModal = false
                this.$router.push(`/addreview/${item.id}`)
               
            },
            async goToCoachWall(item){
                 this.reviewModal = false
                this.$router.push(`/scoach_review/${item.id}`)
               
            },
            async logout() {
                try {
                    let { data } = await this.$axios.get("/logout");
                    this.$store.commit("updateAuthUser", false);
                    window.location = '/login'
                } catch (error) {
                    console.log(error);
                }
            },
        },
        created(){
             if(this.isLoggedIn) this.packType = this.authInfo.packType
        }
    }
</script>

<style scoped>
.pointer_like{
    cursor: pointer;
}
</style>

