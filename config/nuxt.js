'use strict'

const resolve = require('path').resolve
//const webpack = require('webpack')
module.exports = {
  /*
  ** Headers of the page
  */
  modules: [
    '@nuxtjs/axios',
    '@nuxtjs/bootstrap-vue',
    // With options
    ['@nuxtjs/bootstrap-vue', { css: false }]
  ],
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
    '~plugins/ivuew'
    // {src: '~plugins/clickout', ssr: false},
   ],
  head: {
    title: 'Adonuxt',
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
      }
      // { rel: 'stylesheet', href: 'https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css' }
    ],
    script: [
      { src: 'https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js' }
    ]
    
  },
  /*
  ** Global CSS
  */
  css: [
    '~assets/css/main.css',
  ],
  /*
  ** Customize the progress-bar color
  */
  loading: { color: '#744d82' },
  /*
  ** Point to resources
  */
  srcDir: resolve(__dirname, '..', 'resources')
}
