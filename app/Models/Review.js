'use strict'

/** @type {typeof import('@adonisjs/lucid/src/Lucid/Model')} */
const Model = use('Model')

class Review extends Model {
    reviwer(){
        return this.belongsTo('App/Models/User', 'reviwer_id')
    }
    reviewfor() {
        return this.belongsTo('App/Models/Legend', 'reviewFor')
    }
    images(){
        return this.hasMany('App/Models/ReviewImage', 'id', 'review_id')
    }
    imos(){

        return this.hasMany('App/Models/Reviewimo', 'id', 'review_id')
    }
    // imos(){

    //     return this.hasMany('App/Models/Reviewimo', 'id', 'review_id').select('imo').count('imo as total').groupBy('imo')
    // }
}

module.exports = Review
