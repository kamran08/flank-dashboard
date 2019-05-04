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
    if (rData.flag == 1) {
      let data = await Legend.query()
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
      return 'nodata'
    }
  }
}

module.exports = SearchController
