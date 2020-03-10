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


// Home Routes

Route.post('/app/emailSubscription', 'HomeController.storeEmailSubscription')
Route.post('/login', 'HomeController.userLogin').middleware(['guest'])
Route.get('/logout', 'HomeController.logout')

// Profile
Route.get('/app/user', 'AdminController.indexUser')
Route.put('/app/user', 'AdminController.updateUser')

// Hours

Route.get('/app/hours', 'AdminController.indexHours')
Route.put('/app/hours', 'AdminController.updateHours')
// Hours

Route.get('/app/schedules', 'AdminController.indexSchedules')
Route.delete('/app/schedules', 'AdminController.deleteSchedules')
// Bussniess Info

Route.get('/app/bussniess', 'AdminController.indexBussniess')
Route.post('/app/bussniess', 'AdminController.storeBussniess')
Route.put('/app/bussniess', 'AdminController.updateBussniess')
Route.delete('/app/bussniess', 'AdminController.deleteBussniess')


// Imames

Route.get('/app/legend_images', 'AdminController.indexLegendImages')
Route.post('/app/upload-review-file', 'AdminController.storeLegendImages')
Route.delete('/app/legend_images', 'AdminController.deleteLegendImages')
Route.get('/all-time-setting', 'AdminController.getAlltimesetting')
Route.get('/get-all-time-slot', 'AdminController.createTimeslot')
Route.post('/store-all-time-setting', 'AdminController.storeAllTimeSetting')
Route.post('/create-new-booking', 'AdminController.newBooking')
// Upload Photos
//Route.post('/app/upload-review-file', 'HomeController.uploadReviewFile')


Route.get('app/initdata', 'HomeController.initdata')
Route.any('*', 'NuxtController.render')

