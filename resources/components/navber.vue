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
                    <li><a href=""><img src="/image/download.png" alt=""></a></li>
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
                </ul>
                <ul>
                    <li v-if="!isLoggedIn" ><nuxt-link class="nav-link" to="/login" ><i class="fas fa-user-shield"></i>&nbsp;&nbsp;Sign In</nuxt-link>
                    <li v-if="isLoggedIn" @click="$router.push(`/profile/${authInfo.id}`)" ><a >Profile</a></li>
                    <li v-if="isLoggedIn" @click="logout" ><a >Log Out</a></li>
                    <li><a href="">Download</a></li>
                </ul>
            </div>
       </nav>
</div>
</template>

<script>
    export default {
        computed:{
           
        },
        methods:{
            async logout() {
                try {
                    let { data } = await this.$axios.get("/logout");
                    this.$store.commit("updateAuthUser", false);
                    window.location = '/login'
                } catch (error) {
                    console.log(error);
                }
            },
        }
    }
</script>

<style>

</style>
