$(document).ready ->

  #     M A I N     B A N N E R     S L I D E R

  home_slider = $('.main-slider-wrapper .slider').bxSlider
    controls: false
    speed: 750
    pause: 10000
    auto: true

  steps_slider = $('.steps-slider').bxSlider
    controls: false
    adaptiveHeight: true
    speed: 750
    pause: 10000
    infiniteLoop: false

  why_we_slider = $('.why-we-slider').bxSlider
    controls: false
    pager: false
    speed: 750
    pause: 5000
    auto: true
    mode: 'fade'