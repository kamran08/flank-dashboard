<template>
    <nav class="navbar navbar-expand-lg navbar-info bg-info">
        <img src="~assets/img/logo.png" alt="Nuxt.js Logo" class="nav-logo" />
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
            <li class="nav-item active">
                 <nuxt-link class="nav-link" to="/" >Home <span class="sr-only">(current)</span></nuxt-link>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Writers</a>
            </li>
            <li class="nav-item">
                <nuxt-link class="nav-link" to="/about" >About</nuxt-link>
            </li>
            <li class="nav-item">
                <nuxt-link class="nav-link" to="/authentication/login" >Login</nuxt-link>
            </li>
            <li class="nav-item">
                <nuxt-link class="nav-link" to="/authentication/register" >Register</nuxt-link>
            </li>
            </ul>
        </div>
    </nav>
</template>

<script>
export default {

}
</script>

<style>

</style>
