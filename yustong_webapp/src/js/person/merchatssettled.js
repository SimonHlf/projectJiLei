window.onload=function(){
	
  //选择图片
  var loadImg = function(obj){
    $(obj).parent().find(".upload_input").click();
  }
  //删除
  var deleteImg = function(obj){
    $(obj).parent().find('input').val('');
    $(obj).parent().find('.preview').html('');
    $(obj).hide();
  }
	
function preview(file) {
  var prevDiv = $(file).parent().find('.preview');
  if (file.files && file.files[0]) {
    var reader = new FileReader();
    reader.onload = function(evt) {
      prevDiv.html('<img src="' + evt.target.result + '" />');
    }
    reader.readAsDataURL(file.files[0]);
  } else {//IE
    prevDiv.html('<div class="img" style="filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src=\'' + file.value + '\'"></div>');
  }
  $(file).parent().find('.delete').show();
}

}
}
//<div class="item">
//				      <svg class="icon addImg" aria-hidden="true">
//				          <use xlink:href="#icon-tianjiatupian"></use>
//				      </svg>
//				      <input name="url" type="file" class="upload_input" onchange="preview(this)"/>
//				      <div class="preview"></div>
//				      <div class="click" onclick="loadImg(this)"></div>
//				      <div class="delete" onclick="deleteImg(this)">
//				        <svg class="icon" aria-hidden="true">
//				          <use xlink:href="#icon-shanchu4"></use>
//				        </svg>
//				      </div>
//				 </div>