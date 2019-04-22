'use strict'

/** @type {typeof import('@adonisjs/lucid/src/Lucid/Model')} */
const Model = use('Model')

class Question extends Model {
  user () {
    return this.belongsTo('App/Models/User', 'user_id', 'id')
  }
  answers() {
      return this.hasMany('App/Models/Answer', 'id', 'question_id').limit(1)
  }
  allAnswers() {
      return this.hasMany('App/Models/Answer', 'id', 'question_id')
  }
}

module.exports = Question
