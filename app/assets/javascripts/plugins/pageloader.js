// E X A M P L E S

// STAGGER
// TweenMax.staggerFrom(box, 1, {opacity:0, scale:0, ease:Power1.easeOut}, 0.2)
//
// CALLBACK
// TweenMax.to(box, 1, {x: 0, opacity: 1, ease:Power1.easeOut, onComplete:complete})
// function complete(){
//     alert('all done');
// }
// TIMELINE LITE
// var tl = new TimelineLite();
// tl.from(title_line, 1, {width:0, ease:Power1.easeOut, delay:1}, "-=0.5")
// .from(title_line, 1, {width:0, ease:Power1.easeOut, delay:1}, "feature")
// .from(title_line, 1, {width:0, ease:Power1.easeOut, delay:1}, "feature")



// IIFE - Immediately Invoked Function Expression
(function(yourcode) {

        // The global jQuery object is passed as a parameter
        yourcode(window.jQuery, window, document);

    }(function($, window, document) {

        // The $ is now locally scoped

        // Listen for the jQuery ready event on the document
        $(function() {

            // The DOM is ready!

            if ($('.bcg').length) {
                // number of loaded images for preloader progress
                var loadedCount = 0; //current number of images loaded
                var imagesToLoad = $('.bcg').length; //number of slides with .bcg container
                var loadingProgress = 0; //timeline progress - starts at 0

                $('.bcg').imagesLoaded({
                    background: true
                }).progress(function (instance, image) {
                    loadProgress();
                });

                function loadProgress(imgLoad, image) {
                    //one more image has been loaded
                    loadedCount++;

                    loadingProgress = (loadedCount / imagesToLoad);

                    // GSAP tween of our progress bar timeline
                    TweenLite.to(progressTl, 0.7, {progress: loadingProgress, ease: Linear.easeNone});
                }


                //progress timeline
                var progressTl = new TimelineMax({
                    paused: true,
                    onUpdate: progressUpdate,
                    onComplete: loadComplete
                });

                progressTl
                //tween the progress bar width
                    .to($('.progress span'), 1, {width: 100, ease: Linear.easeNone});

                //as the progress bar width updates and grows we put the percentage loaded in the screen
                function progressUpdate() {
                    //the percentage loaded based on the tween's progress
                    loadingProgress = Math.round(progressTl.progress() * 100);

                    //we put the percentage in the screen
                    $(".txt-perc").text(loadingProgress + '%');

                }


                // hide preloader
                function loadComplete() {

                    // preloader out
                    var preloaderOutTl = new TimelineMax();
                    preloaderOutTl
                        .to($('.logo'), 0.3, {y: -70, autoAlpha: 0, ease: Back.easeIn})
                        .to($('.text'), 0.3, {y: -50, autoAlpha: 0, ease: Back.easeIn})
                        .to($('.progress'), 0.3, {autoAlpha: 0, ease: Back.easeIn})
                        .to($('.txt-perc'), 0.3, {autoAlpha: 0, ease: Back.easeIn}, 0.1)
                    setTimeout(function () {
                        $('#loader-wrapper').fadeOut();
                    }, 500);
                }
            } else {
                $('#loader-wrapper').fadeOut();
            }




        });

        // The rest of the code goes here!
        // console.log("DOM is not ready!");

    })
);