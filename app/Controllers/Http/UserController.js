/* eslint-disable eqeqeq */
'use strict'

/** @typedef {import('@adonisjs/framework/src/Request')} Request */
/** @typedef {import('@adonisjs/framework/src/Response')} Response */
/** @typedef {import('@adonisjs/framework/src/View')} View */

const User = use('App/Models/User')
const Legend = use('App/Models/Legend')
const Database = use('Database')
/**
 * Resourceful controller for interacting with users
 */
class UserController {
  /**
   * Show a list of all users.
   * GET users
   *
   * @param {object} ctx
   * @param {Request} ctx.request
   * @param {Response} ctx.response
   * @param {View} ctx.view
   */
  async index ({ request, response, view }) {
    return 'Nazmul Chowdhury'
  }

  /**
   * Render a form to be used for creating a new user.
   * GET users/create
   *
   * @param {object} ctx
   * @param {Request} ctx.request
   * @param {Response} ctx.response
   * @param {View} ctx.view
   */
  async create ({ request, response, view }) {

  }

  /**
   * Create/save a new user.
   * POST users
   *
   * @param {object} ctx
   * @param {Request} ctx.request
   * @param {Response} ctx.response
   */
  async store ({ request, response }) {
    const formInfo = request.all()
    delete formInfo.password_confirmation
    const data = await User.create(formInfo)
    // eslint-disable-next-line eqeqeq
    if (data.packType == 1) { return data } else {
      const ledata = {
        user_id: data.id,
        name: data.firstName
      }
      await Legend.create(ledata)
      return data
    }
  }

  async userLogin ({ request, response, auth, session }) {
    const data = request.all()

    try {
      let user = await auth.query().attempt(data.email, data.password)
      return user
    } catch (e) {
      return response.status(401).json({
        'message': 'Invalid email or password. Please try again.'
      })
    }
  }

  /**
   * Display a single user.
   * GET users/:id
   *
   * @param {object} ctx
   * @param {Request} ctx.request
   * @param {Response} ctx.response
   * @param {View} ctx.view
   */
  async show ({ params, request, response, view }) {
    const userData = await User.query()
                                .where('id', params.id)
                                .with('reviews')
                                .with('reviews.reviewfor')
                                .with('reviews.images')
                                // .with('ratinginfo', (builder) => {
                                //   builder.where('rating', 5)
                                // })
                                .first()
    const reviewRatings = await Database.raw('SELECT rating,COUNT(rating) as total FROM `reviews` WHERE `reviwer_id`= ? GROUP by rating ORDER by rating ASC', [params.id])

    const imosCount = await Database.raw('SELECT users.id, users.firstName,COUNT(reviewimos.imo) as total,reviewimos.imo from reviews INNER JOIN users on reviews.reviwer_id = users.id INNER join reviewimos on reviewimos.review_id = reviews.id where reviews.reviwer_id = ? GROUP by reviewimos.imo', [params.id])
    let ratingD = []
    for (let i = 0; i < 5; i++) {
      let ob = {
        rating: (i + 1),
        padding: 0,
        total: 0
      }
      for (let d of reviewRatings[0]) {
        if (ob.rating == d.rating) {
          ob.total = d.total
        }
      }
      ratingD.push(ob)
    }
    const maxv = Math.max.apply(Math, ratingD.map(function (d) { return d.total }))
    for (let d of ratingD) {
      d.padding = parseInt((80 * d.total) / maxv)
    }

    if (userData) {
      return {
        user: userData,
        reviewRatings: ratingD,
        imosCount: imosCount[0]
      }
    } else {
      return response.status(404).json({
        'message': 'User not found!.'
      })
    }
  }

  /**
   * Render a form to update an existing user.
   * GET users/:id/edit
   *
   * @param {object} ctx
   * @param {Request} ctx.request
   * @param {Response} ctx.response
   * @param {View} ctx.view
   */
  async edit ({ params, request, response, view }) {
  }

  /**
   * Update user details.
   * PUT or PATCH users/:id
   *
   * @param {object} ctx
   * @param {Request} ctx.request
   * @param {Response} ctx.response
   */
  async update ({ params, request, response, auth }) {
    const data = request.all()
    // eslint-disable-next-line camelcase
    const user_id = await auth.user.id
    // eslint-disable-next-line camelcase
    if (user_id != params.id) {
      return response.status(401).json({
        'message': 'You are not authorized!'
      })
    }
    return await User.query().where('id', user_id).update(data)
  }

  /**
   * Delete a user with id.
   * DELETE users/:id
   *
   * @param {object} ctx
   * @param {Request} ctx.request
   * @param {Response} ctx.response
   */
  async destroy ({ params, request, response }) {
  }

  async logout ({auth, session}) {
    try {
      session.clear()
      await auth.logout()
      return
    } catch (e) {
      return false
    }
  }

  async sendResetLinkEmail ({request, response}) {
    let email = request.all().email
    const check = await User.query().where('email', email).getCount()
    // eslint-disable-next-line eqeqeq
    if (check == 0) {
      return response.status(404).json({
        'message': "404 Email doesn't exist!."
      })
    }
    let token = suid(16)
    let data = {
      token: token
    }
    console.log(data)
    // await Mail.send('emails.forgotpassword', data, (message) => {
    //   message
    //     .to(email)
    //     .from('Support@worldtradebuddy.com', 'Support @ WorldTradeBuddy')
    //     .subject('Reset Password')
    // })
    await User.query().where('email', email).update({'passwordToken': token})

    return
  }
  async initdata ({request, response, auth}) {
    try {
      const user = await auth.getUser()
      return {
        user: user
      }
    } catch (error) {
      console.log(error.message)
      return false
    }
  }
  async updateProfileImage ({request, response, auth}) {
    const user_id = await auth.user().id
    const profilePic = request.file('file', {
      types: ['png', 'jpg', 'jpeg'],
      size: '2mb'
    })
    const name = `${new Date().getTime()}` + '.' + profilePic._subtype
    // UPLOAD THE IMAGE TO UPLOAD FOLDER
    await profilePic.move(Helpers.publicPath('uploads'), {
      name: name
    })
    if (!profilePic.moved()) {
      return profilePic.error()
    }
    const file = `/uploads/${name}`
    let data = {
      img: file
    }

    await User.query().where('id', user_id).update(data)

    return response.status(200).json({
      msg: 'Image has been uploaded successfully!',
      file: `/uploads/${name}`
    })
  }

}

module.exports = UserController
