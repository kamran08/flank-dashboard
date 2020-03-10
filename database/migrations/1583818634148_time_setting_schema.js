'use strict'

/** @type {import('@adonisjs/lucid/src/Schema')} */
const Schema = use('Schema')

class TimeSettingSchema extends Schema {
  up () {
    this.create('time_settings', (table) => {
      table.increments()
      table.timestamps()
    })
  }

  down () {
    this.drop('time_settings')
  }
}

module.exports = TimeSettingSchema
