$(document).ready ->

  main_banner = $('.main-banner')
  main_banner.addClass('test')

  mySVG = $('#play-btn').drawsvg({duration: 1000})
  setTimeout (->
    mySVG.drawsvg('animate')
  ),1800