$lg = $('.animated-thumbnails');
$lg.lightGallery(oOptions);
$lg.on('onAfterOpen.lg',function(event){
    $('.lg-toolbar').append('<a class=\"lg-icon\" href=\"javascript:toggleCaption()\">CC</a>');
});

function toggleCaption() {
    var curVal = $('.lg-sub-html').css('visibility');
    $('.lg-sub-html').css('visibility', curVal == 'hidden' ? 'visible' : 'hidden');
}