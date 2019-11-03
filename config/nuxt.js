'use strict'

const resolve = require('path').resolve
// const webpack = require('webpack')
module.exports = {
  /*
  ** Headers of the page
  */

  modules: [
    '@nuxtjs/axios'

    // With options

  ],

  axios: {
   // baseURL: 'https://dashboard.goflank.com/'

  },
  // build: {
  //   plugins: [
  //     new webpack.ProvidePlugin({

  //       '_': 'lodash'
  //       // ...etc.
  //     })
  //   ]
  // },
  plugins: [
    '~plugins/vuecommon',
    { src: '~plugins/ivuew', ssr: false },
    '~plugins/googlechart'
    // {src: '~plugins/clickout', ssr: false},
  ],
  head: {
    title: 'Go Flank',
    meta: [
      {
        charset: 'utf-8'
      },
      {
        name: 'viewport',
        content: 'width=device-width, initial-scale=1'
      },
      {
        hid: 'description',
        name: 'description',
        content: 'Adonuxt project'
      }
    ],
    link: [
      {
        rel: 'icon',
        type: 'image/x-icon',
        href: 'favicon.ico'
      },
      { rel: 'stylesheet', href: 'https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css' },
      { rel: 'stylesheet', href: 'https://use.fontawesome.com/releases/v5.7.2/css/all.css' },

      { rel: 'stylesheet', href: '/css/main.css' }

    ],
    script: [
      { src: '/js/script.js' }
    ]

  },
  /*
  ** Global CSS
  */
  css: [

  ],
  /*
  ** Customize the progress-bar color
  */
  loading: { color: 'orange' },
  /*
  ** Point to resources
  */
  srcDir: resolve(__dirname, '..', 'resources')
}
