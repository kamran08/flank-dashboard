'use strict'

/** @type {typeof import('@adonisjs/lucid/src/Lucid/Model')} */
const Model = use('Model')

class Review extends Model {
    reviwer(){
        return this.belongsTo('App/Models/User', 'reviwer_id')
    }
}

module.exports = Review
