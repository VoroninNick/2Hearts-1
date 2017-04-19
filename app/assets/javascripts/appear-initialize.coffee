$document.ready ->

  appeared = $('.appeared')

  appeared.appear()

  appeared.on "appear", ()->
    $(this).addClass("animate")