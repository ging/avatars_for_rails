//= require jquery
//= require jquery_ujs
//= require jquery.ui.all
//= require jquery.Jcrop
//= require jquery.form
//= require jquery.fileupload
// require jquery.fileupload-ui
//= require flashy

var AvatarForRails = AvatarForRails || (function($, undefined) {
  var editCallbacks = [];

  var addEditCallback = function(callback){
    editCallbacks.push(callback);
  };

  var edit = function(){
    $.each(editCallbacks, function(i, callback){ callback(); });
  };

  var initFileUpload = function() {
    $('input[name*="logo"]').fileupload({
      dataType: 'json',
      progressall: function (e, data) {
        var progress = parseInt(data.loaded / data.total * 100, 10);

        $('#avatar-progress .bar').css(
          'width',
          progress + '%'
        );
      },
      done: uploadDone
    });

    $('#avatar-progress .bar').css('width', '0%');

  };

  var uploadDone = function(e, data) {
    if (data.result.redirect_path) {
      window.location = data.result.redirect_path;
    } else if (data.result.crop) {
      initCrop(data.result.crop);
    } else {
      Flashy.message('error', data.result.errors);
    }
  };

  var initCrop = function(data) {
    var div = $('.avatar-update'),
        img,
        ar;

    $('#avatar-progress .bar').css('width', '0%');
    div.html(data);

    img = div.find('img.avatar-crop'),
    ar  = parseInt(img.attr('data-aspect_ratio'), 10);
   
    img.Jcrop({
      bgColor:     'clear',
      bgOpacity:   0.6,
      setSelect:   [ 0, 0, 200, 200 / ar ],
      aspectRatio: ar,
      onSelect: updateCrop,
      onChange: updateCrop
    });
  };

  var updateCrop = function(coords) {
    var img = $('img.avatar-crop');
    var iW = img.width();
    var iH = img.height();

    if ((coords.w === 0) || (coords.h === 0)){
      coords.x = 0;
      coords.y = 0;
    }  
  
    $('input[name*="logo_crop_x"]').val(coords.x / iW);
    $('input[name*="logo_crop_y"]').val(coords.y / iH);
    $('input[name*="logo_crop_w"]').val(coords.w / iW);
  };

  addEditCallback(initFileUpload);

  return {
    edit: edit
  };
})(jQuery);
