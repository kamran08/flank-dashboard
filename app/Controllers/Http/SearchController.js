/* eslint-disable standard/object-curly-even-spacing */
/* eslint-disable no-multi-spaces */
/* eslint-disable eqeqeq */
'use strict'
const Legend = use('App/Models/Legend')
const School = use('App/Models/School')
const SchoolCoach = use('App/Models/SchoolCoach')
class SearchController {

  async SearchData ({request, response, params }) {
    let place = request.input('place') ? request.input('place') : ''
    let str = request.input('str') ? request.input('str') : ''
    let page = request.input('page') ? request.input('page') : 1
    let pageOption = request.input('pageOption')

    let data = {}
    if (pageOption == 'legend') {
      data =  Legend.query()
                    .select('id')
                    .select('name')
                    .select('phone')
                    .select('address')
                    .select('img')
                    .with('avgRating')
                    .withCount('totalReview')

      if (str) {
        data.where('name', 'LIKE', '%' + str + '%')
      }
      if (place) {
        data.where('address', 'LIKE', '%' + place + '%')
      }
    }    else if (pageOption == 'school') {
      data =  School.query()
                    .with('avgRating')
                    .withCount('allreview')

      if (str) {
        data.where('schoolName', 'LIKE', '%' + str + '%')
      }
      if (place) {
        data.where('city', 'LIKE', '%' + place + '%')
        data.orWhere('state', 'LIKE', '%' + place + '%')
        data.orWhere('division', 'LIKE', '%' + place + '%')
      }
    } else if (pageOption == 'coach') {
      data =  SchoolCoach.query()
                    .with('avgRating')
                    .withCount('allreview')
                    .with('school')

      if (str) {
        data.where('name', 'LIKE', '%' + str + '%')
      }
    }

    let mdata = await data.paginate(page, 5)
    mdata = mdata.toJSON()
    let tempData = JSON.parse(JSON.stringify(mdata))
    for (let d of tempData.data) {
      if (d.avgRating == null) d.avgRating = 0
    }

    return tempData
  }

  async SearchByKeyCoach ({request}) {
    const data = request.all()
    return await Legend.query()
                      .select('name')
                      .select('id')
                      .where('name', 'LIKE', '%' + data.key + '%')
                      .fetch()
  }

  async SearchByKeySchool ({request}) {
    const data = request.all()
    return await School.query()
                      .select('schoolName as name')
                      .select('sport')
                      .select('id')
                      .where('schoolName', 'LIKE', '%' + data.key + '%')
                      .fetch()
  }

  async SearchByKeySchoolCoach ({request}) {
    const data = request.all()
    return await SchoolCoach.query()
                      .select('name')
                      .select('id')
                      .where('name', 'LIKE', '%' + data.key + '%')
                      .where('school_id',  data.school_id)
                      .fetch()
  }
}

module.exports = SearchController
