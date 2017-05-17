open_tab = (e, set_hash = true)->

    if e
      e.preventDefault()


    
    $this = $(this)

    #     b u t t o n

    if $this.hasClass('opened')
        $this.removeClass('opened')
        if set_hash
          window.location.hash = ""
    else
        $this.siblings().removeClass('opened')
        $this.addClass('opened')
        if set_hash
          window.location.hash = "##{$this.attr("id")}"


  
    #     a c c o r d i o n

    if $this.next().hasClass('show')
        $this.next().removeClass('show')
        $this.next().slideUp(350)
    else
        $this.parent().parent().find('.accordion-inner').removeClass('show')
        $this.parent().parent().find('.accordion-inner').slideUp(350)
        $this.next().toggleClass('show')
        $this.next().slideToggle(350)


$document.on "ready", ()->
  hash = window.location.hash
  if !hash.length || hash == "#"
    return

  if hash[0] == "#"
    hash = hash.substr(1, hash.length)

  $button = $(".accordion-button[id='#{hash}']")

  if $button.length
    #$button.addClass("opened")
    #$button.next().removeClass('show')
    #$button.next().slideUp(350)
    open_tab.call($button, null, false)

$document.on 'click', '.accordion-button', open_tab