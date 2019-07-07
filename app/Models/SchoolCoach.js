'use strict'

/** @type {typeof import('@adonisjs/lucid/src/Lucid/Model')} */ 
const Model = use('Model')
const Database = use('Database') 

class SchoolCoach extends Model {
  avgRating () {
    return this.hasOne('App/Models/Review', 'id', 'reviewFor').select('id', 'reviewFor', Database.raw('(cast(AVG(rating) as decimal(10,2))) AS averageRating')).where('review_type', 'school')
  }
  allreview () {
    return this.hasMany('App/Models/Review', 'id', 'reviewFor')
  }
  school () {
    return this.belongsTo('App/Models/School', 'school_id', 'id')
  }
}

module.exports = SchoolCoach
