'use strict'

/** @type {typeof import('@adonisjs/lucid/src/Lucid/Model')} */
const Model = use('Model')

class RecentReview extends Model {
  static get traits () {
    return ['@provider:Morphable']
  }
  withallreview () {
    return this.morphTo([
      'App/Models/SchoolCoachReview', 'App/Models/Review', 'App/Models/ProductReview'
    ], 'review_id', 'id', 'id', 'id', 'review_type')
  }
}

module.exports = RecentReview
