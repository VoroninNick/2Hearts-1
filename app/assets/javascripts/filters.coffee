$document.ready ->

  if width < 640
    list = $('.filter-list')
    $('.filter').on "click", (e)->
      if list.hasClass('opened')
        list.removeClass('opened')
      else
        list.addClass('opened')

      $(this).prependTo('.filter-list')