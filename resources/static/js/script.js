'use strict';

function randomImage() {
    var randomNumber = Math.floor(Math.random()*2);
    var element = document.getElementsByClassName('mainHeader');
    console.log(element);
    var images = ['/image/header_0.jpg', '/image/header_1.jpg'];
    var size = images.length;
    var x = Math.floor(size * Math.random());
    console.log(x);
    var element = document.getElementsByClassName('mainHeader');
    console.log(element);
    element[0].style["background-image"] = "url("+ images[x] + ")";
}
document.addEventListener("DOMContentLoaded", randomImage);