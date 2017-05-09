$(document).on "ready", ->

  $('.main-banner').css('height', height + 'px')
  console.log(height)

  if width > 640

    $(window).on "orientationchange", ->
      #     S E T     F U L L P A G E     B A N N E R     H E I G H T
      height = $(window).height()
      console.log(height)
      $('.main-banner').css('height', height + 'px')