<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0"/>
	<title>头像昵称修改</title>
	<link rel="stylesheet" href="../weChat/reception/css/aui.css"/>
	<link rel="stylesheet" href="http://at.alicdn.com/t/font_535570_6u90gnv3u6hzd7vi.css"/>
	<link rel="stylesheet" href="../weChat/reception/css/footer.css">
	<style type="text/css">
		.aui-list-item-input img{
			width:2rem;
			height:2rem;
			position:absolute;
			right:10px;
			top:2px;
			border-radius:50%;
		}
	</style>
</head>
<body>
	<div class="aui-bar aui-bar-nav headerNav">
        <a class="aui-pull-left aui-btn" tapmode onclick="history.go(-1)" href="javascript:void(0)">
            <span class="aui-iconfont aui-icon-left"></span>
        </a>
       <%--  <input type="hidden" id="userId" value="${frontUser.userId }"> --%>
        <div class="aui-title">头像昵称修改</div>
    </div>
    <!-- mainCon -->
    <div class="aui-content">
    	<form enctype="multipart/form-data" id="updateName">
	    	<ul class="aui-list aui-form-list">
	    		<li class="aui-list-item">
	                <div class="aui-list-item-inner">
	                    <div class="aui-list-item-label">
	                       	头像：
	                    </div>
	                    <div class="aui-list-item-input">
	                    	<input type="text" style="display:none" id="compressImg" name="headimg"/>
	                    	<input type="file" id="choose" name="pictures" accept="image/*" style="display:none;">
	                       <%--  <img id="upload" src="/${frontUser.headPortrait }"/> --%>
	                         <c:if test="${frontUser.headPortrait!=null && frontUser.headPortrait!='' }">
							     <img id="upload" src="/${frontUser.headPortrait }" /> 
						     </c:if>
						     <c:if test="${frontUser.headPortrait==null || frontUser.headPortrait=='' }">
							 	<img id="upload" src="${pageContext.request.contextPath }/weChat/images/default.jpg" />
							 </c:if>
	                    </div>                
	                </div>
	            </li>
	    		<li class="aui-list-item">
	                <div class="aui-list-item-inner">
	                    <div class="aui-list-item-label">
	                       	昵称：
	                    </div>
	                    <div class="aui-list-item-input">
	                        <p>${frontUser.nickName }</p>
	                    </div>
	                </div>
	            </li>
	    		<li class="aui-list-item">
	                <div class="aui-list-item-inner">
	                    <div class="aui-list-item-label">
	                       	新昵称：
	                    </div>
	                    <input type="hidden" value="${frontUser.headPortrait }" name="headPortrait">
	                    <div class="aui-list-item-input">
	                        <input id="newNickInp" type="text" name="newNickName" placeholder="请输入新的昵称">
	                    </div>
	                </div>
	            </li>
	    	</ul>
    		
    		
    	</form>
    	<button type="button" tapmode onclick="saveNickNames()" class="aui-btn aui-btn-block comAuiBtn" style="border:none;">修改</button>
    </div>
	<!-- footer -->
	<jsp:include page="footer.jsp" />
	<script type="text/javascript" src="../weChat/reception/jsPlugin/layer/layer.js"></script>
	
	 <script type="text/javascript">
	function saveNickNames(){
		var form = new FormData($("#updateName")[0]);
		  $.ajax({
             url:"setNewNickNames.htm",
             type:"post",
             data:form,
             processData:false,
             contentType:false,
             success:function(data){
            	 layer.msg("修改成功",{icon:6,time:1000},function(){
						location.href = "indexs.htm";
					});
             },
             error:function(e){
            	 layer.msg("设置失败");
             }
         });       
	}
	</script> 
	<script type="text/javascript">
		$(function(){
		});
		var filechooser = document.getElementById("choose");
		var canvas = document.createElement("canvas");
		var ctx = canvas.getContext('2d');
	    //    瓦片canvas
	    var tCanvas = document.createElement("canvas");
	    var tctx = tCanvas.getContext("2d");
	    var maxsize = 100 * 1024;
	    
	    
		
	    
	    
	    $("#upload").on("click", function() {
	        filechooser.click();
	      })
	      .on("touchstart", function() {
	        $(this).addClass("touch")
	      })
	      .on("touchend", function() {
	        $(this).removeClass("touch")
	      });
	    
	    filechooser.onchange = function() {
	        if (!this.files.length) return;
	        var files = Array.prototype.slice.call(this.files);
	        if (files.length > 9) {
	          alert("最多同时只可上传9张图片");
	          return;
	        }
	        files.forEach(function(file, i) {
	          if (!/\/(?:jpeg|png|gif)/i.test(file.type)) return;
	          var reader = new FileReader();
	          //var li = document.createElement("li");
	          var li = $("#upload");
	    	  console.log(file.size + "--");
//	              获取图片大小 
	          var size = file.size / 1024 > 1024 ? (~~(10 * file.size / 1024 / 1024)) / 10 + "MB" : ~~(file.size / 1024) + "KB";
	    	///  var size1 = file.size  / (1024*1024).toFixed(2);
	    	  //console.log(size1 )
	    	 //li.innerHTML = '<div class="progress"><span></span></div><div class="size">' + size + '</div>';
	         // $(".img-list").append($(li));
	          reader.onload = function() {
	            var result = this.result;
	            var img = new Image();
	            img.src = result;
	            $(li).attr("src",result);
	            //$(li).css("background-image", "url(" + result + ")");
	    		//$("#testImg").attr("src",result)
	            //如果图片大小小于100kb，则直接上传
	            if (result.length <= maxsize) {
	              //img = null;
	              //console.log(result)
	              /* upload(result, file.type, $(li)); */
	              $("#compressImg").val(result.split(",")[1])
	              return;
	            }
//	          图片加载完毕之后进行压缩，然后上传
	            if (img.complete) {
	              callback();
	            } else {
	              img.onload = callback;
	            }
	            function callback() {
	              var data = compress(img);
	              //upload(data, file.type, $(li));
	    		  //upload(data, file.type, $("#testImg"))
	    		  console.log(typeof data.split(",")[1]);
	    		  $("#compressImg").val(data.split(",")[1]);
	              img = null;
	            }
	          };
	          reader.readAsDataURL(file);
	        })
	      };
	    //    使用canvas对大图片进行压缩
	    function compress(img) {
	      var initSize = img.src.length;
	      var width = img.width;
	      var height = img.height;
	      //如果图片大于四百万像素，计算压缩比并将大小压至400万以下
	      var ratio;
	      if ((ratio = width * height / 5000000) > 1) {
	        ratio = Math.sqrt(ratio);
	        width /= ratio;
	        height /= ratio;
	      } else {
	        ratio = 1;
	      }
	      canvas.width = width;
	      canvas.height = height;
//	          铺底色
	      ctx.fillStyle = "#fff";
	      ctx.fillRect(0, 0, canvas.width, canvas.height);
	      //如果图片像素大于100万则使用瓦片绘制
	      var count;
	      if ((count = width * height / 1000000) > 1) {
	        count = ~~(Math.sqrt(count) + 1); //计算要分成多少块瓦片
//	              计算每块瓦片的宽和高
	        var nw = ~~(width / count);
	        var nh = ~~(height / count);
	        tCanvas.width = nw;
	        tCanvas.height = nh;
	        for (var i = 0; i < count; i++) {
	          for (var j = 0; j < count; j++) {
	            tctx.drawImage(img, i * nw * ratio, j * nh * ratio, nw * ratio, nh * ratio, 0, 0, nw, nh);
	            ctx.drawImage(tCanvas, i * nw, j * nh, nw, nh);
	          }
	        }
	      } else {
	        ctx.drawImage(img, 0, 0, width, height);
	      }
	      //进行最小压缩
	      var ndata = canvas.toDataURL('image/jpeg', 0.5);
	      console.log('压缩前：' + initSize + "----" +  initSize  / (1024*1024).toFixed(2));
	      console.log('压缩后：' + ndata.length + "----" +  ndata.length  / (1024*1024).toFixed(2));
	      console.log('压缩率：' + ~~(100 * (initSize - ndata.length) / initSize) + "%");
	      tCanvas.width = tCanvas.height = canvas.width = canvas.height = 0;
	      return ndata;
	    }
	</script>
</body>
</html>