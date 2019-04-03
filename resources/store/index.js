export const strict = false
export const state = () =>({
  authInfo: false
})

export const getters = {
    getIsLoggedIn(state){
        return state.authInfo ? true : false
    },
    getAuthInfo(state){
        return state.authInfo
    }
}

export const mutations = {
    setAuthInfo(state,data){
        state.authInfo = data
    }
}

export const actions = {
    async nuxtServerInit({ commit },{$axios}) {
        
        try{
           
           // get the initial data 
            let {data} = await $axios.get('app/initdata')
            // update the state of the aiuth
            commit('setAuthInfo',data.user)
            // console.log(data)
            
            }catch (e){
              console.log(e.response)
            }
    },
    setAuthInfo ({commit},data){
        commit('setAuthInfo',data)
    }
}

