<template>
    <div class="container">
        <div class="row">
            <div class="col-md-6 ecenter">
                 <h3>Registration</h3>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6 ecenter">
                 <form v-on:submit.prevent="onSubmit">
                    <div class="form-group">
                        <input type="text" class="form-control" v-model="formData.name" placeholder="Enter Full Name" required>
                        <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                    </div>
                    <div class="form-group">
                        <input type="email" class="form-control" v-model="formData.email" placeholder="Enter email" required>
                        <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                    </div>
                    <div class="form-group">
                        <input type="password" class="form-control" v-model="formData.password" placeholder="Password" required>
                    </div>
                    <div class="form-group">
                        <input type="password" class="form-control" v-model="formData.password_confirmation " placeholder="Confirm Password" required>
                    </div>
                    <div class="form-group">
                        <input type="checkbox" class="form-check-input" v-model="termCondition">
                        <label class="form-check-label" for="exampleCheck1">Agree with  our terms & condition!</label>
                    </div>
                    
                    <button type="submit" class="btn btn-primary" >Registration</button>
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
                name:'',
                email:'',
                password:'',
                password_confirmation :'',

            },
            termCondition: false,
        }
    },
    methods:{
        async onSubmit(){
            // if(this.formData.email == '' || this.formData.password == ''  || this.formData.name == ''){
            //     this.i("All fields are required !")
            //     return
            // }
            if(this.formData.password_confirmation  !==  this.formData.password){
                this.i("Password Doesn't match !")
                return
            }

            if(!this.termCondition){
                this.i("Please agree with our condition !")
                return
            }
            const res = await this.callApi('post','/users',this.formData)
            if(res.status==200){
                this.s('Registration Successfull !')
                this.i('Please Login !')
                 this.$router.push('/authentication/login')
                
            }
            else if(res.status === 400){
                for(let d of res.data){
            
                    this.e(d.message)
                }
            }
            else{

                console.log(res)
                this.e('There is an Error!')
            }
        }
    },
    created(){
       
    }
}
</script>

<style>

</style>
