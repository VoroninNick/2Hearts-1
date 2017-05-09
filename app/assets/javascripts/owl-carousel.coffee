$document.ready ->

  $('.owl-carousel-portfolio').owlCarousel(
    nav: true
    items: 1
    margin: 10
    responsive:
      640:
        items: 2
        margin: 20
      1024:
        margin: 30
      1200:
       items: 4
       margin: 40
  )

  $('.owl-carousel-team, .blog-carousel').owlCarousel(
    nav: true
    loop: true
    items: 1
    margin: 20
    responsive:
      640:
        items: 2
      1024:
        margin: 30
      1200:
        items: 3
        margin: 40
      1400:
        items: 4
  )