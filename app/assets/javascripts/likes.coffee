init_likes = ()->
  $containers = $("div.likes-wrap:not(.likes-initialized)")
  if $containers.length
    $page = $(".resource-page")
    resource_type = $page.attr("data-resource-type")
    id = $page.attr("data-id")
    url = "/likes-count/#{resource_type}/#{id}.json"

    $.ajax(
      url: url
      type: "get"
      dataType: "json"
      success: (data)->
        #console.log "init_likes.success: args: ", arguments
        render_likes(data.likes_count, $containers, is_liked())
    )

is_liked = ()->
  $page = $(".resource-page")
  id = parseInt($page.attr("data-id"))
  resource_type = $page.attr("data-resource-type")
  liked_ids = Cookies.get("liked_#{resource_type}_ids") || []
  liked = liked_ids.includes(id)
  liked


render_likes = (likes_count, $containers, liked)->
  $containers.each(
    ()->
      $container = $(this)
      $container.addClass("likes-initialized")
      str = svg_images.heart + "<span>#{likes_count}</span>"
      likes_class = "likes"
      likes_class += " liked" if liked
      title_str = ""
      title_str = " title='Вже лайкнули'" if liked
      str = "<div class='#{likes_class}'#{title_str}>#{str}</div>"
      $container.html(str)
  )

init_likes()

$document.on "click", ".likes", ()->
  $likes = $(this)
  return if $likes.hasClass("liked")
  $page = $(".resource-page")
  resource_type = $page.attr("data-resource-type")
  id = parseInt($page.attr("data-id"))
  $span = $likes.find("span")
  val = parseInt($span.text())
  $span.text(val + 1)

  liked_ids = Cookies.get("liked_#{resource_type}_ids") || []
  liked = liked_ids.includes(id)
  if !liked
    liked_ids.push(id)
  Cookies.set("liked_#{resource_type}_ids", liked_ids)
  $(".likes").addClass("liked")
  $(".likes").attr("title", "Вже лайкнули")
  Cookies.set('name', 'value');
  url = "/like/#{resource_type}/#{id}"
  $.post(url)