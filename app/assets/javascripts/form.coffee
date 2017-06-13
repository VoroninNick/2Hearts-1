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
      alert("success")
  )