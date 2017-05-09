$document.ready ->

  popup_wrap = $('.popup-wrapper')
  close_popup = $('.popup-wrapper .close-popup')
  share_button = $('.share-button')
  subscribe_button = $('.subscribe-button')
  share_text = $('.share-block')
  subscribe_text = $('.subscribe-block')

  share_button.on 'click', ->
    popup_wrap.addClass('share')
  subscribe_button.on 'click', ->
    popup_wrap.addClass('subscribe')

  close_popup.on 'click', ->
    popup_wrap.removeClass('share subscribe')