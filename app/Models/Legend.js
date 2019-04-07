'use strict'

/** @type {typeof import('@adonisjs/lucid/src/Lucid/Model')} */
const Model = use('Model')

class Legend extends Model {
    reviews () {
        return this.hasMany('App/Models/Review', 'id', 'reviewFor')
      }
      // avgRev () {
      //   return this.hasOne('App/Models/Review', 'id', 'reviewFor')
      //   .select('id', 'reviewFor', Database.raw('cast(AVG(rating) as decimal(10,2)) AS averageRating'))
      //   .groupBy('reviewFor')
      // }
      legendimages(){
          return this.hasMany('App/Models/LegendImage','id','legend_id')
      }
      questions(){
          return this.hasMany('App/Models/Question','id','legend_id')
      }
}

module.exports = Legend
