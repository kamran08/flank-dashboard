'use strict'

/** @typedef {import('@adonisjs/framework/src/Request')} Request */
/** @typedef {import('@adonisjs/framework/src/Response')} Response */
/** @typedef {import('@adonisjs/framework/src/View')} View */

const User = use('App/Models/User')
const Legend = use('App/Models/Legend')
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

    return "Nazmul Chowdhury"
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
    if (data.packType == 1) { return data }
    else{
      const ledata ={
        user_id: data.id,
        name: data.firstName
      }
      await Legend.create(ledata)
      return data
    }
    
  }

  async userLogin ({ request, response, auth, session }){ 

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
  async update ({ params, request, response }) {
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

  async logout ({auth}) {
    try {
      await auth.logout()
      return
    } catch (e) { 
      return false
    }
  }
  
  async sendResetLinkEmail ({request,response}){
      
    let email = request.all().email
    const check = await User.query().where('email', email).getCount()
    // eslint-disable-next-line eqeqeq
    if (check == 0) {
      return response.status(404).json({
        'message': "404 Email doesn't exist!."
      })
    }
    let token = suid (16)
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
    await User.query().where('email', email).update({"passwordToken": token})

    return
  }
  async initdata({request, response, auth}){
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

}

module.exports = UserController
