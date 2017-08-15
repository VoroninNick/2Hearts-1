$(document).ready(function(){
  
  //Check to see if the window is top if not then display button
  $(window).scroll(function(){
    if ($(this).scrollTop() > 1000) {
      $('.scrollBtn').fadeIn();
    } else {
      $('.scrollBtn').fadeOut();
    }
  });
  
  //Click event to scroll to top
  $('.scrollBtn').click(function(){
    $('html, body').animate({scrollTop : 0},800);
    return false;
  });
  
});