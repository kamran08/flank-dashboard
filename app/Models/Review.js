'use strict'

/** @type {typeof import('@adonisjs/lucid/src/Lucid/Model')} */
const Model = use('Model')
const Database = use('Database')

class Review extends Model {
  reviwer () {
      return this.belongsTo('App/Models/User', 'reviwer_id')
    }
  reviewfor () {
      return this.belongsTo('App/Models/Legend', 'reviewFor')
    }
  images () {
      return this.hasMany('App/Models/ReviewImage', 'id', 'review_id')
    }
  imos () {
      return this.hasMany('App/Models/Reviewimo').select('id', 'review_id', 'imo', Database.raw('count(imo)   AS total')).groupBy('imo').groupBy('review_id')
    }
    // imos(){

    //     return this.hasMany('App/Models/Reviewimo', 'id', 'review_id').select('imo').count('imo as total').groupBy('imo')
    // }
    // avgrating(){
    //     return this.hasMany('App/Models/Reviewimo', 'id', 'review_id')
    //             .select("id", 'product_Id', Database.raw( 'cast(AVG(rNumber) as decimal(10,2)) AS averageRating'))
    //             .groupBy('product_Id')
    // }
}

module.exports = Review
