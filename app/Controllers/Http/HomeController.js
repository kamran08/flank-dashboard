'use strict'

const EmailSubscription = use('App/Models/EmailSubscription')
const User = use('App/Models/User')
class HomeController {

    // Flank Daily Email Subscription

    async storeEmailSubscription({request}){
        let data = request.all();
        return EmailSubscription.create(data)
    }
    async userLogin ({ request, response, auth, session }) {
        const data = request.all()

        let user = await User.query().where('email',data.email).first()
        user = JSON.parse(JSON.stringify(user))
        console.log(user)
        if(user == null){
            return response.status(401).json({
                'message': 'Invalid email . Please try again.'
              })
        }
        if(user.packType != 2){
            return response.status(401).json({
                'message': 'You Profile is not Local Instructor Profile!'
              })
        }
    
        try {
        
          let user = await auth.query().attempt(data.email, data.password)
          return user
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
          return {
            user: user
          }
        } catch (error) {
          console.log(error.message)
          return false
        }
      }

}

module.exports = HomeController
