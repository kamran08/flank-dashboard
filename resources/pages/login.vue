
<template >
    <div>
     
        <!-- ========== Header End ============= -->
        <div class="sign-up-content padd_tb40">
            <div class="container">
                <div class="row">
                    <div class="col-md-4 col-md-offset-2">
                        <div class="signcont-left">
                            <h3 class="create-account">Sign-In</h3>
                            <form v-on:submit.prevent>
                                <div class="group-item">
                                    <label >Email</label>
                                    <input type="email" v-model="formData.email">
                                </div>
                                <div class="group-item">
                                    <label >Password</label>
                                    <nuxt-link  class="group-item-right red-alert group-item-forgot-pass"  to='/authentication/resetpassword' >Fogot password?</nuxt-link>
                                    <input type="password" v-model="formData.password">
                                </div>
                                <div class="group-item">
                                    <input type="submit" @click="onSubmit" value="Sign-In">
                                </div>
                            </form>
                            <p class="mar_b20">By continuing, you agree to Conditions Flank's of Use and Privacy Notice</p>
                            <h5 class="mar_b30"><input type="checkbox" name="vehicle1" value="Bike"> Keep me sign in. <a href="#" class="sign-in">Details</a></h5>
                            <p class="new-flank">
                                <span class="new-flank-cont">
                                    New to Flank?
                                </span>               
                            </p>
                             <nuxt-link   to='/signup' > <button class="create-btn">Create your Flank account</button></nuxt-link>
                           
                        </div>
                    </div>
                    <div class="col-md-5">
                        <div class="signcont-right">
                            <div class="signcont-img">
                                <img src="/images/flank-1.png" alt="">
                                <img src="/images/sign-up1.jpg" alt="">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
       
    </div>
</template> 
<script>
export default {
    middleware: 'guest',
    data(){
        return{
            formData:{
                email:'',
                password:'',
                remember: false,
            },
            

        }
    },
    methods:{
        async onSubmit(){
            if(this.formData.email == '') return this.i("email is empty")
            if(this.formData.password == '') return this.i("Password is empty")
            const res = await this.callApi('post','authentication/login',this.formData) 
            if(res.status===200){
                this.s("Login Successfully !")
                this.$store.dispatch('setAuthInfo',res.data)
                if(this.authInfo.packType==2){
                     window.location ='/profile/'+this.authInfo.id
                }
                else{
                     window.location= '/flanker/'+this.authInfo.id
                }
            }
            else if(res.status==401){
                this.e(res.data.message)
            }
            else{
                this.swr();
            }
        },
        goToFacebook(){
           // href="/login/facebook"
           window.location = '/login/facebook'
           
        }
    },
    created(){
        if(this.isLoggedIn == true){
                this.i('You Already Login!')
                this.$router.push('/')
                return
            }
    }
}
</script>


