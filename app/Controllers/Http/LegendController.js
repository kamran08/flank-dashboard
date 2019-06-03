/* eslint-disable eqeqeq */
/* eslint-disable camelcase */
/* eslint-disable quotes */
'use strict'

/** @typedef {import('@adonisjs/framework/src/Request')} Request */
/** @typedef {import('@adonisjs/framework/src/Response')} Response */
/** @typedef {import('@adonisjs/framework/src/View')} View */
const Legend = use('App/Models/Legend')
const Database = use('Database')
const User = use('App/Models/User')
const LegendImage = use('App/Models/LegendImage')
const Attribute = use('App/Models/Attribute')
const BusniessHour = use('App/Models/BusniessHour')

/**
 * Resourceful controller for interacting with legends
 */
class LegendController {
  /**
   * Show a list of all legends.
   * GET legends
   *
   * @param {object} ctx
   * @param {Request} ctx.request
   * @param {Response} ctx.response
   * @param {View} ctx.view
   */
  async index ({ request, response, view }) {
    const data = await Legend.all()
    return data
  }

  /**
   * Render a form to be used for creating a new legend.
   * GET legends/create
   *
   * @param {object} ctx
   * @param {Request} ctx.request
   * @param {Response} ctx.response
   * @param {View} ctx.view
   */
  async create ({ request, response, view }) {
  }

  /**
   * Create/save a new legend.
   * POST legends
   *
   * @param {object} ctx
   * @param {Request} ctx.request
   * @param {Response} ctx.response
   */
  async store ({ request, response }) {
  }

  /**
   * Display a single legend.
   * GET legends/:id
   *
   * @param {object} ctx
   * @param {Request} ctx.request
   * @param {Response} ctx.response
   * @param {View} ctx.view
   */
  async show ({ params, request, response, view }) {
    
    const legendData = await Legend.query()
                                  .where('id', params.id)
                                  .withCount('totalReview')
                                  .with('firstImage')
                                  .first()
    const averageRating = await Database.raw('SELECT cast(AVG(rating) as decimal(10,2)) AS averageRating FROM `reviews` WHERE `reviewFor` = ?', [params.id])
    const healthPulse = await Database.raw('select SUM(good) as GoodCount , SUM(bad) as BadCount FROM `pulses` WHERE `legend_id` = ?', [params.id])
    const AttributeInfo = await Attribute.all()

    if (legendData) {
      const userData = await User.query()
                                .where('id', legendData.user_id)
                                .first()
      return response.status(200).json({
        legend: legendData,
        user: userData,
        averageRating: averageRating[0][0].averageRating,
        healthPulse: healthPulse[0][0],
        AttributeInfo: AttributeInfo

        // atrrtributepoint: atrrtributepointData
      })
    } else {
      return response.status(404).json({
        'message': 'User not found!.'
      })
    }
  }
  async getLegendId ({ params, request, response, view }) {
    return await Legend.query()
                        .where('user_id', params.id)
                        .first()
  }

  /**
   * Render a form to update an existing legend.
   * GET legends/:id/edit
   *
   * @param {object} ctx
   * @param {Request} ctx.request
   * @param {Response} ctx.response
   * @param {View} ctx.view
   */
  async edit ({ params, request, response, view }) {
  }

  /**
   * Update legend details.
   * PUT or PATCH legends/:id
   *
   * @param {object} ctx
   * @param {Request} ctx.request
   * @param {Response} ctx.response
   */
  async update ({ params, request, response }) {
    const data = request.all()
    const busniessHours = data.businessHour
    delete data.businessHour
    await BusniessHour.query().where('legend_id', params.id).delete()
    await BusniessHour.createMany(busniessHours)

    return await Legend.query().where('id', params.id).update(data)
  }

  /**
   * Delete a legend with id.
   * DELETE legends/:id
   *
   * @param {object} ctx
   * @param {Request} ctx.request
   * @param {Response} ctx.response
   */
  async destroy ({ params, request, response }) {
  }

  async uploadLegendPhotos ({ request, auth }) {
    let data = request.all()
    const user_id = await auth.user.id
    const legend = await Legend.find(user_id)
    let uploadList = []
    for (let i of data.uploadList) {
      let ob = {
        url: i.url,
        legend_id: legend.id
      }
      uploadList.push(ob)
    }
    await LegendImage.query().where('legend_id', legend.id).delete()
    return await LegendImage.createMany(uploadList)
  }

  async getAdditionlegendInfo ({response, params}) {
    let legendData = await Legend.query()
                                  .where('id', params.id)
                                  .with('legendimages')
                                  // .with('questions')
                                  .with('questions', (builder) => builder.limit(2))
                                  .withCount('questions as totalQuestion')
                                  .with('questions.user')
                                  .with('hours')
                                  .first()

    return legendData
  }
  async getTodayBussinessHour ({response, params}) {
    var days = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday']
    var dd = new Date(Date.now())
    const today = days[dd.getDay()]
    let today_hour = dd.getHours()
    let bhours = await BusniessHour.query().where('legend_id', params.id).fetch()

    bhours = JSON.parse(JSON.stringify(bhours))
    let data = {}
    data.today = 0
    for (let d of bhours) {
      if (d.day == today) {
        data.today = 1
        data.day = d
        let time = d.time.split('-')
        time[0] = (time[0].charAt(6) == 'P') ? (parseInt(time[0].substr(0, 2)) + 12) : parseInt(time[0].substr(0, 2))
        time[1] = (time[1].charAt(6) == 'P') ? (parseInt(time[1].substr(0, 2)) + 12) : parseInt(time[1].substr(0, 2))
        if (today_hour > time[0] && today_hour < time[1]) data.open = true
        else data.open = false
      }
    }
    return data
  }
  async deleteImage ({ request, response, auth }) {
    const data = request.all()
    const user_id = await auth.user.id
    const legend_id = await Legend.query().where('user_id', user_id).first()
    const imageData = await LegendImage.query().where('id', data.id).first()
    if (legend_id.id != imageData.legend_id) {
      return response.status(401).json({
        'message': 'Your are not authorized!.'
      })
    }
    return await LegendImage.query().where('id', data.id).delete()
  }

  async paginatedata ({ params, request, response, view }) {
    const page = 1
    return await User.query().paginate(page)
    // const legendData = await Legend.query()
    //                               .where('id',params.id)
    //                               .with('reviews')
    //                               .with('reviews.reviwer')
    //                               .with('legendimages')
    //                               .with('questions')
    //                               //.withCount('avgRev')
    //                               .paginate(page)
    // if (legendData) {
    //   const userData = await User.query()
    //                             .where('id', legendData.user_id)
    //                             .first()
    //   return {
    //     legend: legendData,
    //     user: userData
    //   }
    // } else {
    //   return response.status(404).json({
    //     'message': 'User not found!.'
    //   })
    // }
  }
}

module.exports = LegendController
