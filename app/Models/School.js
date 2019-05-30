'use strict'

/** @type {typeof import('@adonisjs/lucid/src/Lucid/Model')} */ 
const Model = use('Model')
const Database = use('Database') 

class School extends Model {
  coaches () {
    return this.hasMany('App/Models/SchoolCoach', 'id', 'school_id')
  }
  allreview () {
    return this.hasMany('App/Models/SchoolCoachReview', 'id', 'school_id')
  }
  allimages () {
    return this.hasMany('App/Models/CoachReviewImage', 'id', 'school_id')
  }
  avgRating () {
    return this.hasOne('App/Models/SchoolCoachReview', 'id', 'school_id').select('id', 'school_id', Database.raw('(cast(AVG(rating) as decimal(10,2))) AS averageRating'))
  }
  questions () {
    return this.hasMany('App/Models/SchoolQuestion', 'id', 'school_id').orderBy('id', 'desc').limit(1)
  }
}

module.exports = School
