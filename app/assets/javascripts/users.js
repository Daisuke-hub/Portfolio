// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(function(){
  $("#user_user_image").change(function(){
    $(".attachment").remove();
    var selectedFile = this.files[0];
    var fileReader = new FileReader();
    fileReader.onloadend = function(event){
      var loadedImageUri = event.target.result
      $("#result").html('<img src="' + loadedImageUri + '"id=preview >' );
    }
    fileReader.readAsDataURL(selectedFile);
  });

  $("#page_count_move").animate({
    "paddingTop": "10px"
  }).animate({
    "paddingTop": "0px"
  });
});
