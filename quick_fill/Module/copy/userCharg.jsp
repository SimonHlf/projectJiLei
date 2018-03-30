<!DOCTYPE html>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0" />
<title>我的充电记录</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/weChat/css/reset.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/weChat/Module/chargingElecRec/css/chargingElecRec.css" />
</head>
<body>
	<%
		List<Map<String, Object>> i = (List<Map<String, Object>>) session.getAttribute("getByUser");
	%>
	<!-- 个人用户信息 -->
	<!-- 充电记录 -->
	<div class="perInfos">
		<div class="perImg fl"> <img src="<%= i.get(0).get("we_image") %>" class="avatar aui-img-round"></div>
		<div class="perInfoTxt fl">
			<strong><%= i.get(0).get("name") %>小区</strong>
		    <p>用户编号：<span id="byuser"><%=i.get(0).get("account")%></span></p>
			<p>赠送余额：<%= i.get(0).get("dummy_balance") %>元</p>
			<p>账户余额：<%= i.get(0).get("balance") %>元</p>
		</div>
		<div class="batteryDiv"></div>
	</div>
		<div class="comList chargeRecList">
		<strong class="comStrongTit">充电记录</strong>
		<ul id="ulList" class="clearfix">
			<c:forEach items="${list}" var="list">
				<li>
					<div class="innerPar clearfix">
						<span class="radiusSpan"></span>
						<p>${list.start_time}</p>
						<p>
							<c:if test="${list.charge_type=='0'}">包月</c:if>
							<c:if test="${list.charge_type=='1'}">计量</c:if>
							<c:if test="${list.charge_type=='2'}">计次</c:if>
							<c:if test="${list.charge_type=='3'}">计时</c:if>
							<em>${list.money}</em>元
						</p>
						<p>
							<span class="triBg"></span>
						</p>
						<div class="detailDiv">
							<span>
								充电小区：${list.name} ${list.sbName} ${list.port}
								
							</span>
							<span>充电时间：${list.start_time}至${list.end_time}</span> <span>消费方式：手机/电卡ID
								${list.number}</span>
						</div>
					</div>
				</li>
			</c:forEach>
		</ul>
	</div>
	<!-- footer -->
	<jsp:include page="../../down.jsp">
		<jsp:param value="4" name="cmd"/>
	</jsp:include>
	<%-- <%@include file="../../down.jsp"%> --%>
	<script
		src="${pageContext.request.contextPath }/weChat/jsPlugin/jquery.min.js"
		type="text/javascript"></script>
	<script
		src="${pageContext.request.contextPath }/weChat/Module/reChargeRecord/js/showDetailCon.js"
		type="text/javascript" type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript">
		$(function() {
			showDetailCon();
		});
	</script>
</body>
</html>
