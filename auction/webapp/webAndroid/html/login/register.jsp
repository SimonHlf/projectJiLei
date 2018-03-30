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
					<label for="phone">用户名:</label>
					<input type="text" placeholder="用户名" name="account" id="account" />
				</p>
				<p>
					<label for="pwd">密&nbsp;&nbsp;&nbsp;码:</label>
					<input type="password" placeholder="请输入密码" name="password" id="password" />
				</p>
				<p>
					<label for="pwdAgain">密&nbsp;&nbsp;&nbsp;码:</label>
					<input type="password" placeholder="请再次输入密码" name="confirmPass" id="confirmPass" />
				</p>
				<p>
					<label for="phone">手机号:</label>
					<input type="text" placeholder="手机号" name="phone" id="phone" />
				</p>
				<p>
					<label for="code">验证码:</label>
					<input type="text" name="vercode" placeholder="请输入验证码"  id="code" />
					<button type="button" onclick="phoneCode()" id="yanyan">获取验证码</button>
				</p>
			</form>
			<div class="btn">
				<button id="regBtn" type="button" onclick="zhuce()">立即注册</button>
			</div>
		</div>
	</div>	
	<script type="text/javascript">
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
			$.ajax({
				type : 'post',
				data : {
					"mobile" : phone
				},
				url : '${pageContext.request.contextPath}/web/android/userLogin/getValidateCode.htm',
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
				           aObj.html("倒计时"+num+"秒");
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
		
		function zhuce() {
			var password = $("#password").val();
			var pass =$("#confirmPass").val();
			if(password != pass){
				alert('两次输入密码不一致')
				return;
			}
			var useraccount = $("#account").val();
			var code = $("#code").val();
			var phone = $("#phone").val();
		
			$.ajax({
				type : 'post',
				data : {
					"useraccount" : useraccount,
					"password" : password,
					"code" : code,
					"phone":phone,
					"nickname":useraccount
				},
				url : '${pageContext.request.contextPath}/web/android/userLogin/userZhuCe.htm',
				success : function(data) {
					if (data.result == "fail") {
						alert(data.msg);
					}
					if (data.result == "ok") {
						alert("注册成功");
						window.location.href = "${pageContext.request.contextPath}/web/android/userLogin/getLoginJsp.htm"; 
					}
				}
			});
		}
	</script>
	</body>
</html>
