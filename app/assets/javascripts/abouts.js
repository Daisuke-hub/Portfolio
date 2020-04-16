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

// $(function(){
//     $("#top_back").animate({
//         "opacity": 0
//     }).setTimeout(function(){
//         this.animate({
//             "opacity": "1"
//         });
//     },1000);
// });

// $(function() {
//     $(".about_head").on("click",function(){
//         $(".about_head, .about_body").animate({
//             "opacity": 0
//         });
//     });
// });