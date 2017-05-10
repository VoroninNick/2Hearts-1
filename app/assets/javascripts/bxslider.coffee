$(document).ready ->

  #     M A I N     B A N N E R     S L I D E R

  home_slider = $('.main-slider-wrapper .slider').bxSlider
    controls: false
    # adaptiveHeight: true
    speed: 750
    pause: 10000
    auto: true

  steps_slider = $('.steps-slider').bxSlider
    controls: false
    adaptiveHeight: true
    speed: 750
    pause: 10000
    infiniteLoop: false