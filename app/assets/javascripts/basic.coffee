page_loaded_handler = ()->
  #$('body').addClass('loaded');
  setTimeout ()->
    $('#loader-wrapper').fadeOut(
      complete: ()->
        # run some animations
        #$.force_appear()
        #$window.trigger("after_preloader")
    )
  , 2000


window.addEventListener('load', page_loaded_handler)