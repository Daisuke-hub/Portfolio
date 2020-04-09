// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(function() {
    $('#about_move').on('click',function(){
        $('body, html').animate({
        scrollTop:600
        }, 600);
        return false;
        // $(window).scrollTop(600);
    });
});

$(function() {
    $('#about_bottom').on('click',function(){
        $('body, html').animate({
        scrollTop:0
        }, 600);
        return false;
        // $(window).scrollTop(600);
    });
});

// $(function() {
//     $(".about_head").on("click",function(){
//         $(".about_head, .about_body").animate({
//             "opacity": 0
//         });
//     });
// });