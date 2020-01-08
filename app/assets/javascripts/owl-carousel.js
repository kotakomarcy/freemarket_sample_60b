$(function(){
  $(".slide-banner.owl-carousel").owlCarousel({
    loop:true,
    nav:true,
    items:1,
    autoplay:true,
    autoplayTimeout:5000,
    autoplayHoverPause:true,
    smartSpeed: 1000
  });

  $('.slide-banner .owl-dot').hover(function(){
    $(this).click();
  }, function() {});
});