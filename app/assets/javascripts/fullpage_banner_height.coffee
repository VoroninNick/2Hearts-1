$(document).on "ready", ->

  $('.main-banner').css('height', height + 'px')
  $('.main-banner .top-part, .main-banner .bottom-part').css('height', height/2 + 'px')
  $('.main-banner .top-part').css('padding-top', height/4 + 'px')
  
  if width > 640

    $(window).on "orientationchange", ->
      #     S E T     F U L L P A G E     B A N N E R     H E I G H T
      height = $(window).height()
      $('.main-banner').css('height', height + 'px')
      $('.main-banner .top-part, .main-banner .bottom-part').css('height', height/2 + 'px')
      $('.main-banner .top-part').css('padding-top', height/4 + 'px')
