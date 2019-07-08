'use strict'

/** @type {typeof import('@adonisjs/lucid/src/Lucid/Model')} */
const Model = use('Model')
const Database = use('Database')
class ProductReview extends Model {
  static get traits () {
    return ['@provider:Morphable']
  }
  reviwer () {
    return this.belongsTo('App/Models/User', 'reviwer_id')
  }
  reviewfor () {
    return this.belongsTo('App/Models/Product', 'product_id')
  }
  reviewforInfo () {
    return this.belongsTo('App/Models/Product', 'product_id')
  }
  images () {
    return this.hasMany('App/Models/ProductReviewImage', 'id', 'review_id')
  }
  imosall () {
    return this.hasOne('App/Models/ProductImo', 'id', 'review_id')
  }
  imos () {
    return this.hasOne('App/Models/ProductImo', 'id', 'review_id').select( 'review_id', Database.raw('sum(cool)   AS cool'), Database.raw('sum(funny)   AS funny'), Database.raw('sum(useful)   AS useful')).groupBy('review_id')
  }
  recentReviews () {
    return this.morphMany('App/Models/RecentReview', 'id', 'review_id', 'review_type')
  }
  // recent () {

  //   return this.morphOne('App/Models/RecentReview', 'id', 'review_id', 'review_type')
  // }
}

module.exports = ProductReview
