
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
            const res = await this.callApi('post','/login',this.formData) 
            if(res.status===200){
                this.s("Login Successfully !")
                this.$store.dispatch('setAuthInfo',res.data)
                this.$router.push('/');
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
        if(this.isLoggedIn == true){ return this.$router.push('/')
        
        
        
        
        }
    }
}
</script>
<style scoped>
.body{
    background: #fff
}
.padd_tb40{
    padding: 40px 0px;
}
.signcont-left {
    padding: 20px;
    border: 1px solid #ddd;
    border-radius: 4px;
    color: #000;
}
.create-account {
    margin: 0px 0px 10px 0px;
}
.group-item {
    margin-bottom: 18px;
    position: relative;
}
.group-item input {
    width: 100%;
    outline: none;
    border: 1px solid #ddd;
    padding: 4px 6px;
    border-radius: 4px;
}
.group-item-right.group-item-forgot-pass {
    position: absolute;
    top: 0;
    right: 0;
}
.mar_b20 {
    margin-bottom: 20px;
}
.mar_b30 {
    margin-bottom: 30px;
}
.input[type="checkbox"] {
    cursor: pointer;
}
.sign-in {
    color: #E51937;
}
.new-flank {
    position: relative;
    text-align: center;
}
.new-flank .new-flank-cont {
    background-color: #fff;
    padding: 0 10px;
    color: #A7A7A7;
}
.new-flank:after {
    position: absolute;
    content: "";
    width: 100%;
    height: 1px;
    background-color: #A7A7A7;
    top: 50%;
    left: 0;
    z-index: -1;
}
.create-btn {
    padding: 4px 6px;
    width: 100%;
    background-color: #EBECF0;
    border: 1px solid #B9B9B9;
    border-radius: 4px;
    transition: .5s;
}
.signcont-right {
    text-align: center;
}
.signcont-img {
    padding: 100px 40px;
}
.signcont-right img {
    max-width: 100%;
}
p {
    line-height: 22px;
}
</style>


