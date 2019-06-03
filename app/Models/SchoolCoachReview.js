'use strict'

/** @type {typeof import('@adonisjs/lucid/src/Lucid/Model')} */
const Model = use('Model')
const Database = use('Database')

class SchoolCoachReview extends Model {
  static get traits () {
    return ['@provider:Morphable']
  }
  reviwer () {
    return this.belongsTo('App/Models/User', 'reviwer_id')
  }
  coach () {
    return this.belongsTo('App/Models/SchoolCoach', 'school_id')
  }
  reviewforInfo () {
    return this.belongsTo('App/Models/SchoolCoach', 'school_id')
  }
  images () {
    return this.hasMany('App/Models/CoachReviewImage', 'id', 'review_id')
  }
  imosall () {
    return this.hasOne('App/Models/CoachImo', 'id', 'review_id')
  }
  imos () {
    return this.hasOne('App/Models/CoachImo', 'id', 'review_id').select('id', 'review_id', Database.raw('sum(cool)   AS cool'), Database.raw('sum(funny)   AS funny'), Database.raw('sum(useful)   AS useful')).groupBy('review_id')
  }
  recentReviews () {
    return this.morphMany('App/Models/RecentReview', 'id', 'review_id', 'review_type')
  }
}

module.exports = SchoolCoachReview
