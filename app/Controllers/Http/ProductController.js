/* eslint-disable eqeqeq */
/* eslint-disable camelcase */
'use strict'

/** @typedef {import('@adonisjs/framework/src/Request')} Request */
/** @typedef {import('@adonisjs/framework/src/Response')} Response */
/** @typedef {import('@adonisjs/framework/src/View')} View */
const Product = use('App/Models/Product')
const User = use('App/Models/User')
const Attribute = use('App/Models/Attribute')
const ProductReview = use('App/Models/ProductReview')
const ProductReviewAtrribute = use('App/Models/ProductReviewAtrribute')
const ProductReviewImage = use('App/Models/ProductReviewImage')
const RecentReview = use('App/Models/RecentReview')
const Database = use('Database')
/**
 * Resourceful controller for interacting with products
 */
class ProductController {
  /**
   * Show a list of all products.
   * GET products
   *
   * @param {object} ctx
   * @param {Request} ctx.request
   * @param {Response} ctx.response
   * @param {View} ctx.view
   */
  async index ({ request, response, view, params }) {

  }

  /**
   * Render a form to be used for creating a new product.
   * GET products/create
   *
   * @param {object} ctx
   * @param {Request} ctx.request
   * @param {Response} ctx.response
   * @param {View} ctx.view
   */
  async create ({ request, response, view, auth }) {

  }

  /**
   * Create/save a new product.
   * POST products
   *
   * @param {object} ctx
   * @param {Request} ctx.request
   * @param {Response} ctx.response
   */
  async store ({ request, response, auth }) {
    let data = request.all()
    const user_id = await auth.user.id
    data.user_id = user_id
    return await Product.create(data)
  }

  /**
   * Display a single product.
   * GET products/:id
   *
   * @param {object} ctx
   * @param {Request} ctx.request
   * @param {Response} ctx.response
   * @param {View} ctx.view
   */
  async show ({ params, request, response, view }) {
    const legendData = await Product.query()
                        .where('id', params.id)
                        .withCount('reviewsall')
                        .with('firstImage')
                        .with('avgRating')
                        .first()

    if (legendData) {
      const userData = await User.query()
                          .where('id', legendData.user_id)
                          .first()

      return response.status(200).json({
        product: legendData,
        user: userData

    // atrrtributepoint: atrrtributepointData
      })
    } else {
      return response.status(404).json({
        'message': 'Prodcut not found!.'
      })
    }
  }

  async getAdditionProductInfo ({response, params}) {
    let legendData = await Product.query()
                                  .where('id', params.id)
                                  .with('questions', (builder) => builder.limit(2))
                                  .withCount('questions as totalQuestion')
                                  .with('questions.user')
                                  .first()

    return legendData
  }
  async productReviewinfo ({ params, request, response, view }) {
    const AttributeInfo = await Attribute.all()
    const productData = await Product.find(params.id)
    if (productData) {
      return response.status(200).json({
        productData: productData,
        AttributeInfo: AttributeInfo
      })
    } else {
      return response.status(404).json({
        'message': 'User not found!.'
      })
    }
  }
  async storeProductReview ({ request, response, auth }) {
    let data = request.all()
    const user_id = await auth.user.id
    data.reviwer_id = user_id
    let uploadList = []
    const AttributeInfoAll = data.AttributeInfo
    delete data.AttributeInfo

    const tempUpload = data.uploadList
    delete data.uploadList
    const rdata = await ProductReview.create(data)

    for (let i of tempUpload) {
      let ob = {
        url: i,
        review_id: rdata.id
      }
      uploadList.push(ob)
    }
    await ProductReviewImage.createMany(uploadList)
    let AttributeInfo = []
    for (let d of AttributeInfoAll) {
      if (d.isPositive == '0' || d.isPositive == '1') {
        let ob = {
          review_id: rdata.id,
          attribute_id: d.id,
          user_id: user_id,
          points: (d.isPositive == '0') ? (d.points * -1) : d.points

        }
        AttributeInfo.push(ob)
      }
    }

    await ProductReviewAtrribute.createMany(AttributeInfo)
    // const averageRating = await Database.raw('SELECT (cast(AVG(rating) as decimal(10,2))) AS averageRating  FROM `school_coach_reviews` WHERE `coach_id` = ?', [data.coach_id])
    // ProductReview.query().where('id', data.coach_id).update({
    //   average_rating: averageRating[0][0].averageRating
    // })
    await RecentReview.create({
      review_id: rdata.id,
      review_type: 'App/Models/ProductReview'
    })

    return rdata
  }

  /**
   * Render a form to update an existing product.
   * GET products/:id/edit
   *
   * @param {object} ctx
   * @param {Request} ctx.request
   * @param {Response} ctx.response
   * @param {View} ctx.view
   */
  async edit ({ params, request, response, view }) {
  }

  /**
   * Update product details.
   * PUT or PATCH products/:id
   *
   * @param {object} ctx
   * @param {Request} ctx.request
   * @param {Response} ctx.response
   */
  async update ({ params, request, response }) {
  }

  /**
   * Delete a product with id.
   * DELETE products/:id
   *
   * @param {object} ctx
   * @param {Request} ctx.request
   * @param {Response} ctx.response
   */
  async destroy ({ params, request, response }) {
  }
}

module.exports = ProductController
