$document.ready ->

  $('.owl-carousel-portfolio').owlCarousel(
    nav: true
    items: 1
    margin: 10
    responsive:
      640:
        items: 3
        margin: 20
      1024:
        margin: 30
      1200:
       items: 4
       margin: 40
  )

  $('.owl-carousel-team').owlCarousel(
    nav: true
    loop: true
    center: true
    items: 1
    margin: 20
    responsive:
      640:
        items: 3
      1024:
        margin: 30
      1200:
       items: 4
       margin: 40
  )