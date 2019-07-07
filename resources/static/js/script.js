'use strict'

// function randomImage () {
//   var randomNumber = Math.floor(Math.random() * 2)
//   var element = document.getElementsByClassName('mainHeader')
//   console.log(element)
//   var images = ['/image/header_0.jpg', '/image/header_1.jpg']
//   var size = images.length
//   var x = Math.floor(size * Math.random())
//   console.log(x)
//   var element = document.getElementsByClassName('mainHeader')
//   console.log(element)
//   element[0].style['background-image'] = 'url(' + images[x] + ')'
// }
//document.addEventListener('DOMContentLoaded', randomImage)

$(document).ready(function () {
  // $('.inner-button-main').toggleClass('inner-button-main-full')
  // $('.inner-button-main').first().toggleClass('active-header-1').toggleClass('inner-button-main-full')
  // $('.inner-dropdown').first().slideDown().toggleClass('openAccordion-1')

  // $('.inner-button-main').click(function () {
  //   if ($(this).is('.inner-button-main-full')) {
  //     $('.active-header-1').toggleClass('active-header-1').toggleClass('inner-button-main-full').next().slideToggle().toggleClass('openAccordion-1')
  //     $(this).toggleClass('active-header-1').toggleClass('inner-button-main-full')
  //     $(this).next().slideToggle().toggleClass('openAccordion-1')
  //   } else {
  //     $(this).toggleClass('active-header-1').toggleClass('inner-button-main-full')
  //     $(this).next().slideToggle().toggleClass('openAccordion-1')
  //   }
  // })

    $('.sidebar-action').click(function () { 
      $(this).parent('.sidebar').toggleClass('sidebar-transform')
    });

    $('.main-list-mobile').addClass('add-active-list')
    $('.mobile-nav-button button').click(function () {
      $('.main-list-mobile.add-active-list').slideToggle()
    });

  $('.mobile-dropdown').addClass('add-active-mobile-list')
  $('.main-list-link a').click(function (e) {
    e.preventDefault()
    $(this).siblings('.mobile-dropdown.add-active-mobile-list').slideToggle()
  });
});
