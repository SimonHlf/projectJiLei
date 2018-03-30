<!DOCTYPE html>
<%@page pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="v" tagdir="/WEB-INF/tags"%>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0"/>
		<title>设备管理</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/weChat/css/reset.css"/>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/weChat/Module/setting/css/equipManage.css"/>
	</head>
	<body>
		<div class="recDecBg">
			<img src="${pageContext.request.contextPath }/weChat/Module/setting/images/equip.png" alt="设备管理" />
		</div>
		<div class="equipment">
			<strong class="comStrongTit">运营设备-充电区域</strong>
			<p class="areaName">${region.name }</p>
			<ul class="listChargingArea">
			<c:forEach items="${regionAreaList }" var="regionArea">
			<li>
					<p>${regionArea.name }</p>
					<a href="${pageContext.request.contextPath }/weChat/equipManageDetail.htm?reArId=${regionArea.id}&&regionId=${region.id}">设备</a>
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
