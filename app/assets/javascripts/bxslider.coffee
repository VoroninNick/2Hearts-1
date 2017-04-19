$(document).ready ->

  #     M A I N     B A N N E R     S L I D E R

  home_slider = $('.main-slider-wrapper .slider').bxSlider
    controls: false
    # pager: false
    adaptiveHeight: true
    speed: 750
    pause: 10000
    auto: true

#     #     P R O J E C T S     S L I D E R 

#     projects_slider = $('.projects-slider').bxSlider
#         controls: false
#         pagerCustom: '#bx-pager-projects'
#         infiniteLoop: true
#         hideControlOnEnd: true
#         speed: 750
#         pause: 10000
#         auto: true
#         infiniteLoop: true
#         onSlideBefore: ($slideElement, oldIndex, newIndex)->
#             current = projects_slider.getCurrentSlide()
#             $('.project-info .description-text').removeClass('visible')
#             $('.project-info .description-text').eq(current).addClass('visible')
#     $('.projects-container .arrow-left').click ->
#         current = projects_slider.getCurrentSlide()
#         projects_slider.goToPrevSlide(current) - 1
#     $('.projects-container .arrow-right').click ->
#         current = projects_slider.getCurrentSlide()
#         projects_slider.goToNextSlide(current) + 1

#     #     P R O J E C T     O N E     S L I D E R

#     $blockWidth = $('.project-one-slider-container .slide-width').width()
#     project_one_slider = $('.project-one-slider').bxSlider
#         controls: false
#         pager: false
#         infiniteLoop: true
#         hideControlOnEnd: true
#         speed: 750
#         pause: 10000
#         auto: true
#         infiniteLoop: true
#         minSlides: 2
#         maxSlides: 5
#         slideWidth: $blockWidth
#         slideMargin: 10
#     if project_one_slider.getSlideCount
#         $('.slider-custom-pager .total-slides span').text((project_one_slider.getSlideCount()))
#     $('.project-one-slider-container .arrow-left').click ->
#         project_one_slider.goToPrevSlide()
#     $('.project-one-slider-container .arrow-right').click ->
#         project_one_slider.goToNextSlide()

#     #     A B O U T     S L I D E R

#     about_slider = $('.about-slider').bxSlider
#         controls: false
#         pager: false
#         infiniteLoop: true
#         hideControlOnEnd: true
#         speed: 750
#         pause: 10000
#         auto: true
#         infiniteLoop: true
#         onSlideBefore: ($slideElement, oldIndex, newIndex)->
#             current = about_slider.getCurrentSlide()
#             $('.about-slider-container .description-text').removeClass('visible')
#             $('.about-slider-container .description-text').eq(current).addClass('visible')
#     $('.about-slider-controls .arrow-left').click ->
#         current = about_slider.getCurrentSlide()
#         about_slider.goToPrevSlide(current) - 1
#     $('.about-slider-controls .arrow-right').click ->
#         current = about_slider.getCurrentSlide()
#         about_slider.goToNextSlide(current) + 1