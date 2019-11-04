'use strict'
const User = use('App/Models/User')
const Legend = use('App/Models/Legend')
const LegendImage = use('App/Models/LegendImage')
const BusniessHour = use('App/Models/BusniessHour')
const LegendBussniessInfo = use('App/Models/LegendBussniessInfo')
const LegendSchedule = use('App/Models/LegendSchedule')
const Helpers = use('Helpers')
const Database = use('Database')
class AdminController {
  // Legend Profile
  async indexUser ({ auth }) {
    const user_id = await auth.user.id
    return Legend.query().where('user_id', user_id).first()
  }
  async updateUser ({ request, auth }) {
    const data = request.all()
    const user_id = await auth.user.id

    return await Legend.query().where('user_id', user_id).update(data)
  }
  

  // Legend Hours
  async indexHours ({ auth }) {
    const user_id = await auth.user.id
    const legend = await Legend.query().where('user_id', user_id).first()
    return BusniessHour.query().where('legend_id', legend.id).fetch()
  }
  async updateHours ({ request, auth }) {
    let data = request.all()
    console.log(data)
    const user_id = await auth.user.id
    const legend = await Legend.query().where('user_id', user_id).first()
    for (let d of data.hourData) {
      d.legend_id = legend.id
    }
    await BusniessHour.query().where('legend_id', legend.id).delete()
    return await BusniessHour.createMany(data.hourData)
  }
  // Legend Images
  async indexLegendImages ({ auth }) {
    const user_id = await auth.user.id
    const legend = await Legend.query().where('user_id', user_id).first()
    return LegendImage.query().where('legend_id', legend.id).fetch()
  }
  async storeLegendImages ({ request, auth }) {
    const user_id = await auth.user.id
    const legend = await Legend.find(user_id)

    const profilePic = request.file('file', {
      types: ['png', 'jpg', 'jpeg'],
      size: '2mb'
    })

    const name = `${new Date().getTime()}` + '.' + profilePic.subtype
    // UPLOAD THE IMAGE TO UPLOAD FOLDER
    await profilePic.move(Helpers.publicPath('uploads'), {
      name: name
    })
    if (!profilePic.moved()) {
      return profilePic.error()
    }
    let upFile = `https://dashboard.goflank.com/uploads/${name}`
    let ob = {
      url: upFile,
      legend_id: legend.id
    }

    return await LegendImage.create(ob)
  }
  async deleteLegendImages ({ request, auth }) {
    let data = request.all()
    return await LegendImage.query().where('id', data.id).delete()
  }

    // Legend Bussniess
    async indexBussniess ({ auth }) {
      const user_id = await auth.user.id
      return LegendBussniessInfo.query().where('user_id', user_id).fetch()
    }
    async storeBussniess ({ request, auth }) {
      const data = request.all()
      console.log("yes yes yes")
      const user_id = await auth.user.id
      const user = await Legend.query().where('user_id', user_id).first()
      data.user_id = user_id
      data.legend_id = user.id
  
      return await LegendBussniessInfo.create(data)
    }
    async updateBussniess ({ request, auth }) {
      const data = request.all()
      const user_id = await auth.user.id
  
      return await LegendBussniessInfo.query().where('id', data.id).update(data)
    }
    async deleteBussniess ({ request, auth }) {
      const data = request.all()
      const user_id = await auth.user.id
  
      return await LegendBussniessInfo.query().where('id', data.id).delete(data)
    }

      // Legend Schedules
    async indexSchedules ({ auth }) {
      const user_id = await auth.user.id
      return LegendSchedule.query().where('user_id', user_id).orderBy('id','desc').fetch()
    }
    async deleteSchedules ({ request, auth }) {
      const data = request.all()
      const user_id = await auth.user.id

      return await LegendSchedule.query().where('id', data.id).delete();
    }
}

module.exports = AdminController
