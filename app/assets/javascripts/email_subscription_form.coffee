$document.on "submit", ".email-subscription-form", (e)->
  e.preventDefault()
  alert("Thanks. You successfully subscribed on email notifications")
  data = $(this).serializeArray()
  url = $(this).attr("action")
  $.ajax({
    type: "post"
    url: url
    data: data
  })
