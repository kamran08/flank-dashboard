'use strict'

/** @type {typeof import('@adonisjs/lucid/src/Lucid/Model')} */
const Model = use('Model')

class Legend extends Model {
  reviews () {
    return this.hasMany('App/Models/Review', 'id', 'reviewFor').orderBy('id', 'desc').limit(2) 
  }
  reviewsall () {
    return this.hasOne('App/Models/Review', 'id', 'reviewFor')
  }
      // avgRev () {
      //   return this.hasOne('App/Models/Review', 'id', 'reviewFor')
      //   .select('id', 'reviewFor', Database.raw('cast(AVG(rating) as decimal(10,2)) AS averageRating'))
      //   .groupBy('reviewFor')
      // }
  legendimages () {
    return this.hasMany('App/Models/LegendImage', 'id', 'legend_id')
  }
  questions () {
    return this.hasMany('App/Models/Question', 'id', 'legend_id').orderBy('id', 'desc').limit(1)
  }
  hours () {
    return this.hasMany('App/Models/BusniessHour', 'id', 'legend_id')
  }
  totalReview () {
    return this.hasOne('App/Models/Review', 'id', 'reviewFor')
  }

}

module.exports = Legend
