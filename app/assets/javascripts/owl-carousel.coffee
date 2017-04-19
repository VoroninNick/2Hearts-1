$document.ready ->

  $('.owl-carousel-portfolio').owlCarousel(
    margin: 10
    nav: true
    # autoWidth: true
    items: 1
    responsive:
      640:
        items: 4
        margin: 40
  )

  $('.owl-carousel-team').owlCarousel(
    loop: true
    nav: true
    autoWidth: true
    center: true
    margin: 20
  )