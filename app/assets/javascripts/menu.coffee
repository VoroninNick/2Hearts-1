menu_bg = $('.menu-wrapper .img-bg')

$document.on 'click', '.hamburger', ->

  number = Math.floor(Math.random() * 3)
  menu_bg.eq(number).addClass('visible')

  hamburger = $('.hamburger')

  if body.hasClass('menu-opened')
    menu_bg.removeClass('visible')
    hamburger.removeClass('is-active')
    body.removeClass('menu-opened')
  else
    hamburger.addClass('is-active')
    $('body').addClass('menu-opened')