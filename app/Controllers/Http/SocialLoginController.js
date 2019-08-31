'use strict'
const User = use('App/Models/User')
class SocialLoginController {
    async redirect ({ ally }) {
       
        await ally.driver('facebook').redirect()
      }
    async getFBImage ({ ally,auth }) {
      const user = await auth.user;
     // const facebook = await ally.driver('facebook');

      //const allyUser = await facebook.getUserByToken(socialToken)
     // return await ally.driver('facebook').getUserByToken(user.token).getUser()
     return await ally.getUserByToken(user.token)
        
      
      }
    async googleRedirect ({ ally }) {
       
        await ally.driver('google').redirect()
      }
      async callback ({ ally, auth , response }) {

         
           
            const fbUser = await ally.driver('facebook').getUser();
           

         
    
          // user details to be saved
          const userDetails = {
            firstName: fbUser.getName(),
            img: fbUser.getAvatar(),
            email: fbUser.getEmail(),
            packType: 1,
            token: fbUser.getAccessToken(),
            login_source: 'facebook'
          };
    
          // search for existing user
          const whereClause = {
            email: fbUser.getEmail(),
            
          };
    
          const user = await User.findOrCreate(whereClause, userDetails);
          await auth.login(user);
    
          response.redirect('/?login=success')
        
      }
      async googleCallback ({ ally, auth , response }) {

         
           
            const googleUser = await ally.driver('google').getUser();
            
           

         
    
          // user details to be saved
          const userDetails = {
            firstName: googleUser.getName(),
            img: googleUser.getAvatar(),
            email: googleUser.getEmail(),
            packType: 1,
            token: googleUser.getAccessToken(),
            login_source: 'Google'
          };
    
          // search for existing user
          const whereClause = {
            email: googleUser.getEmail(),
            
          };
    
          const user = await User.findOrCreate(whereClause, userDetails);
          await auth.login(user);
    
          response.redirect('/?login=success')
        
      }

    }

module.exports = SocialLoginController
