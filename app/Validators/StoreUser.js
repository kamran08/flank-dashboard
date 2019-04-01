'use strict'

class StoreUser {
  get rules () {
    return {
      name: 'required|min:3|max:255',
      email: 'required|email|unique:users,email',
      password: 'required|min:6|confirmed'
    }
  }
  get messages () {
    return {
      'name.min': 'Minimum character for name is 3',
      'name.max': 'Maximum character for name is 255',
      'email.email': 'You must provide a valid email address.',
      'email.unique': 'This email is already registered.',
      'password.min': 'Minimum character for password is 3'
    }
  }
}

module.exports = StoreUser
