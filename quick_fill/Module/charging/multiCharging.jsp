<!DOCTYPE html>
<%@page pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>充电中</title>
<meta name="viewport"
	content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/weChat/css/reset.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/weChat/Module/charging/css/charging.css" />
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
	<!-- 用户充电 -->
	<!--
			判断用户充电状态
			01：没有充电->扫一扫入口
			02：一个充电
			03：多个充电
		-->
	<c:forEach items="${list}" var="charge">
		<div class="chargingList" id="${charge.id}">
			<!-- 多个充电 -->
			<div class="multiCharging">
				<div class="innerCharge_multi clearfix">
					<div class="comLeft_multi">
						<p>充电桩编号</p>
						<p>${charge.code}</p>
						<p>
							<span></span>正在充电
						</p>
					</div>
					<div class="comRight_multi">
						<div class="innerR_multi clearfix">
							<span class="location fl"></span>
							<p class="fl">${charge.address}</p>
						</div>
						<div class="innerR_multi clearfix">
							<div>
								<span class="time fl"></span>
								<p class="fl">${charge.start_time}</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</c:forEach>

	<!-- footer -->
	<jsp:include page="../../down.jsp">
		<jsp:param value="2" name="cmd"/>
	</jsp:include>

	<script src="${pageContext.request.contextPath}/weChat/jsPlugin/jquery.min.js" type="text/javascript"></script>
	<script type="text/javascript">
		$(function() {
			calHeightMulti();
		});
		//动态根据宽度计算高度 多个充电
		function calHeightMulti() {
			var cliWid = $(window).width();
			$(".comLeft_multi").each(
					function(i) {
						if (cliWid > 700) {
							$(".comLeft_multi").height(
									$(".comLeft_multi").width() - 55);
						} else {
							$(".comLeft_multi").height(
									$(".comLeft_multi").width() - 35);
						}
						$(".comLeft_multi p").css(
								{
									"line-height" : $(".comLeft_multi p")
											.height()
											+ 'px'
								})
						$(".comRight_multi").height(
								$(".comLeft_multi").height());
						$(".innerR_multi p").width(
								$(".comRight_multi").width()
										- $(".innerR_multi span").width());
					});
		}


		$(".chargingList").click(function(){
		    window.location = "${pageContext.request.contextPath}/weChat/Charge/chargeDetails.htm?recordId="+$(this).attr("id");
		})



	</script>
</body>
</html>
