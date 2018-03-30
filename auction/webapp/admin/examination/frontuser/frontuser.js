function addUserDisRate(){
    var page = $("#disRatePage").val();
    edit("examination/frontuser/add.jsp",
        "addDisRateForm",
        "frontuser/add.htm",
        "添加用户信息",
        "frontuser/list.htm",
        '用户列表');
}


function delDisRate(){
    var page = $("#disRatePage").val();
    var ids = "-1";
    $(".table input:checked").each(function () {
        ids = ids + "," + $(this).val();
    });
    if(ids == "-1"){
        layer.msg("请选择数据");
        return;
    }
    layer.confirm("确认删除吗?",function(index){
        $.ajax({
            method:'post',
            url:'frontuser/delete.htm',
            data:{ids:ids,page:page},
            success:function (data) {
                loadHtml(data);
                layer.close(index)
            }
        })
    });
}

function updateDisRate(){
    var page = $("#disRatePage").val();
    var checks = $(".table input:checked");
    if(checks.length != 1){
        layer.msg("请选择一条数据");
        return;
    }
    edit('frontuser/edit.htm?id=' + $(checks[0]).val(),
        "addDisRateForm",
        "frontuser/update.htm?page="+page,
        "修改用户信息",
        "frontuser/list.htm?page="+page,
        '用户列表');
}

function searchItem() {
    $.ajax({
        method:'post',
        url:'frontuser/list.htm',
        cache: false,
        contentType: false,
        processData: false,
        data:new FormData($("#addDisRateForm")[0]),
        success:function (data) {
            loadHtml(data);
        }
    });
}

function searchItem(id) {
    $.ajax({
        method:'post',
        url:'frontuser/detailedList.htm',
        data:{
        	'userid':id
        	},
        success:function (data) {
        	loadHtml(data);
        }
    });
}

function previewImage(file)
{
  var MAXWIDTH  = 90; 
  var MAXHEIGHT = 90;
  var div = document.getElementById('preview');
  if (file.files && file.files[0])
  {
      div.innerHTML ='<img id=imghead onclick=$("#previewImg").click()>';
      var img = document.getElementById('imghead');
      img.onload = function(){
        var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
        img.width  =  rect.width;
        img.height =  rect.height;
//         img.style.marginLeft = rect.left+'px';
        img.style.marginTop = rect.top+'px';
      }
      var reader = new FileReader();
      reader.onload = function(evt){img.src = evt.target.result;}
      reader.readAsDataURL(file.files[0]);
  }
  else //兼容IE
  {
    var sFilter='filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src="';
    file.select();
    var src = document.selection.createRange().text;
    div.innerHTML = '<img id=imghead>';
    var img = document.getElementById('imghead');
    img.filters.item('DXImageTransform.Microsoft.AlphaImageLoader').src = src;
    var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
    status =('rect:'+rect.top+','+rect.left+','+rect.width+','+rect.height);
    div.innerHTML = "<div id=divhead style='width:"+rect.width+"px;height:"+rect.height+"px;margin-top:"+rect.top+"px;"+sFilter+src+"\"'></div>";
  }
}
function clacImgZoomParam( maxWidth, maxHeight, width, height ){
    var param = {top:0, left:0, width:width, height:height};
    if( width>maxWidth || height>maxHeight ){
        rateWidth = width / maxWidth;
        rateHeight = height / maxHeight;
        
        if( rateWidth > rateHeight ){
            param.width =  maxWidth;
            param.height = Math.round(height / rateWidth);
        }else{
            param.width = Math.round(width / rateHeight);
            param.height = maxHeight;
        }
    }
    param.left = Math.round((maxWidth - param.width) / 2);
    param.top = Math.round((maxHeight - param.height) / 2);
    return param;
}

