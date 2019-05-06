/* eslint-disable no-multi-spaces */
/* eslint-disable eqeqeq */
'use strict'
const Legend = use('App/Models/Legend')
const School = use('App/Models/School')
const SchoolCoach = use('App/Models/SchoolCoach')
class SearchController {

  async SearchData ({request, response, params }) {
    const rData = request.all()
    const page = rData.page
    let data = {}
    if (rData.flag == 1) {
      data = await Legend.query()
                              .select('name')
                              .select('phone')
                              .select('address')
                              .select('img')
                              .withCount('totalReview')
                              .with('reviewsall')
                              .where('name', 'LIKE', '%' + rData.str + '%')
                              .paginate(page, 5)
      return data
    }    else {
      return 'noData'
      //  data = await Legend.query()
      //                         .select('schoolName as name')
      //                         .select('teamWebsite as  phone')
      //                         .select('city as address')
      //                         .select('logo as img')
      //                         .withCount('totalReview')
      //                         .with('reviewsall')
      //                         .where('name', 'LIKE', '%' + rData.str + '%')
      //                         .paginate(page, 5)
    }
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
