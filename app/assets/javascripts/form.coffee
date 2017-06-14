show_message_success = ()->
  $('.popup-wrapper').removeClass('share subscribe order resume question')
  $('.popup-wrapper').addClass('success')

$document.on "submit", ".ajax-form", (e)->
  e.preventDefault()
  url = $(this).attr("action")
  if $(this).hasClass("vacancy-form")
    url = url + "/" + $(this).attr("data-vacancy-id")
  $(this).ajaxSubmit(
    url: url
    error: ()->
      alert("error")
    success: ()->
      return show_message_success()
  )