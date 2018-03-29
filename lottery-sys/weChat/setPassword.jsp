<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0"/>
	<title>密码修改</title>
	<link rel="stylesheet" href="../weChat/reception/css/aui.css"/>
	<link rel="stylesheet" href="http://at.alicdn.com/t/font_535570_6u90gnv3u6hzd7vi.css"/>
	<link rel="stylesheet" href="../weChat/reception/css/setPassword.css">
	<link rel="stylesheet" href="../weChat/reception/css/footer.css">
</head>
<body>
	<header class="aui-bar aui-bar-nav headerNav">
        <a class="aui-pull-left aui-btn" tapmode onclick="history.go(-1)" href="javascript:void(0)">
            <span class="aui-iconfont aui-icon-left"></span>
        </a>
       
        <div class="aui-title">修改登录密码</div>
    </header>
    <!-- mainCon -->
    <div class="comInpBox">
    	<ul>
    		<li>
                <div class="txtDiv">
                   	旧<span class="oneBlank"></span>密<span class="oneBlank"></span>码：
                </div>
                <div class="inpDiv">
                    <input id="oldPassInp" type="password" placeholder="请输入旧密码">
                </div>
            </li>
            <li>
                <div class="txtDiv">
                   	新<span class="oneBlank"></span>密<span class="oneBlank"></span>码：
                </div>
                <div class="inpDiv">
                    <input id="newPassInp" onblur="checkPass()" type="password" placeholder="需包含数字与英文小写至少6位">
                </div>
            </li>
            <li>
                <div class="txtDiv">
                   	确认新密码：
                </div>
                <div class="inpDiv">
                    <input id="confirmNewInp" onblur="checkNPass()" type="password" placeholder="需包含数字与英文小写至少6位">
                </div>
            </li>
    	</ul>
    	<a href="javascript:void(0)" tapmode onclick="saveNewPassword()" class="aui-btn aui-btn-block comAuiBtn">修改</a>
    </div>
	<!-- footer -->
	<jsp:include page="footer.jsp" />
	<script type="text/javascript" src="../weChat/reception/jsPlugin/jquery.min.js"></script>
	<script type="text/javascript" src="../weChat/reception/jsPlugin/aui-dialog.js"></script>
	<script type="text/javascript" src="../weChat/reception/jsPlugin/layer/layer.js"></script>
	<script type="text/javascript">
		$(function(){

		});
		function saveNewPassword(){
			var oldPasVal = $("#oldPassInp").val();
			var newPasVal = $("#newPassInp").val();
			var confirmPasVal = $("#confirmNewInp").val();
			
			if(oldPasVal == ""){
                dialog('旧密码不能为空');
                return;
			}else if(newPasVal == ""){
                dialog('新密码不能为空');
                return;
			}else if(confirmPasVal == ""){
                dialog('确认密码不能为空');
                return;
			}else{
				if(newPasVal.length < 6){
                	dialog('新密码至少为6位');
                	return;
				}else if(newPasVal != confirmPasVal){
                	dialog('新密码和确认新密码不相同，请从新输入！');
                	return;
				}else if(checkPass()&&checkNPass()==false){
					dialog('格式不正确，请从新输入！');
                	return;
				}
				
				$.ajax({
				method:'post',
				url:'setNewPassword.htm',
				data:{
  				  
  				  oldPassword:oldPasVal,
  				  newPassword:newPasVal
  			    },				
				success:function(data){
					if(data=='true'){
						layer.msg("修改密码成功",{icon: 6,time:1000},function(){
							location.href = "indexs.htm";
						}); 
					}else{
						 layer.msg("密码不对")
					 }
					    
				},
				error : function() {
					layer.msg("你输入的密码不对！！！");
				}
			})
			}
		}
	</script>
	<script type="text/javascript">
	function checkPass(){
		var userId = $.trim($("#newPassInp").val());
		var reg = /^[0-9a-zA-Z]{4,21}$/;
		var falg = true;
		if(userId != null && userId != ""){
			if(!reg.test(userId)){
				layer.tips("请输入正确的密码", "#newPassInp", {tips: [2, "#E34127"],time: 1000});
				falg = false;
			}
		}
		return falg;
	}
	
	function checkNPass(){
		var userId = $.trim($("#confirmNewInp").val());
		var reg =/^[0-9a-zA-Z]{4,21}$/;
		var falg = true;
		if(userId != null && userId != ""){
			if(!reg.test(userId)){
				layer.tips("请输入正确的确认密码", "#confirmNewInp", {tips: [2, "#E34127"],time: 1000});
				falg = false;
			}
		}
		return falg;
	}
	
	function checkAll(){
		
	}
	</script>
</body>
</html>