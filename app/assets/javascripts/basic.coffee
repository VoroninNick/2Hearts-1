page_loaded_handler = ()->
#  setTimeout ()->
#    $('#loader-wrapper').fadeOut(
#      complete: ()->
#        # run some animations
#        #$.force_appear()
#        #$window.trigger("after_preloader")
#    )
#  , 100

window.addEventListener('load', page_loaded_handler)