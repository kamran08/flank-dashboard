'use strict'

/** @typedef {import('@adonisjs/framework/src/Request')} Request */
/** @typedef {import('@adonisjs/framework/src/Response')} Response */
/** @typedef {import('@adonisjs/framework/src/View')} View */
const School = use('App/Models/School')
const SchoolCoach = use('App/Models/SchoolCoach')

/**
 * Resourceful controller for interacting with schools
 */
class SchoolController {
  /**
   * Show a list of all schools.
   * GET schools
   *
   * @param {object} ctx
   * @param {Request} ctx.request
   * @param {Response} ctx.response
   * @param {View} ctx.view
   */
  async index ({ request, response, view }) {
    let coachData = []
    var start = new Date().getTime();
    console.log('starting time is', )
    for (let d of tempCoach) {
      let schoolData = {
        'logo': d['logo'],
        'schoolName': d['Name Of School'],
        'city': d['City'],
        'state': d['State'],
        'division': d['lDivisionogo'],
        'sport': d['Sport'],
        'roster': d['roster'],
        'alumni': d['alumni'],
        'interestedAthletes': d['loInterested Athletesgo'],
        'committedRecruit': d['Committed Recruit'],
        'placedAthletes': d['Placed Athletes'],
        'teamWebsite': d['Official Team Website']
      }

      let newSchoolData = await School.create(schoolData)
      let coachData = []
      let countVar = 0
      for (let dd in d) {
        countVar++
        if (countVar > 12) {
          if (d[dd] != null) {
            let coachob = {
              'school_id': newSchoolData.id,
              'name': d[dd]
            }
            SchoolCoach.create(coachob)
            
          }
        }
      }

     
    }
    var end = new Date().getTime();
    var time = end - start;   
    console.log(time)
    let str = 'done'
    return str
  }

  /**
   * Render a form to be used for creating a new school.
   * GET schools/create
   *
   * @param {object} ctx
   * @param {Request} ctx.request
   * @param {Response} ctx.response
   * @param {View} ctx.view
   */
  async create ({ request, response, view }) {
  }

  /**
   * Create/save a new school.
   * POST schools
   *
   * @param {object} ctx
   * @param {Request} ctx.request
   * @param {Response} ctx.response
   */
  async store ({ request, response }) {

  }

  /**
   * Display a single school.
   * GET schools/:id
   *
   * @param {object} ctx
   * @param {Request} ctx.request
   * @param {Response} ctx.response
   * @param {View} ctx.view
   */
  async show ({ params, request, response, view }) {
  }

  /**
   * Render a form to update an existing school.
   * GET schools/:id/edit
   *
   * @param {object} ctx
   * @param {Request} ctx.request
   * @param {Response} ctx.response
   * @param {View} ctx.view
   */
  async edit ({ params, request, response, view }) {
  }

  /**
   * Update school details.
   * PUT or PATCH schools/:id
   *
   * @param {object} ctx
   * @param {Request} ctx.request
   * @param {Response} ctx.response
   */
  async update ({ params, request, response }) {
  }

  /**
   * Delete a school with id.
   * DELETE schools/:id
   *
   * @param {object} ctx
   * @param {Request} ctx.request
   * @param {Response} ctx.response
   */
  async destroy ({ params, request, response }) {
  }
}

module.exports = SchoolController