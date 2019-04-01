<template>
    <div class="container">
        <div class="row">
            <div class="col-md-6 ecenter">
                 <h3>Login</h3>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6 ecenter">
                 <form v-on:submit.prevent="onSubmit">
                    <div class="form-group">
                        <input type="email" class="form-control" v-model="formData.email" placeholder="Enter email" required>
                        <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                    </div>
                    <div class="form-group">
                        <input type="password" class="form-control" v-model="formData.password" placeholder="Password" required >
                    </div>
                    <div class="form-check">
                        <div class="row">
                            <div class="col-md-6">
                                <input type="checkbox" class="form-check-input" v-model="formData.remember">
                                <label class="form-check-label" for="exampleCheck1">Remember Me</label>
                            </div>
                            <div class="col-md-6">
                                Forgot Password
                            </div>
                        </div>
                        
                    </div>
                    <button type="submit" class="btn btn-primary">Login</button>
                </form>
            </div>
        </div>
       
    </div>
</template>

<script>
export default {
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
            
            const res = await this.callApi('post','authentication/login',this.formData) 
            if(res.status===200){
                this.s("Login Successfully !")
                window.location='/'
            }
            else{
                this.swr();
            }
        }
    }
}
</script>

<style>

</style>
