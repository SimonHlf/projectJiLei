<%@ page language="java"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<meta charset="UTF-8">
		<title>玉商通竞拍</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/web/Module/account/css/login.css"/>
		<script src="${pageContext.request.contextPath}/web/js/jquery-1.7.2.min.js" type="text/javascript" charset="utf-8"></script>
</head>
<body onkeydown='test(event)'>
<%@ include file="../../head.jsp"%>
	<div class="midLogin">
		<div class="loginDivWrap w1100">
			<div class="loginDiv">
				<strong class="titStrong">用户登录</strong>
				<div class="comInpDiv">
					<span class="titSpan userIcon"></span> <input id="useraccount" type="text"
						placeholder="用户名" />
				</div>
				<div class="comInpDiv">
					<span class="titSpan lockIcon"></span> <input id="password" type="password"
						placeholder="请输入密码" />
				</div>
				<p class="smFuncP">
					<a class="regBtn" href="javascript:void(0)" onclick="quregister()">立即注册</a> <a
						href="${pageContext.request.contextPath}/web/shop/userLoginApi/forgetPassword.htm" class="forgPasBtn">忘记密码？</a>
				</p>
				<button class="goLoginBtn" id="loginbotton" onclick="loginbotton()">立即登录</button>
				<div class="authorLogin">
					<p class="authorCon">
						<a href="${pageContext.request.contextPath}/qq/login.htm">
							<span class="qqIcon"></span>
							QQ
							<em></em>
						</a>
						<a class="margL" href="${pageContext.request.contextPath}/wx/login.htm">
							<span class="weixinIcon"></span>
							微信
							<em></em>
						</a>
						<a class="margL" href="${pageContext.request.contextPath}/wb/login.htm">
							<span class="weiboIcon"></span>
							微博
						</a>
						<%--<a class="regA" href="register.html">立即注册</a>--%>
					</p>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="../../foot.jsp"%> 
	
	<script type="text/javascript">
		
		function loginbotton(){
			
			var useraccount = $("#useraccount").val();
			var password = $("#password").val();
			
			if(useraccount == ''){
				
				return;
			}
			if(password == ''){
				
				return;
			}
			
			$.ajax({
				
				type : 'post',
				data : {
					"useraccount" : useraccount,
					"password" : password
				},
				url : '${pageContext.request.contextPath}/web/shop/userLoginApi/userLogin.htm',
				success : function(data) {
					// data = eval("(" + data + ")");
					if (data.result == "fail") {
						alert(data.msg)
					}
					if (data.result == "ok") {
						
						if(data.redirecturl == null){
							location.href="${pageContext.request.contextPath}/"
						}else{
							location.href="${pageContext.request.contextPath}/"+data.redirecturl;
						}
						
					}
					
				}
				
			});
			
		}
		
		function test(event) {
	        if (event.keyCode == 13) {
	        	loginbotton();
	        }
	    }
		
	</script>
</body>
</html>