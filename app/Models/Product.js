'use strict'

/** @type {typeof import('@adonisjs/lucid/src/Lucid/Model')} */
const Model = use('Model')
const Database = use('Database') 

class Product extends Model {
  reviews () {
    return this.hasMany('App/Models/ProductReview', 'id', 'product_id').orderBy('id', 'desc').limit(2)
  }
  reviewsall () {
    return this.hasOne('App/Models/ProductReview', 'id', 'product_id')
  }
  avgRating () {
    return this.hasOne('App/Models/ProductReview', 'id', 'product_id').select('id', 'product_id', Database.raw('(cast(AVG(rating) as decimal(10,2))) AS averageRating'))
  }
  legendimages () {
    return this.hasMany('App/Models/ProductImage', 'id', 'product_id')
  }
  firstImage () {
    return this.hasOne('App/Models/ProductImage', 'id', 'product_id')
  }
  questions () {
    return this.hasMany('App/Models/ProductQuestion', 'id', 'product_id').orderBy('id', 'desc').limit(1)
  }

}

module.exports = Product
