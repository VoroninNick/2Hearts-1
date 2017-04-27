$(document).ready ->

  main_banner = $('.main-banner')
  main_banner.addClass('animated')

  play1 = $('#play-btn').drawsvg({duration: 1000})
  setTimeout (->
    play1.drawsvg('animate')
  ), 1800

  project_one_banner = $('.project-one-banner')
  project_one_banner.addClass('animated')

  play2 = $('#play-btn-project').drawsvg({duration: 1000})
  setTimeout (->
    play2.drawsvg('animate')
  ), 100