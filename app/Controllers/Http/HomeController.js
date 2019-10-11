'use strict'

const EmailSubscription = use('App/Models/EmailSubscription')
const User = use('App/Models/User')
const Helpers = use('Helpers')
const Database = use('Database')
class HomeController {
  // Flank Daily Email Subscription

  
  async userLogin ({ request, response, auth, session }) {
    const data = request.all()

    let user = await User.query().where('email', data.email).first()
    user = JSON.parse(JSON.stringify(user))
    console.log(user)
    if (user == null) {
      return response.status(401).json({
        'message': 'Invalid email . Please try again.'
      })
    }
    if (user.packType != 2) {
      return response.status(401).json({
        'message': 'You Profile is not Local Instructor Profile!'
      })
    }

    try {
      let user = await auth.query().attempt(data.email, data.password)
      return User.query().with('legend').where('id',user.id).first();
    } catch (e) {
      return response.status(401).json({
        'message': 'Invalid  password. Please try again.'
      })
    }
  }
  async logout ({ auth, session }) {
    try {
      session.clear()
      await auth.logout()
      return
    } catch (e) {
      return false
    }
  }
  async initdata ({ request, response, auth }) {
    try {
      const user = await auth.getUser()
      const legend = await User.query().with('legend').where('id',user.id).first();
      return {
        user: legend
      //  user: user
      }
    } catch (error) {
      console.log(error.message)
      return false
    }
  }

  // Upload Photos
  async uploadReviewFile ({ request, response }) {
    console.log("I am here")
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

    return response.status(200).json({
      msg: 'Image has been uploaded successfully!',
      file: `/uploads/${name}`
    })
  }
}

module.exports = HomeController
