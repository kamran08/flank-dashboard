'use strict'

/** @typedef {import('@adonisjs/framework/src/Request')} Request */
/** @typedef {import('@adonisjs/framework/src/Response')} Response */
/** @typedef {import('@adonisjs/framework/src/View')} View */
const Legend = use('App/Models/Legend')
const User = use('App/Models/User')
const LegendImage = use('App/Models/LegendImage')
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
    const legendData = await Legend.find(params.id)
    const userData = await User.query()
                                .where('id', legendData.user_id)
                                .with('reviews')
                                .with('reviews.reviwer')
                                //.withCount('avgRev')
                                .first()
    return {
      legend: legendData,
      user: userData
    } 
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
    return await Legend.query().where('id',params.id).update(data);
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

  async uploadLegendPhotos({ request, auth }){
    let data = request.all()
    const user_id = await auth.user.id
    const legend = await Legend.find(user_id)
    let uploadList = []
    for (let i of data.uploadList) {
      let ob = {
        url: i,
        legend_id: legend.id
      }
      uploadList.push(ob)
    }
    await LegendImage.query().where('legend_id', legend.id).delete()
    return await LegendImage.createMany(uploadList)

  }
}

module.exports = LegendController
