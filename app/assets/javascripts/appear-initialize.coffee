$document.ready ->

  appeared = $('.appeared, .slide-up')

  appeared.appear()

  appeared.on "appear", ()->
    $(this).addClass("animate")