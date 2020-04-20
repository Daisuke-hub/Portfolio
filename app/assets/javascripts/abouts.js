// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(function() {
  $('#about_move').on('click',function(){
    $('body, html').animate({
      scrollTop:600
    }, 600);
    return false;
  });
});
