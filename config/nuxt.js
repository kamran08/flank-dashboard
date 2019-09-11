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
   baseURL: 'https://goflank.com/'
   
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
    '~plugins/ivuew',
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
      // { rel: 'stylesheet', href: 'https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css' }
      { rel: 'stylesheet', href: 'https://use.fontawesome.com/releases/v5.7.2/css/all.css' },
      { rel: 'stylesheet', href: '/css/custom-plugin.css' },
      { rel: 'stylesheet', href: '/css/owl.carousel.min.css' },
      { rel: 'stylesheet', href: '/css/owl.theme.default.min.css' },

     
      { rel: 'stylesheet', href: '/css/style.css' },
      { rel: 'stylesheet', href: '/css/style_one.css' },
      { rel: 'stylesheet', href: '/css/new_style.css' },
      { rel: 'stylesheet', href: '/css/new.css' },
      { rel: 'stylesheet', href: '/css/responsive.css' }

    ],
    script: [
      { src: '/js/plugin-js/jquery-1.12.0.min.js' },
      { src: '/js/plugin-js/owl.carousel.min.js' },
      { src: '/js/plugin-js/custom.js' },
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
