$document.ready ->

  popup_wrap = $('.popup-wrapper')
  close_popup = $('.popup-wrapper .close-popup')

  share_button = $('.share-button')
  subscribe_button = $('.subscribe-button')
  order_button = $('.order-button')
  question_button = $('.question-button')
  resume_button = $('.send-resume')

  share_text = $('.share-block')
  subscribe_text = $('.subscribe-block')
  order_form = $('.order-form')
  resume_wrap = $('.resume-form')
  question_form = $('.question-form')


  share_button.on 'click', ->
    popup_wrap.addClass('share')

  subscribe_button.on 'click', ->
    popup_wrap.addClass('subscribe')
  order_button.on 'click', ->
    popup_wrap.addClass('order')
  question_button.on 'click', ->
    popup_wrap.addClass('question')
  resume_button.on 'click', ->
    popup_wrap.addClass('resume')
    popup_wrap.find(".vacancy-form").attr("data-vacancy-id", $(this).attr("data-vacancy-id"))


  close_popup.on 'click', ->
    popup_wrap.removeClass('share subscribe order resume question success')