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

// legend controller
Route.post('/uploadLegendPhotos', 'LegendController.uploadLegendPhotos')
Route.delete('/app/deleteImage', 'LegendController.deleteImage')
Route.get('/app/getAdditionlegendInfo/:id', 'LegendController.getAdditionlegendInfo')
Route.get('/app/getTodayBussinessHour/:id', 'LegendController.getTodayBussinessHour')
Route.post('/app/similarQuestion', 'QuestionController.similar')

// Review Controller
Route.get('/app/atrributeConteptData/:id', 'ReviewController.atrributeConteptData')
Route.post('/stoteReviewImo', 'ReviewController.stoteReviewImo')
Route.post('/app/upload-review-file', 'ReviewController.uploadReviewFile')
Route.get('/test', 'ReviewController.test')
Route.get('/app/getAllReview/:id', 'ReviewController.getAllReview')
Route.resource('reviews', 'ReviewController')
// Search controller

Route.get('/app/SearchData', 'SearchController.SearchData')

// test
Route.get('/pagenateData/:id', 'LegendController.paginatedata')

Route.get('app/initdata', 'UserController.initdata')
Route.any('*', 'NuxtController.render')

