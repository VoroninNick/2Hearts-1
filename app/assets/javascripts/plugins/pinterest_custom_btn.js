var pinOneButton = document.querySelector('.pinterest-btn');
pinOneButton.addEventListener('click', function(e) {
    PinUtils.pinOne({
        media: e.target.getAttribute('data-media'),
        description: e.target.getAttribute('data-description')
    });
});