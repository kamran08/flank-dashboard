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



Route.get('app/initdata', 'HomeController.initdata')
Route.any('*', 'NuxtController.render')

