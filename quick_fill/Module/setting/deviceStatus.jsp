<!DOCTYPE html>
<%@page pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0"/>
		<title>设备状态</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/weChat/css/reset.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/weChat/Module/setting/css/deviceStaus.css"/>
	</head>
	<body>
		<div class="recDecBg">
			<img src="${pageContext.request.contextPath }/weChat/Module/setting/images/equip.png" alt="设备管理" />
		</div>
		<div class="deviceStatus">
			<strong class="comStrongTit">设备状态</strong>
			<p class="areaName">${name}</p>
			<ul class="listChargingArea">
			<c:forEach items="${list}" var="list">
				<li>
					<p>${list.regionNmae}</p> <a href="${pageContext.request.contextPath}/weChat/hardwareList.htm?type=${list.id}">设备状态</a>
				</li>
			</c:forEach>
			</ul>
		</div>
		<!-- footer -->
			<jsp:include page="../../down.jsp">
		<jsp:param value="4" name="cmd"/>
	</jsp:include>
	</body>
</html>
