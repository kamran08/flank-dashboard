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

Route.resource('legends', 'LegendController')
Route.resource('questions', 'QuestionController')
Route.resource('answers', 'AnswerController')
Route.resource('pulses', 'PulseController')
Route.resource('schools', 'SchoolController')
Route.resource('products', 'ProductController')

// legend controller
Route.post('/uploadLegendPhotos', 'LegendController.uploadLegendPhotos')
Route.delete('/app/deleteImage', 'LegendController.deleteImage')
Route.get('/app/getAdditionlegendInfo/:id', 'LegendController.getAdditionlegendInfo')
Route.get('/app/getLegendId/:id', 'LegendController.getLegendId')

Route.get('/app/getTodayBussinessHour/:id', 'LegendController.getTodayBussinessHour')
Route.post('/app/similarQuestion', 'QuestionController.similar')
Route.post('/app/similar_coach_question', 'QuestionController.similar_coach_question')
Route.post('/app/storeCoachanswers', 'AnswerController.storeCoachanswers')
Route.get('/app/coach_question_answers/:id', 'AnswerController.coach_question_answers')

// Review Controller
Route.get('/app/atrributeConteptData/:id', 'ReviewController.atrributeConteptData')

Route.post('/app/upload-review-file', 'ReviewController.uploadReviewFile')
Route.post('/stoteReviewImo', 'ReviewController.stoteReviewImo')
Route.get('/test', 'ReviewController.test')
Route.get('/app/getAllReview/:id', 'ReviewController.getAllReview')
Route.resource('reviews', 'ReviewController')
// Search controller

Route.get('/app/SearchData', 'SearchController.SearchData')
Route.get('/app/SearchByKeyCoach', 'SearchController.SearchByKeyCoach')
Route.get('/app/SearchByKeySchool', 'SearchController.SearchByKeySchool')
Route.get('/app/SearchByKeySchoolCoach', 'SearchController.SearchByKeySchoolCoach')

// School --- Coaches
Route.get('/app/schoolcoach/:id', 'SchoolController.showSchoolCoach')
Route.get('/app/coachatrributeConteptData/:id', 'ReviewController.coachatrributeConteptData')
Route.get('/app/SchoolCoachReview/:id', 'ReviewController.SchoolCoachReviewShow')
Route.post('/app/storeSchoolCoachReview', 'SchoolController.storeSchoolCoachReview')
Route.post('/app/storeSchoolCoache', 'SchoolController.storeSchoolCoache')
Route.post('/stoteCoachReviewImo', 'ReviewController.stoteCoachReviewImo')
Route.post('/storequestions', 'QuestionController.storequestions')
Route.get('/app/CoachShow/:id', 'QuestionController.CoachShow')
Route.get('/app/getAdditionCoachInfo/:id', 'SchoolController.getAdditionCoachInfo')

// test
Route.get('/pagenateData/:id', 'LegendController.paginatedata')

Route.get('app/initdata', 'UserController.initdata')
Route.any('*', 'NuxtController.render')

