'use strict'

/*
|--------------------------------------------------------------------------
| Routes
|--------------------------------------------------------------------------
|
| Http routes are entry points to your web application. You can create
| routes for different URL's and bind Controller actions to them.
|
| A complete guide on routing is available here.
| http://adonisjs.com/guides/routing
|
*/

const Route = use('Route')

Route.resource('users', 'UserController').validator(new Map([
  [['users.store'], ['StoreUser']]
  // [['users.update'], ['UpdateUser']]
]))
Route.post('/authentication/login', 'UserController.userLogin').middleware(['guest'])
Route.get('/logout', 'UserController.logout')
Route.get('/password/email', 'UserController.sendResetLinkEmail')
Route.get('/app/user/updateProfileImage', 'UserController.updateProfileImage')
Route.get('/app/user/updateProductProfileImage/:id', 'ProductController.updateProductProfileImage')
Route.put('/app/updateEmail', 'UserController.updateEmail')
Route.put('/app/updatePassword', 'UserController.updatePassword')

Route.resource('legends', 'LegendController')
Route.resource('questions', 'QuestionController')
Route.resource('answers', 'AnswerController')
Route.resource('pulses', 'PulseController')
Route.resource('schools', 'SchoolController')
Route.resource('products', 'ProductController')
Route.resource('reviews', 'ReviewController')
Route.resource('coaches', 'CoachController')

// legend controller
Route.post('/uploadLegendPhotos', 'LegendController.uploadLegendPhotos')
Route.delete('/app/deleteImage', 'LegendController.deleteImage')
Route.get('/app/getAdditionlegendInfo/:id', 'LegendController.getAdditionlegendInfo')
Route.get('/app/getLegendId/:id', 'LegendController.getLegendId')

Route.get('/app/getTodayBussinessHour/:id', 'LegendController.getTodayBussinessHour')
Route.post('/app/similarQuestion', 'QuestionController.similar')
Route.post('/app/similar_coach_question', 'QuestionController.similar_coach_question')
Route.post('/app/similar_product_question', 'QuestionController.similar_product_question')
Route.post('/app/storeCoachanswers', 'AnswerController.storeCoachanswers')
Route.post('/app/storeProductanswers', 'AnswerController.storeProductanswers')
Route.get('/app/coach_question_answers/:id', 'AnswerController.coach_question_answers')
Route.get('/app/product_question_answers/:id', 'AnswerController.product_question_answers')

// Review Controller
Route.get('/app/atrributeConteptData/:id', 'ReviewController.atrributeConteptData')

Route.post('/app/upload-review-file', 'ReviewController.uploadReviewFile')
Route.post('/stoteReviewImo', 'ReviewController.stoteReviewImo')
Route.post('/stoteProductReviewImo', 'ReviewController.stoteProductReviewImo')
Route.get('/test', 'ReviewController.test')
Route.get('/app/getRecentReview', 'ReviewController.getRecentReview')
Route.get('/app/reviewOfTheDay', 'ReviewController.reviewOfTheDay')
Route.get('/app/getAllReview/:id', 'ReviewController.getAllReview')
Route.get('/app/getUserallReview/:id', 'ReviewController.getUserallReview')

// Search controller

Route.get('/app/SearchData', 'SearchController.SearchData')
Route.get('/app/SearchByKeyCoach', 'SearchController.SearchByKeyCoach')
Route.get('/app/SearchByKeyProduct', 'SearchController.SearchByKeyProduct')
Route.get('/app/SearchByKeyProduct', 'SearchController.SearchByKeyProduct')
Route.get('/app/SearchByKeySchool', 'SearchController.SearchByKeySchool')
Route.get('/app/SearchByKeySchoolCoach', 'SearchController.SearchByKeySchoolCoach')

// School --- Coaches
Route.get('/app/schoolcoach/:id', 'SchoolController.showSchoolCoach')
Route.get('/app/coachatrributeConteptData/:id', 'ReviewController.coachatrributeConteptData')
Route.get('/app/SchoolCoachReview/:id', 'ReviewController.SchoolCoachReviewShow')
Route.get('/app/singleSchoolCoachReview/:id', 'ReviewController.singleSchoolCoachReviewShow')
Route.post('/app/storeSchoolCoachReview', 'SchoolController.storeSchoolCoachReview')
Route.post('/app/storeSchoolCoache', 'SchoolController.storeSchoolCoache')
Route.post('/stoteCoachReviewImo', 'ReviewController.stoteCoachReviewImo')
Route.post('/storequestions', 'QuestionController.storequestions')
Route.post('/storeProductquestions', 'QuestionController.storeProductquestions')
Route.get('/app/CoachShow/:id', 'QuestionController.CoachShow')
Route.get('/app/productShow/:id', 'QuestionController.productShow')
Route.get('/app/getAdditionCoachInfo/:id', 'SchoolController.getAdditionCoachInfo')
Route.get('/app/getCoachTopReviews/:id', 'CoachController.getCoachTopReviews')
Route.get('/app/similar_coaches', 'CoachController.similar_coaches')
Route.get('/app/recentCitys', 'CoachController.recentCitys')
Route.get('/app/getSchoolcoaches', 'SchoolController.getSchoolcoaches')

// products
Route.get('/app/ProductReview/:id', 'ReviewController.ProductReview')
Route.get('/app/getAllUserProduct/:id', 'UserController.getAllUserProduct')
Route.get('/app/getAdditionProductInfo/:id', 'ProductController.getAdditionProductInfo')
Route.get('/app/productReviewInfo/:id', 'ProductController.productReviewinfo')
Route.post('/app/storeProductReview', 'ProductController.storeProductReview')
// test
Route.get('/pagenateData/:id', 'LegendController.paginatedata')

Route.get('app/initdata', 'UserController.initdata')
Route.any('*', 'NuxtController.render')

