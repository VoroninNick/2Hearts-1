$(document).ready ->

  target_text = $('.background-text')
  target_text.each(->
    count = $(this).text().length
    font_size = width / count
    $(this).css('font-size',font_size)
  )