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
                                                                [['users.store'], ['StoreUser']],
                                                                // [['users.update'], ['UpdateUser']]
                                                            ]))
Route.post('/authentication/login', 'UserController.userLogin').middleware(['guest'])
Route.get('/logout', 'UserController.logout')
Route.get('/password/email', 'UserController.sendResetLinkEmail')

Route.resource('legends', 'LegendController')
Route.post('/uploadLegendPhotos', 'LegendController.uploadLegendPhotos')
Route.resource('reviews', 'ReviewController')
Route.post('/app/upload-review-file', 'ReviewController.uploadReviewFile')


Route.get('app/initdata', 'UserController.initdata')
Route.any('*', 'NuxtController.render')

