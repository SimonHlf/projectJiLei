<!DOCTYPE html>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page pageEncoding="utf-8"%>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/weChat/Module/copy/css/uploadMessage.css"/>
<title>修改信息</title>
</head>
<body class="bodyPadBot">
	<%
		List<Map<String, Object>> i = (List<Map<String, Object>>) session.getAttribute("getByUser");
	%>
	<div class="fixPerInfo">
		<strong class="comStrongTit">修改信息</strong>
		<div class="comAddDiv firstMargT">
			<p>真实姓名：</p>
			<p>
				<input type="text" id="realName" value="${user.realName}" placeholder="请输入真实姓名"/>
			</p>
		</div>
		<div class="comAddDiv">
			<p>设置昵称：</p>
			<p>
				<input type="text" value="${user.nickName}" id="nickName" placeholder="请输入昵称"/>
			</p>
		</div>
		<div class="comAddDiv">
			<p>手机号码：</p>
			<p>
				<input type="number" value="${user.phone}" id="phone" placeholder="请输入手机号码"/>
			</p>
		</div>
		<div class="comAddDiv">
			<p>用户地址：</p>
			<p>
				<input type="text" value="${user.address}" id="address" placeholder="请输入用户地址"/>
			</p>
		</div>
		<div class="comAddDiv">
			<button ontouchend="messageUpdate()">保存</button>
		</div>
	</div>
	<div class="toast-wrap">
        <span class="toast-msg"></span>
    </div> 
    <!-- footer -->
	<jsp:include page="../../down.jsp">
		<jsp:param value="4" name="cmd"/>
	</jsp:include>
	<script type="text/javascript" src="${pageContext.request.contextPath}/weChat/jsPlugin/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/weChat/jsPlugin/tipInfo.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/weChat/Module/copy/copyJs.js"></script>
	<script type="text/javascript">
		$(function(){
			//toast("test")
		});
	</script>
</body>
</html>