$(document).ready ->

  target_text = $('.background-text')
  target_text.each(->
    count = $(this).text().length
    font_size = width / count
    $('.background-text').css('font-size',font_size)
  )