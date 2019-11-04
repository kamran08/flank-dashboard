'use strict'

/** @type {import('@adonisjs/lucid/src/Schema')} */
const Schema = use('Schema')

class LegendScheduleSchema extends Schema {
  up () {
    this.create('legend_schedules', (table) => {
      table.increments()
      table.timestamps()
    })
  }

  down () {
    this.drop('legend_schedules')
  }
}

module.exports = LegendScheduleSchema
