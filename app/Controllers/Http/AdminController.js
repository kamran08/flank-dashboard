'use strict'
const User = use('App/Models/User')
const Legend = use('App/Models/Legend')
const BusniessHour = use('App/Models/BusniessHour')
class AdminController {

    // Legend Profile
    async indexUser({auth}){
        const user_id = await auth.user.id
        return Legend.query().where('user_id', user_id).first()
    }
    async updateUser({request,auth}){
        const data = request.all()
        const user_id = await auth.user.id
        
        return await Legend.query().where('user_id', user_id).update(data)
    }

    // Legend Hours
    async indexHours({auth}){
        const user_id = await auth.user.id
        const legend = await Legend.query().where('user_id', user_id).first()
        return BusniessHour.query().where('legend_id', legend.id).fetch()
    }
    async updateHours({request,auth}){
        let data = request.all()
        console.log(data)
        const user_id = await auth.user.id
        const legend = await Legend.query().where('user_id', user_id).first()
        for(let d of data.hourData){
            d.legend_id = legend.id
        }
        await BusniessHour.query().where('legend_id', legend.id).delete()
        return await BusniessHour.createMany(data.hourData)
        
    }
}

module.exports = AdminController
