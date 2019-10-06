import Vue from 'vue'
import {mapGetters} from 'vuex'
import _ from 'lodash'
Vue.mixin({
  methods: {
    async callApi (method, url, dataObj) {
      try {
        let data = await this.$axios({
          method: method,
          url: url,
          data: dataObj
        })
        return data
      } catch (e) {
        return e.response
      }
    }
  },
  computed: {
    ...mapGetters({
      authInfo: 'getAuthInfo',
      isLoggedIn: 'getIsLoggedIn',
      searchData: 'getSearchData',
      pagination: 'getPagination',
      pageOption: 'getPageOptino',
      str: 'getStr',
      place: 'getPlace',
      similar: 'getSimilar'
    })
  }
})
