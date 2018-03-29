<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0"/>
	<title>推广链接</title>
	<link rel="stylesheet" href="../weChat/reception/css/aui.css"/>
	<link rel="stylesheet" href="http://at.alicdn.com/t/font_535570_6u90gnv3u6hzd7vi.css"/>
	<link rel="stylesheet" href="../weChat/reception/css/footer.css">
</head>
<body>
	<header class="aui-bar aui-bar-nav headerNav">
        <a class="aui-pull-left aui-btn" tapmode onclick="history.go(-1)" href="javascript:void(0)">
            <span class="aui-iconfont aui-icon-left"></span>
        </a>
        <input type="hidden" id="userId" value="${frontUser.userId }">
        <div class="aui-title">推广链接</div>
    </header>
    <!-- mainCon -->
    <div class="aui-content">
    	
    </div>
	<!-- footer -->
	<jsp:include page="footer.jsp" />
	<script type="text/javascript" src="../weChat/reception/jsPlugin/jquery.min.js"></script>
	<script type="text/javascript" src="../weChat/reception/jsPlugin/aui-dialog.js"></script>
	<script type="text/javascript" src="../weChat/reception/jsPlugin/layer/layer.js"></script>
	<script type="text/javascript">
		$(function(){

		});
		function saveNickName(){
			if($("#newNickInp").val() == ""){
                dialog('新昵称不能为空');
                return;
			}
			var newnickname = $("#newNickInp").val();
			var id = $("#userId").val();
			/* window.location.href = "setNewNickName.htm?id="+$.trim($("#userId").val())+"&newnickname="+newnickname; */
			 $.ajax({
				method:'post',
				url:'setNewNickName.htm',
				data:{
  				  id:id,
  				  newnickname:newnickname
  			    },				
				success:function(){
					layer.msg("修改昵称成功",{icon:6,time:1000},function(){
						location.href = "indexs.htm";
					});
					/* layer.confirm("修改昵称成功");
				     window.location.href="index.htm?id="+$("#userId").val();  */
	                
				},
				error : function() {
					layer.msg("设置失败");
				}
			}) 
		}
	</script>
</body>
</html>