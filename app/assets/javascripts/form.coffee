$document.on "submit", ".ajax-form", (e)->
  e.preventDefault()
  $(this).ajaxSubmit(
    error: ()->
      alert("error")
    success: ()->
      alert("success")
  )