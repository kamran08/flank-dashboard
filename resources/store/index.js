export const strict = false
export const state = () => ({
  authInfo: false,
  showNavber: true,
  searchData: [],
  pagination: {},
  pageOptino: 'legend'
})

export const getters = {
  getIsLoggedIn (state) {
    return !!state.authInfo
  },
  getAuthInfo (state) {
    return state.authInfo
  },
  getShowNavber (state) {
    return state.showNavber
  },
  getSearchData (state) {
    return state.searchData
  },
  getPagination (state) {
    return state.pagination
  },
  getPageOptino (state) {
    return state.pageOptino
  }
}

export const mutations = {
  setAuthInfo (state, data) {
    state.authInfo = data
  },
  setShowNavber (state, data) {
    state.showNavber = data
  },
  setSearchData (state, data) {
    state.searchData = data
  },
  setPagination (state, data) {
    state.pagination = data
  },
  setPageOptino (state, data) {
    state.pageOptino = data
  }
}

export const actions = {
  async nuxtServerInit ({ commit }, { $axios }) {
    try {
      // get the initial data
      let { data } = await $axios.get('app/initdata')
      // update the state of the aiuth
      commit('setAuthInfo', data.user)
      // console.log(data)
    } catch (e) {
      console.log(e.response)
    }
  },
  setAuthInfo ({ commit }, data) {
    commit('setAuthInfo', data)
  },
  setShowNavber ({ commit }, data) {
    commit('setShowNavber', data)
  }
}
