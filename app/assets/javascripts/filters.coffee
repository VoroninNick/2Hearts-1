$document.ready ->

  if width < 640
    list = $('.filter-container')
    $('.filter').on "click", (e)->
      if list.hasClass('opened')
        list.removeClass('opened')
      else
        list.addClass('opened')

      $(this).prependTo('.filter-container')



$document.on 'click', '.filter-container .filter', ()->

  $(this).parent().children().removeClass("active")
  $(this).addClass("active")
  tag_ids = $(this).closest(".filter-container").find(".filter.active").map(
    ()->
      $(this).attr("data-tag-id")
  ).toArray()

  if !tag_ids.length
    $(".blog-block.hide, .project-block.hide").removeClass("hide")
    return

  $articles = $('.blog-block, .project-block')
  $articles_to_show = $articles.filter(
    ()->
      article_tag_ids = $(this).attr("data-tag-ids").split(',')
      matched = false
      for id in article_tag_ids
        matched = true if tag_ids.indexOf(id) >= 0

      matched
  )

  $articles.addClass('hide')

  $articles_to_show.removeClass('hide')