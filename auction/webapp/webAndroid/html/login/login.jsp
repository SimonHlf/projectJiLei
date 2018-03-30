<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no"/>
	<meta name="format-detection" content="telephone=no" />
	<meta name="format-detection" content="email=no" />
	<meta name="apple-mobile-web-app-capable" content="yes" />
	<meta name="apple-mobile-web-app-status-bar-style" content="black" />
	<title>玉商通</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/webAndroid/dist/css/reset.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/webAndroid/dist/css/login/login.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/webAndroid/dist/css/com/headercom1.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/webAndroid/jslib/swiper/css/swiper-3.4.1.min.css">
	<script src="${pageContext.request.contextPath}/webAndroid/js/jquery-1.11.0.js" ></script>
	<script src="${pageContext.request.contextPath}/webAndroid/jslib/swiper/js/swiper-3.4.1.min.js" ></script>
	<script src="${pageContext.request.contextPath}/webAndroid/js/home/index.js" ></script>
	<script src="${pageContext.request.contextPath}/webAndroid/js/com/com.js" ></script>
</head>
<body>
	<!---------------------------登录---------------------->
	<div id="container"	>
		<header id="aboutHeader">
			<div class="aBack">
				<a href="javascript:void(0);"><em class="iconfont">&#xe600;</em></a>
			</div>
			<div class="aUs">用户登录</div>
			<div class="aMore">
				<em class="iconfont">&#xe617;</em>
			</div>
		</header>
		<!----------------------------morelistss--------------------------->
		<ul id="moreCon">
			<li class="active">
				<a href="${pageContext.request.contextPath}/web/android/index/toAndriodIndexJsp.htm">
					<em class="iconfont">&#xe6d9;</em><span>首页</span>
				</a>
			</li>
			<li>
				<a href="/src/html/kind/prokind/kind.html">
					<em class="iconfont">&#xe601;</em><span>分类搜索</span>
				</a>
			</li>
			<li>
				<a href="/src/html/cart/cart.html">
					<em class="iconfont">&#xe636;</em><span>购物车</span>
				</a>
			</li>
			<li>
				<a href="/src/html/person/person.html">
					<em class="iconfont">&#xe607;</em><span>个人中心</span>
				</a>
			</li>
		</ul>
		<!-------------------------------main----------------------------->
		<div id="main">
			<div class="logoBox">
				<img src="${pageContext.request.contextPath}/webAndroid/image/login/loginLogo.jpg" alt=""/>
			</div>
			<form class="logoMsg">
				<p>
					<label for="name">账号:</label>
					<input type="text" id="useraccount" placeholder="请输入账号" />
				</p>
				<p>
					<label for="pwd">密&nbsp;&nbsp;&nbsp;码:</label>
					<input type="password" placeholder="请输入密码" id="password" />
				</p>
			</form>
			<div class="btnBox">
				<a class="toRegister" href="${pageContext.request.contextPath}/web/android/userLogin/getRegistJsp.htm">立即注册</a><a href="${pageContext.request.contextPath}/web/shop/userLoginApi/forgetPassword.htm" class="forgetPwd">忘记密码？</a>
			</div>
			<div class="btn">
				<button id="loginbotton" onclick="loginbotton()">立即登录</button>
			</div>
		</div>
	</div>	
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
				url : '${pageContext.request.contextPath}/web/android/userLogin/userLogin.htm',
				success : function(data) {
					
					if (data.result == "fail") {
						alert(data.msg)
					}
					if (data.result == "ok") {
				
						location.href="${pageContext.request.contextPath}/web/android/index/toAndriodIndexJsp.htm";
					}
				}
			});
		}
	</script>
	</body>
</html>
