<!DOCTYPE html>
<%@page pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0" />
<title>我的充电记录</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/weChat/css/reset.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/weChat/Module/chargingElecRec/css/chargingElecRec.css" />
</head>
<body>
	<!-- 个人用户信息 -->
	<div class="perInfos">
		<div class="perImg fl">
			<img src="${sessionScope.fontUser.weImage }"
				class="avatar aui-img-round">
		</div>
		<div class="perInfoTxt fl">
			<strong>${sessionScope.regionName}小区</strong>
			<p>用户编号：${sessionScope.fontUser.account }</p>
			<p>赠送余额：${sessionScope.fontUser.dummyBalance }元</p>
			<p>账户余额：${sessionScope.fontUser.balance }元</p>
		</div>
		<div class="batteryDiv"></div>
	</div>
	<!-- 充电记录 -->
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
	<div class="footer">
		<ul class="clearfix">
			<li class="fourWid active"><a class="homeA"
				href="${pageContext.request.contextPath }/weChat/index.jsp"> <span></span>
					<p>首页</p>
			</a></li>
			<li class="fourWid"><a class="chargeA"
				href="${pageContext.request.contextPath }/weChat/Module/charging/charging.jsp"> <span></span>
					<p>充电中</p>
			</a></li>
			<li class="fourWid"><a class="scanA" href="${pageContext.request.contextPath }/weChat/Module/scan/scan.jsp">
					<span></span>
					<p>扫一扫</p>
			</a></li>
			<li class="fourWid"><a class="setA" href="${pageContext.request.contextPath}/weChat/settingCount.htm"> <span></span>
					<p>设置</p>
			</a></li>
		</ul>
	</div>
	<script src="${pageContext.request.contextPath }/weChat/jsPlugin/jquery.min.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath }/weChat/Module/reChargeRecord/js/showDetailCon.js" type="text/javascript"
		type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript">
		$(function() {
			showDetailCon();
		});
	</script>
</body>
</html>
