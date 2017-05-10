$document.ready ->

  popup_wrap = $('.popup-wrapper')
  close_popup = $('.popup-wrapper .close-popup')
  share_button = $('.share-button')
  subscribe_button = $('.subscribe-button')
  order_button = $('.order-button')
  share_text = $('.share-block')
  subscribe_text = $('.subscribe-block')
  order_form = $('.order-form')

  share_button.on 'click', ->
    popup_wrap.addClass('share')
  subscribe_button.on 'click', ->
    popup_wrap.addClass('subscribe')
  order_button.on 'click', ->
    popup_wrap.addClass('order')

  close_popup.on 'click', ->
    popup_wrap.removeClass('share subscribe order')