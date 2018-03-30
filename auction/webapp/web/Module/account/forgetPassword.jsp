<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
		<title>忘记密码</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/web/Module/account/css/register.css"/>
</head>
<body>
	<%@ include file="../../head.jsp"%>
	<div class="midRegister">
			<div class="w1100">
				<strong class="comStrongTit">忘记密码</strong>
				
				<div class="comInpCon">
					<span class="comInpTit">手机号码：</span>
					<input type="text" name="phoneNum" id="phone" placeholder="请输入手机号码" />
				</div>
				<div class="comInpCon">
					<span class="comInpTit">手机验证码：</span>
					<input type="text" name="vercode" id="code" placeholder="请输入手机验证码" />
					<a href="javascript:void(0)" onclick="phoneCode()" id="yanyan">获取验证码</a>
				</div>
				<div class="comInpCon">
					<span class="comInpTit">设置新密码：</span>
					<input type="password" name="password" id="password" placeholder="请输入密码" />
				</div>
				<div class="comInpCon">
					<span class="comInpTit">确认新密码：</span>
					<input type="password" name="confirmPass" id="confirmPass" placeholder="请输入确认密码" />
				</div>
				<input id="regBtn" type="button" onclick="editPass()" value="提交"/>
			</div>
		</div>
		<%@ include file="../../foot.jsp"%> 
		<script src="${pageContext.request.contextPath}/web/js/jquery-1.7.2.min.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript">
		
		function editPass(){
			var phone = $("#phone").val();
			var code = $("#code").val();
			var password = $("#password").val();
			var pass =$("#confirmPass").val();
			
			if(phone==''){
				alert("手机号不能为空");
				return;
			}
			var regPhone = /^[1][3,4,5,7,8][0-9]{9}$/; 
			if(!regPhone.test(phone)){
				alert('手机号格式不正确');
				return;
			}
			if(code==''){
				alert("验证码不能为空");
				return;
			}
			if(password==''){
				alert("密码不能为空");
				return;
			}
			if(pass==''){
				alert("确认密码不能为空");
				return;
			}
			if(password != pass){
				alert("两次输入密码不一致");
				return;
			}
			$.ajax({
				type : 'post',
				data : {
					"code" : code,
					"mobile":phone
				},
				url : '${pageContext.request.contextPath}/web/shop/userLoginApi/compareCode.htm',
				success : function(data) {
					if (data.result == "fail") {
						alert(data.msg);
					}
					if (data.result == "ok") {
						$.ajax({
							type : 'post',
							data : {
								"password" : password,
								"phone":phone
							},
							url : '${pageContext.request.contextPath}/web/shop/userLoginApi/updatePass.htm',
							success : function(data) {
								if (data.result == "fail") {
									alert(data.msg);
								}
								if (data.result == "ok") {
									alert('修改成功')
									location.href='${pageContext.request.contextPath}/web/shop/userLoginApi/getLoginJsp.htm';
								}
							}
						});
					}
				}
			});
		}
		
		var flag = true;
		
		var useraccount = '';
		var password = '';
		
		var phone = '';
		function phoneCode() {
			var phone = $("#phone").val();
			if(phone == ''){
				alert("请填写手机号")
				return;
			}
			var regPhone = /^[1][3,4,5,7,8][0-9]{9}$/; 
			if(!regPhone.test(phone)){
				alert('手机号格式不正确');
				return;
			}
			$.ajax({
				type : 'post',
				data : {
					"mobile" : phone
				},
				url : '${pageContext.request.contextPath}/web/shop/userLoginApi/getValidateCode.htm',
				success : function(data) {
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
					        aObj.text("倒计时"+num+"秒");
					        if(num==0){   
					             clearInterval(clear);
					           	 aObj.text("发送验证码");
					             $("#yanyan").attr("onclick","phoneCode()");
					       
					         }
					   	},1000);
					}
				}
			});
		}
		</script>
</body>
</html>