/* eslint-disable no-return-await */
/* eslint-disable camelcase */
/* eslint-disable eqeqeq */
'use strict'

/** @typedef {import('@adonisjs/framework/src/Request')} Request */
/** @typedef {import('@adonisjs/framework/src/Response')} Response */
/** @typedef {import('@adonisjs/framework/src/View')} View */
const School = use('App/Models/School')
const SchoolCoach = use('App/Models/SchoolCoach')
const Attribute = use('App/Models/Attribute')
const ReviewImage = use('App/Models/ReviewImage')
const Review = use('App/Models/Review')
const ReviewAttribute = use('App/Models/ReviewAttribute')

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
    let tempCoach = [

      // {
      //   'logo': 'https://team.fieldlevel.com/none/media/TeamLogo.jpg?shortName=79f7part&sportEnum=1&width=90&height=90',
      //   'Name Of School': 'Lawrence Technological University',
      //   'City': 'Southfield',
      //   'State': 'MI',
      //   'Division': 'NAIA',
      //   'Sport': 'Baseball',
      //   'roster': '',
      //   'alumni': 0,
      //   'Interested Athletes': '196',
      //   'Committed Recruit': '24',
      //   'Placed Athletes': null,
      //   'Official Team Website': 'http://www.ltu.athletics.com/',
      //   'COACH 1': null,
      //   'COACH 2': null,
      //   'COACH 3': null,
      //   'COACH 4': null,
      //   'COACH 5': null,
      //   'COACH 6': null,
      //   'COACH 7': null,
      //   'COACH 8': null,
      //   'COACH 9': null,
      //   'COACH 10': null,
      //   'COACH 11': null,
      //   'COACH 12': null
      // },
      // {
      //   'logo': 'https://team.fieldlevel.com/none/media/TeamLogo.jpg?shortName=fresnocitycollege&sportEnum=256&width=90&height=90',
      //   'Name Of School': 'Fresno City College',
      //   'City': 'Fresno',
      //   'State': 'CA',
      //   'Division': 'Junior College',
      //   'Sport': 'Football',
      //   'roster': '17',
      //   'alumni': 93,
      //   'Interested Athletes': null,
      //   'Committed Recruit': null,
      //   'Placed Athletes': '6',
      //   'Official Team Website': null,
      //   'COACH 1': 'Tony Caviglia',
      //   'COACH 2': 'Connor Shannon',
      //   'COACH 3': 'Keith Travis',
      //   'COACH 4': 'Vince Branstetter',
      //   'COACH 5': 'Dwayne Wright',
      //   'COACH 6': 'Patrick Markarian',
      //   'COACH 7': 'Dennis Randle',
      //   'COACH 8': 'Mark Hetherington',
      //   'COACH 9': 'Jesus Reyes',
      //   'COACH 10': 'Ryan Ruschhaupt',
      //   'COACH 11': 'Drew Brown',
      //   'COACH 12': 'Rick Scheidt'
      // },
      // {
      //   'logo': 'https://team.fieldlevel.com/none/media/TeamLogo.jpg?shortName=cgcc&sportEnum=1&width=90&height=90',
      //   'Name Of School': 'Chandler-Gilbert Community College',
      //   'City': 'Chandler',
      //   'State': 'AZ',
      //   'Division': 'Junior College',
      //   'Sport': 'Baseball',
      //   'roster': '14',
      //   'alumni': 145,
      //   'Interested Athletes': null,
      //   'Committed Recruit': null,
      //   'Placed Athletes': '93',
      //   'Official Team Website': 'http://www.cgc.edu/athletics/mSports/baseball/Pages/home.aspx',
      //   'COACH 1': 'Russell Luce',
      //   'COACH 2': 'Jon Watson',
      //   'COACH 3': 'Mike Campbell',
      //   'COACH 4': 'Dave Pankenier',
      //   'COACH 5': 'Ed Yeager',
      //   'COACH 6': null,
      //   'COACH 7': null,
      //   'COACH 8': null,
      //   'COACH 9': null,
      //   'COACH 10': null,
      //   'COACH 11': null,
      //   'COACH 12': null
      // },
      // {
      //   'logo': 'https://team.fieldlevel.com/none/media/TeamLogo.jpg?shortName=q74wtjyn&sportEnum=1&width=90&height=90',
      //   'Name Of School': 'OLS Knights',
      //   'City': 'New York',
      //   'State': 'NY',
      //   'Division': 'Club/Travel',
      //   'Sport': 'Baseball',
      //   'roster': '0',
      //   'alumni': 0,
      //   'Interested Athletes': null,
      //   'Committed Recruit': null,
      //   'Placed Athletes': '0',
      //   'Official Team Website': null,
      //   'COACH 1': 'Marcelo Perez III',
      //   'COACH 2': null,
      //   'COACH 3': null,
      //   'COACH 4': null,
      //   'COACH 5': null,
      //   'COACH 6': null,
      //   'COACH 7': null,
      //   'COACH 8': null,
      //   'COACH 9': null,
      //   'COACH 10': null,
      //   'COACH 11': null,
      //   'COACH 12': null
      // },
      // {
      //   'logo': 'https://team.fieldlevel.com/none/media/TeamLogo.jpg?shortName=montana&sportEnum=256&width=90&height=90',
      //   'Name Of School': 'Montana State University',
      //   'City': 'Bozeman',
      //   'State': 'MT',
      //   'Division': 'NCAA DI',
      //   'Sport': 'Football',
      //   'roster': '',
      //   'alumni': 0,
      //   'Interested Athletes': '303',
      //   'Committed Recruit': '12',
      //   'Placed Athletes': '0',
      //   'Official Team Website': null,
      //   'COACH 1': null,
      //   'COACH 2': null,
      //   'COACH 3': null,
      //   'COACH 4': null,
      //   'COACH 5': null,
      //   'COACH 6': null,
      //   'COACH 7': null,
      //   'COACH 8': null,
      //   'COACH 9': null,
      //   'COACH 10': null,
      //   'COACH 11': null,
      //   'COACH 12': null
      // },
      // {
      //   'logo': 'https://team.fieldlevel.com/none/media/TeamLogo.jpg?shortName=f6hatfr7&sportEnum=1&width=90&height=90',
      //   'Name Of School': 'Illinois Indians',
      //   'City': 'Des Plaines',
      //   'State': 'IL',
      //   'Division': 'Club/Travel',
      //   'Sport': 'Baseball',
      //   'roster': '125',
      //   'alumni': 422,
      //   'Interested Athletes': null,
      //   'Committed Recruit': null,
      //   'Placed Athletes': '187',
      //   'Official Team Website': 'http://www.hometeamsonline.com/teams/?u=ILLINOISINDIANS&s=baseball&t=c',
      //   'COACH 1': 'Connor Flowers',
      //   'COACH 2': 'Mike Randazzo',
      //   'COACH 3': 'Conor Philbin',
      //   'COACH 4': 'Tyler Albright',
      //   'COACH 5': 'Matt Mahay',
      //   'COACH 6': 'Anthony Concialdi',
      //   'COACH 7': 'Matt Smith',
      //   'COACH 8': 'Bryce Skelton',
      //   'COACH 9': 'Greg Partyka',
      //   'COACH 10': 'Marc Mantucca',
      //   'COACH 11': 'Mike Pugliese',
      //   'COACH 12': 'Tyler Pazik'
      // },
      // {
      //   'logo': 'https://team.fieldlevel.com/none/media/TeamLogo.jpg?shortName=j4k4cpt7&sportEnum=1&width=90&height=90',
      //   'Name Of School': 'California Baseball Academy',
      //   'City': 'Rancho Cucamonga',
      //   'State': 'CA',
      //   'Division': 'Club/Travel',
      //   'Sport': 'Baseball',
      //   'roster': '291',
      //   'alumni': 393,
      //   'Interested Athletes': null,
      //   'Committed Recruit': null,
      //   'Placed Athletes': '266',
      //   'Official Team Website': 'http://www.cbabaseball.org',
      //   'COACH 1': 'Josh Glassey',
      //   'COACH 2': 'John Berumen',
      //   'COACH 3': 'Patrick Murphy',
      //   'COACH 4': 'Andrew Takayoshi',
      //   'COACH 5': 'Tim McCollum',
      //   'COACH 6': 'Carlos Ramirez',
      //   'COACH 7': 'Jon Paino',
      //   'COACH 8': 'Joe Spiers',
      //   'COACH 9': 'Tim Blume',
      //   'COACH 10': null,
      //   'COACH 11': null,
      //   'COACH 12': null
      // },
      // {
      //   'logo': 'https://team.fieldlevel.com/none/media/TeamLogo.jpg?shortName=nwosu&sportEnum=256&width=90&height=90',
      //   'Name Of School': 'Northwestern Oklahoma State University',
      //   'City': 'Alva',
      //   'State': 'OK',
      //   'Division': 'NCAA DII',
      //   'Sport': 'Football',
      //   'roster': '',
      //   'alumni': 0,
      //   'Interested Athletes': '282',
      //   'Committed Recruit': '21',
      //   'Placed Athletes': '266',
      //   'Official Team Website': 'http://riderangersride.com/index.aspx?path=football&',
      //   'COACH 1': null,
      //   'COACH 2': null,
      //   'COACH 3': null,
      //   'COACH 4': null,
      //   'COACH 5': null,
      //   'COACH 6': null,
      //   'COACH 7': null,
      //   'COACH 8': null,
      //   'COACH 9': null,
      //   'COACH 10': null,
      //   'COACH 11': null,
      //   'COACH 12': null
      // },
      // {
      //   'logo': 'https://team.fieldlevel.com/none/media/TeamLogo.jpg?shortName=edw7gh4f&sportEnum=1&width=90&height=90',
      //   'Name Of School': 'Monroe College - Bronx',
      //   'City': 'New York',
      //   'State': 'NY',
      //   'Division': 'Junior College',
      //   'Sport': 'Baseball',
      //   'roster': '16',
      //   'alumni': 2,
      //   'Interested Athletes': null,
      //   'Committed Recruit': null,
      //   'Placed Athletes': '0',
      //   'Official Team Website': 'https://monroeexpress.com/index.aspx?path=baseball',
      //   'COACH 1': 'John Torres',
      //   'COACH 2': null,
      //   'COACH 3': null,
      //   'COACH 4': null,
      //   'COACH 5': null,
      //   'COACH 6': null,
      //   'COACH 7': null,
      //   'COACH 8': null,
      //   'COACH 9': null,
      //   'COACH 10': null,
      //   'COACH 11': null,
      //   'COACH 12': null
      // }
    ]
    var start = new Date().getTime()
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
    const legendData = await School.query()
      .where('id', params.id)
      .withCount('allreview')
      .with('coaches')
      .with('coaches.avgRating')
      .with('allimages')
      .with('avgRating')
      .first()
    if (legendData) {
      return response.status(200).json({
        School: legendData

      })
    } else {
      return response.status(404).json({
        'message': 'School not found!.'
      })
    }
  }

  async showSchoolCoach ({ params, request, response, view }) {
    const AttributeInfo = await Attribute.all()
    const SchoolCoachData = await SchoolCoach.find(params.id)

    return response.status(200).json({
      SchoolCoachData: SchoolCoachData,
      AttributeInfo: AttributeInfo
    })
  }

  async storeSchoolCoachReview ({ request, response, auth }) {
    let data = request.all()
    const user_id = await auth.user.id
    data.reviwer_id = user_id
    let uploadList = []
    const AttributeInfoAll = data.AttributeInfo
    delete data.AttributeInfo

    const tempUpload = data.uploadList
    delete data.uploadList
    data.review_type = 'school'
    const rdata = await Review.create(data)

    for (let i of tempUpload) {
      let ob = {
        url: i,
        review_id: rdata.id
      }
      uploadList.push(ob)
    }
    await ReviewImage.createMany(uploadList)
    let AttributeInfo = []
    for (let d of AttributeInfoAll) {
      if (d.isPositive == '0' || d.isPositive == '1') {
        let ob = {
          review_id: rdata.id,
          attribute_id: d.id,
          user_id: user_id,
          points: (d.isPositive == '0') ? (d.points * -1) : d.points

        }
        AttributeInfo.push(ob)
      }
    }

    await ReviewAttribute.createMany(AttributeInfo)
    // const averageRating = await Database.raw('SELECT (cast(AVG(rating) as decimal(10,2))) AS averageRating  FROM `school_coach_reviews` WHERE `coach_id` = ?', [data.coach_id])
    // SchoolCoach.query().where('id', data.coach_id).update({
    //   average_rating: averageRating[0][0].averageRating
    // })

    // await RecentReview.create({
    //   review_id: rdata.id,
    //   review_type: 'App/Models/SchoolCoachReview'
    // })
    return rdata
  }

  async storeSchoolCoache ({ params, request, response, view }) {
    const data = request.all()
    return await SchoolCoach.create(data)
  }

  async getAdditionCoachInfo ({ response, params }) {
    
    let legendData = await School.query()
      .where('id', params.id)
      .with('questions', (builder) => builder.limit(2))
      .withCount('questions as totalQuestion')
      .with('questions.user')
      .first()

    return legendData
  }
  async getSchoolcoaches ({ response, params }) {
    return await SchoolCoach.query()
      .with('school')
      .orderBy('average_rating', 'desc')
      .withCount('allreview')
      .limit(3)
      .fetch()
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
