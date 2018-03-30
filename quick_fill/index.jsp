<!DOCTYPE html>
<%@page pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	<!-- 个人用户信息 -->
	<div class="perInfos">
		<div class="perImg fl"> <img src="${sessionScope.fontUser.weImage }" class="avatar aui-img-round"></div>
		<div class="perInfoTxt fl">
			<strong>
			<c:if test="${sessionScope.fontUser.regionId == null}">暂无小区</c:if>
			<c:if test="${sessionScope.fontUser.regionId != null}">
			${sessionScope.regionName}
			</c:if>
			</strong>
		    <p>用户编号：${sessionScope.fontUser.account }</p>
			<p>赠送余额：${sessionScope.fontUser.dummyBalance }元</p>
			<p>账户余额：${sessionScope.fontUser.balance }元</p>
		</div>
		<div class="batteryDiv"></div>
	</div>
	<div class="welcomeDiv">
		<h4>欢迎使用好快充物联网智能充电平台</h4>
	</div>
	<!-- mainNav -->
	<div class="mainNav">
		<ul class="clearfix">
			<li class="margR"><a class="accChargeA orangColor" href="${pageContext.request.contextPath }/weChat/find.htm">
				<span></span>
				账户充值
			</a></li>
			<li><a class="myElCardA blueColor" href="${pageContext.request.contextPath }/weChat/userElectric.htm">
				<span></span>
				我的电卡
			</a></li>
			<li class="margR"><a class="chargeRecA blueColor" href="${pageContext.request.contextPath }/weChat/arrayList.htm">
				<span></span>
				充值记录
			</a></li>
			<li><a class="chargeEleRecA orangColor" href="${pageContext.request.contextPath }/weChat/chargeArrayList.htm">
				<span></span>
				充电记录
			</a></li>
			<li class="margR"><a class="helpA orangColor" href="Module/useHelp/useHelp.jsp">
				<span></span>
				帮助使用
			</a></li>
			<li><a class="feedA blueColor" href="Module/feedBack/feedBack.jsp">
				<span></span>
				意见反馈
			</a></li>
			<li class="margR"><a class="buyA blueColor" href="Module/toBuy/toBuy.jsp">
				<span></span>
				加盟购买
			</a></li>
			<li><a class="aboutA orangColor" href="Module/aboutUs/aboutUs.jsp">
				<span></span>
				关于我们
			</a></li>
		</ul>
	</div>
	<!-- footer -->
	<jsp:include page="down.jsp">
		<jsp:param value="1" name="cmd"/>
	</jsp:include>
</body>
</html>