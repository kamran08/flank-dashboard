<template>
    <div id="app">
        <div v-if="isLoggedIn">

            <!--========== ADMIN SIDE MENU one ========-->
            <div class="_1side_menu" v-if="isLoggedIn">
                <div class="_1side_menu_logo">
                    <!-- <h3 style="text-align:center;">Logo Image</h3> -->
                    <img class="title_image" src="/images/logo-new.png" />
                </div>

                <!--~~~~~~~~ MENU CONTENT ~~~~~~~~-->
                <div class="_1side_menu_content">
                    <div class="_1side_menu_img_name">
                        <p class="_1side_menu_name">{{authInfo.firstName}} {{authInfo.lastName}}</p> 
                    </div>

                    <!--~~~ MENU LIST ~~~~~~-->
                    <div class="_1side_menu_list">
                        <Menu :active-name="activeName" :accordion="true">
                            
                            <MenuItem name="/" :to="'/'">
                                <Icon type="ios-analytics" />Dashboard & Report
                            </MenuItem>
                            <MenuItem name="/profile" :to="'/profile'">
                                <Icon type="ios-analytics" />Profile Edit
                            </MenuItem>
                            <MenuItem name="/schedule" :to="'/schedule'">
                                <Icon type="ios-analytics" />Hours Edit
                            </MenuItem>
                            <MenuItem name="/images" :to="'/images'">
                                <Icon type="ios-analytics" />Images
                            </MenuItem>
                            <!-- <Submenu name="1">
                                    <template slot="title">
                                        <Icon type="ios-menu" />
                                        All Menus
                                    </template>
                                  <MenuItem name="/admin/menu" :to="'/admin/menu'"><Icon type="ios-copy" />Menus</MenuItem>
                                  <MenuItem name="/admin/categoryList" :to="'/admin/categoryList'"><Icon type="ios-copy" /> Category</MenuItem>
                                  <MenuItem name="/admin/subcategory" :to="'/admin/subcategory'"><Icon type="ios-copy" />Subcategory</MenuItem>
                                  <MenuItem name="/admin/brands" :to="'/admin/brands'"><Icon type="ios-copy" />Brands</MenuItem>
                                </Submenu>
                                <Submenu name="2">
                                    <template slot="title">
                                        <Icon type="md-contacts" />
                                        Users
                                    </template>
                                  <MenuItem name="/admin/userList" :to="'/admin/userList'"><Icon type="ios-contact" />Customer</MenuItem>
                                  <MenuItem name="/admin/supplier" :to="'/admin/supplier'"><Icon type="ios-contact" /> Supplier</MenuItem>
                                  <MenuItem name="/admin/wholeSale_list" :to="'/admin/wholeSale_list'"><Icon type="ios-contact" /> WholeSale User </MenuItem>
                                </Submenu>
                                <Submenu name="3">
                                    <template slot="title">
                                        <Icon type="ios-leaf" />
                                        Products
                                    </template>
                                    <MenuItem name="/admin/product_info" :to="'/admin/product_info'"><Icon type="ios-leaf" />Product Info Table</MenuItem>
                                    <MenuItem name="/admin/productList" :to="'/admin/productList'"><Icon type="ios-leaf" />Product List</MenuItem>
                                    <MenuItem name="/admin/stock" :to="'/admin/stock'"><Icon type="ios-leaf" />Inventory</MenuItem>
                                    <MenuItem name="/admin/inventory_receive" :to="'/admin/inventory_receive'"><Icon type="ios-leaf" />Inventory Receive & Move Loc </MenuItem>
                                    <MenuItem name="/admin/purchas" :to="'/admin/purchas'"><Icon type="ios-leaf" />Purchase</MenuItem>
                                    <MenuItem name="/admin/productEmail" :to="'/admin/productEmail'"><Icon type="ios-leaf" />Product Email</MenuItem>
                                    <MenuItem name="/admin/price_level" :to="'/admin/price_level'"><Icon type="ios-leaf" />Price Level</MenuItem>
                                </Submenu>
                                <Submenu name="4">
                                    <template slot="title">
                                        <Icon type="md-jet" />
                                        Orders
                                    </template>
                                    <MenuItem name="/admin/pending_order" :to="'/admin/pending_order'"><Icon type="md-jet" />processing Orders</MenuItem>
                                    <MenuItem name="/admin/shipping_order" :to="'/admin/shipping_order'"><Icon type="md-jet" />Shipping Orders</MenuItem>
                                    <MenuItem name="/admin/complete_order" :to="'/admin/complete_order'"><Icon type="md-jet" />Complete Orders</MenuItem>
                                    <MenuItem name="/admin/return_order" :to="'/admin/return_order'"><Icon type="md-jet" /> Other Orders</MenuItem>
                                    <MenuItem name="/admin/wholesale" :to="'/admin/wholesale'"><Icon type="md-jet" />wholesale orders</MenuItem>
                                    <MenuItem name="/admin/shippingCharge" :to="'/admin/shippingCharge'"><Icon type="md-jet" />Orders Charge</MenuItem>
                                    <MenuItem name="/admin/ra" :to="'/admin/ra'"><Icon type="md-jet" />RA</MenuItem>
                                </Submenu>
                                <Submenu name="5">
                                    <template slot="title">
                                        <Icon type="ios-albums-outline" />
                                        Landing Page Option
                                    </template>
                                    <MenuItem name="/admin/front_slide" :to="'/admin/front_slide'"><Icon type="ios-albums-outline" />Offers</MenuItem>
                                    <MenuItem name="/admin/landing_top_offer" :to="'/admin/landing_top_offer'"><Icon type="ios-albums-outline" />Top Menu</MenuItem>
                                    <MenuItem name="/admin/index_menu" :to="'/admin/index_menu'"><Icon type="ios-albums-outline" />Middle Menu</MenuItem>
                                </Submenu>
                                <Submenu name="6">
                                    <template slot="title">
                                        <Icon type="ios-albums-outline" />
                                        Admin Settings
                                    </template>
                                    <MenuItem name="/admin/settings" :to="'/admin/settings'"><Icon type="ios-albums-outline" />Settings</MenuItem>
                                    <MenuItem name="/admin/calllog" :to="'/admin/calllog'"><Icon type="ios-albums-outline" />Call Log</MenuItem>
                                    <MenuItem name="/admin/edlog" :to="'/admin/edlog'"><Icon type="ios-albums-outline" />Edit & Delete Log</MenuItem>
                                    <MenuItem name="/admin/print_levels" :to="'/admin/print_levels'"><Icon type="ios-albums-outline" />Print Levels</MenuItem>
                                </Submenu> -->
                        </Menu>
                    </div>
                </div>
            </div>
            <!--========== ADMIN SIDE MENU ========-->

            <div class="header">
                <div class="_2menu  _box_shadow">
                    <div class="_2menu_logo">
                        <ul class="open_button">
                            <li>
                                <Icon type="ios-list" />
                            </li>
                            <!--<li><Icon type="ios-albums" /></li>-->
                        </ul>
                    </div>

                    <ul class="_2menu_main_ul_list_ul">
                        <li >
                            <p>Home</p>
                        </li>
                        <li >
                            <p> <a :href="`https://goflank.com/local_instructor/${authInfo.legend.id}`">Go To Profile</a> </p>
                        </li>
                        <li >
                            <p @click="logout" >Logout</p>
                        </li>

                    </ul>

                </div>
            </div>
            <!--========= HEADER ==========-->
            <transition name="component-fade" mode="out-in">
                <nuxt />
            </transition>
        </div>
        <div v-else>
          <transition name="component-fade" mode="out-in">
                <nuxt />
            </transition>
        </div>
    </div>
</template>
<script>

export default {
  data(){
    return {
      flag:1,
      isAdmin: true,
      tab:14,
      isMainSite: false,
      activeName:'/'
    }
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
  },
  watch:{
      $route (to, from){
      }
  },
  created(){
    if(!this.isLoggedIn) return this.$router.push('/login')
    this.activeName = this.$route.path
  }
}
</script>
<style >
.title_image {
    width: 244px;
    margin: -18px auto 0;
    height: 56px;
}
</style>
