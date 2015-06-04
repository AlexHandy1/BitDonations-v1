$(document).ready(function(){
  $('.project').hover(function (){
    $(this).animate({zoom: 1.4});
  }, function() {
    $(this).animate({zoom: 1});
  });
});