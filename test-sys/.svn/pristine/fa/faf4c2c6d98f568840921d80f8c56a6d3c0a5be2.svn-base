<%@page pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
	<meta charset="UTF-8">
	<title>${setting.attr3}<%--机动机务段职工培训考试系统--%></title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/web/css/reset.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/web/module/login/css/login.css">
	<script src="${pageContext.request.contextPath}/web/jsPlugin/jquery.min.js"></script>
</head>
<body>
	<div class="bodyBg"></div>   
	<div class="w1100">
		<div class="loginDiv">
			<strong class="mainTxt"><span>${setting.attr5}<%--真培</span>&nbsp;&nbsp;<span>真学</span>&nbsp;&nbsp;<span>真考</span>--%></strong>
			<div class="titDiv clearfix">
				<p class="subTit">${setting.attr3}<%--机动机务段职工培训考试系统--%></p>
				<h2>${setting.attr2}<%--XX集团--%></h2>
			</div>
			<div class="loginBox">
				<p class="decTxt">${setting.attr4}<%--Motor locomotives worker training and examination system--%></p>
				<div class="leftLoginPart fl">
					<div class="logoImg"></div>
				</div>
				<div class="rightLoginPart fl">
					<form  action="${pageContext.request.contextPath}/web/module/login/inter/frontuser/login.htm" method="post">
						<div class="comFormDiv">
							<span>工号</span>
							<input type="text" name="code" placeholder="请输入工号">
						</div>
						<div class="comFormDiv">
							<span>密码</span>
							<input type="password" name="password" placeholder="请输入密码">
						</div>
						<%--<a class="loginBtn" onclick="frontUserLogin()">登录</a>--%>
						<button class="loginBtn" type="submit">登录</button>
						<a class="forgetBtn" href="javascript:void(0)">忘记密码？</a>
					</form>
						<br>
					    <p style="color: red" align="center">${interJson.msg}</p>
				</div>
			</div>
		</div>
	</div>
</body>
