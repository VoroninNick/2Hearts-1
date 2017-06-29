$document.on 'click', '.pinterest-btn', ()->
  $button = $(this)
  PinUtils.pinOne({
    media: $button.attr('data-media')
    description: $button.attr('data-description')
  })

