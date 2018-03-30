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
<title>我的充值记录</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/weChat/css/reset.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/weChat/Module/reChargeRecord/css/myRechargeRec.css" />
</head>
<body>
	<%
		List<Map<String, Object>> i = (List<Map<String, Object>>) session.getAttribute("getByUser");
	%>
	<!-- 个人用户信息 -->
	<div class="perInfos">
		<div class="perImg fl"> <img src="<%= i.get(0).get("we_image") %>" class="avatar aui-img-round"></div>
		<div class="perInfoTxt fl">
			<strong><%= i.get(0).get("name") %>小区</strong>
		    <p>用户编号：<%= i.get(0).get("account") %></p>
			<p>赠送余额：<%= i.get(0).get("dummy_balance") %>元</p>
			<p>账户余额：<%= i.get(0).get("balance") %>元</p>
		</div>
		<div class="batteryDiv"></div>
	</div>
	<!-- 充值记录 -->
	<div class="comList chargeRecList">
		<strong class="comStrongTit">充值记录</strong>
		<ul id="ulList" class="clearfix">
			<c:forEach items="${list}" var="list">
				<li>
					<div class="innerPar clearfix">
						<span class="radiusSpan"></span>
						<p>${list.add_time}</p>
						<p>
							充值<em>${list.balance}</em>元
						</p>
						<p>
							<span class="triBg"></span>
						</p>
						<div class="detailDiv">
							<span>订单ID:${list.rechargeId}</span> <span>支付方式: <c:if
									test="${list.pay_type==1}">微信支付</c:if> <c:if
									test="${list.pay_type!=1}">其他</c:if>
							</span> <span>交易结果: <c:if test="${list.state==1}">成功</c:if> <c:if
									test="${list.state!=1}">失败</c:if>
							</span>
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
	<%-- <%@include file="../../down.jsp"%>	 --%>
	<script
		src="${pageContext.request.contextPath }/weChat/jsPlugin/jquery.min.js"
		type="text/javascript"></script>
	<script
		src="${pageContext.request.contextPath }/weChat/Module/reChargeRecord/js/showDetailCon.js"
		type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript">
		$(function() {
			showDetailCon();
		});
	</script>
</body>
</html>
