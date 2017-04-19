$document.on 'click', '.hamburger', ->

  hamburger = $('.hamburger')

  if body.hasClass('menu-opened')
    hamburger.removeClass('is-active')
    body.removeClass('menu-opened')
  else
    hamburger.addClass('is-active')
    $('body').addClass('menu-opened')