'use strict'

/** @type {typeof import('@adonisjs/lucid/src/Lucid/Model')} */
const Model = use('Model')
const Database = use('Database') 

class SchoolCoach extends Model {
  avgRating () {
    return this.hasOne('App/Models/SchoolCoachReview', 'id', 'coach_id').select('id', 'coach_id', Database.raw('(cast(AVG(rating) as decimal(10,2))) AS averageRating'))
  }
  allreview () {
    return this.hasMany('App/Models/SchoolCoachReview', 'id', 'coach_id')
  }
  school () {
    return this.belongsTo('App/Models/School', 'school_id', 'id')
  }
}

module.exports = SchoolCoach
