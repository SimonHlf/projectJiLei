<%@ page language="java" 
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8"> 
		<title>玉商通注册</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/web/Module/account/css/register.css">
</head>
<body>
<%@ include file="../../head.jsp"%>
<div class="midRegister">
			<div class="w1100">
				<strong class="comStrongTit">用户注册</strong>
				<form action="" method="post">
					<div class="comInpCon">
						<span class="comInpTit">用<span class="oneBlank"></span>户<span class="oneBlank"></span>名：</span>
						<input type="text" name="useraccount" placeholder="请输入用户名" id="account" onblur="getUserName()" />
					</div>
					<div class="comInpCon">
						<span class="comInpTit">设置密码：</span>
						<input type="password" name="password" id="password" placeholder="请输入密码" />
					</div>
					<div class="comInpCon">
						<span class="comInpTit">确认密码：</span>
						<input type="password" name="confirmPass" id="confirmPass" placeholder="请输入确认密码" />
					</div>
					<div class="comInpCon">
						<span class="comInpTit">手机号码：</span>
						<input type="text" name="phone" id="phone" placeholder="请输入手机号码" />
					</div>
					<div class="comInpCon">
						<span class="comInpTit">手机验证码：</span>
						<input type="text" name="vercode" placeholder="请输入手机验证码" id="code" />
						<a href="javascript:void(0)" onclick="phoneCode()" id="yanyan">获取验证码</a>
					</div>
					
				</form>
				<input id="regBtn" type="button" value="立即注册" onclick="zhuce()"/>
			</div>
		</div>
		<%@ include file="../../foot.jsp"%> 
		<script src="${pageContext.request.contextPath}/web/js/jquery-1.7.2.min.js" type="text/javascript" charset="utf-8"></script>
		
		<script>
		var flag = true;
		
		var useraccount = '';
		var password = '';
		
		var phone = '';
		/* $(".navList").click(function() {
			var n = $(this).index();
			$(".navList").removeClass("active").eq(n).addClass("active");
			$(".form_list").hide().eq(n).show();
		}) */
		
		function phoneCode() {
			var phone = $("#phone").val();
			if(phone == ''){
				alert("请填写手机号")
				return;
			}
			$.ajax({
						type : 'post',
						data : {
							"mobile" : phone
						},
						url : '${pageContext.request.contextPath}/web/shop/userLoginApi/getValidateCode.htm',
						success : function(data) {
							// data = eval("(" + data + ")");
							if (data.result == "fail") {
								flag = false;
								alert(data.msg);
							}
							if (data.result == "ok") {
								flag = true;
								alert(data.msg);
								var aObj=$("#yanyan");
								
 								aObj.text("倒计时60秒");
 								$("#yanyan").removeAttr("onclick");
 							
 						         var num=60;
 						         var clear=setInterval(function (){
 						           num--;
 						          	aObj.val("倒计时"+num+"秒");
 						           if(num==0){   
 						               clearInterval(clear);
 						           	   aObj.val("发送验证码");
 						           	$("#yanyan").attr("onclick","phoneCode()");
 						       
 						         }
 						         },1000);
							}
							

						}
					});
		}

		

		function getCellPhone(str) {
			$.ajax({
						type : 'post',
						data : {
							"mobile" : str
						},
						url : '${pageContext.request.contextPath}/web/shop/userLoginApi/getCellPhone',
						success : function(data) {
							// data = eval("(" + data + ")");
							if (data.result == "fail") {
								flag = false;
								$("#phonemsg").html(data.msg);
								$("#phonemsg").css("color","red");
							}
							if (data.result == "ok") {
								flag = true;
								$("#phonemsg").html(data.msg);
								$("#phonemsg").css("color","green");
							}
							
						}
					});
		}

		
		function getUserName() {
			var account = $("#account").val();
			$.ajax({
						type : 'post',
						data : {
							"account":account
						},
						url : '${pageContext.request.contextPath}/web/shop/userLoginApi/getAccount.htm',
						success : function(data) {
							// data = eval("(" + data + ")");
							if (data.result == "fail") {
								flag = false;
								$("#account").html(data.msg);
								$("#account").css("color","red");
							}
							if (data.result == "ok") {
								flag = true;
								$("#account").html(data.msg);
								$("#account").css("color","green");
							}
							
						}
					});

		}

		
		function makesurePass(){
			var password = $("#pass1").val();
			var pass =$("#pass11").val();
			if(password != pass){
				layer.msg("两次输入密码不一致");
				
			}
		}
		function zhuce() {
			//if (flag == false) {
			//	layer.msg('提交失败，请按照规范填写信息')
			//	return;
			//}
			
				var password = $("#password").val();
				var pass =$("#confirmPass").val();
				if(password != pass){
					layer.msg("两次输入密码不一致");
					return;
				}
			
				var useraccount = $("#account").val();
			
				var code = $("#code").val();
				var phone = $("#phone").val();
				/*if (useraccount == '' || password == '' || code == ''
						|| phone == '') {
					layer.msg("请将信息填写完整");
					return;
				}*/
			
			$.ajax({
						type : 'post',
						data : {
							"useraccount" : useraccount,
							"password" : password,
							"code" : code,
							"phone":phone
						},
						url : '${pageContext.request.contextPath}/web/shop/userLoginApi/userZhuCe.htm',
						success : function(data) {
							// data = eval("(" + data + ")");
							if (data.result == "fail") {
								alert(data.msg);
							}
							if (data.result == "ok") {
								alert("注册成功");
								window.location.href = "${pageContext.request.contextPath}/web/shop/userLoginApi/getLoginJsp.htm"; 
								/* setTimeout('window.location.href = "${pageContext.request.contextPath}/userController/toUsercenter?cmd=0"',1500); */
							}
						}
					});
		}

	
		
		function checkPass(){
			var password1 = $("#pass1").val();
			var pass=/^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,20}$/;
			if(password1!=null){
				if(!pass.test(password1)){
					$("#passmsg1").html("格式不对");
					flag=false;
				}
				if(pass.test(password1)){
					$("#passmsg1").html("");
					flag=true;
				}
			}
			
			
		}
	</script>
</body>
</html>