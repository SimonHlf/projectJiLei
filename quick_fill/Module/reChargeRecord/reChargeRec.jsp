<!DOCTYPE html>
<%@page pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0" />
<title>我的充值记录</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/weChat/css/reset.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/weChat/Module/reChargeRecord/css/myRechargeRec.css" />
</head>
<body class="bodyPadBot">
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
		charset="utf-8"></script>
	<script type="text/javascript">
		$(function() {
			showDetailCon();
		});
	</script>
</body>
</html>
