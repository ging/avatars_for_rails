//= require jquery
//= require jquery-ui
//= require jquery.Jcrop.min
//= require jquery.form
//= require jquery.fileupload
//= require jquery.fileupload-ui

$(document).ready( function() {
  //Full Caption Sliding (Hidden to Visible)
  $('.boxgrid.captionfull').hover( function() {
    $(".cover", this).stop().animate({top:'61px'},{queue:false,duration:160});
  }, function() {
    $(".cover", this).stop().animate({top:'104px'},{queue:false,duration:160});
  });
});
