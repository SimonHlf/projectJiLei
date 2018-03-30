<!DOCTYPE html>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page pageEncoding="utf-8" %>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0"/>
	<link rel="stylesheet" type="text/css" href="css/reset.css"/>
	<link rel="stylesheet" type="text/css" href="css/index.css"/>
	<link rel="stylesheet" type="text/css" href="css/perInfo.css"/>
	<link rel="stylesheet" type="text/css" href="css/footer.css"/>
	<title>充电桩</title>
</head>
<body class="bodyPadBot">
	<% List<Map<String,Object>> i = (List<Map<String,Object>>)session.getAttribute("getByUser"); %>
	<!-- 个人用户信息 -->
	<div class="perInfos">
		<div class="perImg fl"> <img src="<%= i.get(0).get("we_image") %>" class="avatar aui-img-round"></div>
		<div class="perInfoTxt fl">
			<strong><%= i.get(0).get("name") %></strong>
		    <p>用户编号：<%= i.get(0).get("account") %></p>
			<p>赠送余额：<%= i.get(0).get("dummy_balance") %>元</p>
			<p>账户余额：<%= i.get(0).get("balance") %>元</p>
		</div>
		<div class="batteryDiv"></div>
	</div>
	<div class="welcomeDiv">
		<h4>欢迎使用好快充物联网智能充电平台</h4>
	</div>
	<!-- mainNav -->
	<div class="mainNav">
		<ul class="clearfix">
			<li class="margR"><a class="accChargeA orangColor" href="${pageContext.request.contextPath }/weChat/Module/copy/addMoney.jsp">
				<span></span>
				账户充值
			</a></li>
			<li><a class="myElCardA blueColor" href="${pageContext.request.contextPath }/weChat/byUserCard.htm">
				<span></span>
				我的电卡
			</a></li>
			<li class="margR"><a class="chargeRecA blueColor" href="${pageContext.request.contextPath }/weChat/getByUserChargeMoney.htm">
				<span></span>
				充值记录
			</a></li>
			<li><a class="chargeEleRecA orangColor" href="${pageContext.request.contextPath }/weChat/getByUserCharge.htm">
				<span></span>
				充电记录
			</a></li>
			<li class="margR"><a class="helpA orangColor" href="${pageContext.request.contextPath }/weChat/getByUserMessage.htm">
				<span></span>
				修改信息
			</a></li>
		</ul>
	</div>
	<!-- footer -->
	<jsp:include page="down.jsp">
		<jsp:param value="4" name="cmd"/>
	</jsp:include>
</body>
</html>