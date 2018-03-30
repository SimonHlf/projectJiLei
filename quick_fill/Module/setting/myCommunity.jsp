<!DOCTYPE html>
<%@page pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title>我的小区</title>
		<meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0"/>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/weChat/css/reset.css"/>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/weChat/Module/setting/css/myCommunity.css"/>
	</head>
	<body class="bodyPadBot">
		<div class="chargeRecList comList">
			<strong class="comStrongTit">我的小区</strong>
			<ul id="ulList" class="specUl clearfix">
			<c:forEach items="${list}" var="list">
				<li>
					<div class="innerPar clearfix">
						<p class="hasVerify">
							<c:if test="${list.state==0}">未审核</c:if>
							<c:if test="${list.state==1}">已审核</c:if>
						</p>
						<p class="ellip">${list.address} ${list.name}</p>
						<p>
							<span class="triBg"></span>
						</p>
						<c:if test="${list.state==1}">
							<div class="detailDiv">
								<dl class="moduleUl clearfix">
									<c:if test="${sessionScope.fontUser.type == '2' }">
									     <dd>
											<a href="${pageContext.request.contextPath}/weChat/regionInfor.htm?id=${list.id}">运营设置</a>
										</dd>
										<dd class="marglR">
											<a href="${pageContext.request.contextPath}/weChat/equipManage.htm?regionId=${list.id}">设备管理</a>
										</dd>
										<dd>
											<a href="${pageContext.request.contextPath}/weChat/rateFind.htm?regId=${list.id}">费率查看</a>
										</dd>
											<dd>
											<a href="${pageContext.request.contextPath}/weChat/hardwareList.htm?regionId=${list.id}">设备状态</a>
										</dd>
										<dd class="marglR">
											<a href="${pageContext.request.contextPath}/weChat/statistics.htm?areaId=${list.id}">运营统计</a>
										</dd>
										<dd>
											<a href="${pageContext.request.contextPath}/weChat/areaCardList.htm?areaId=${list.id}">注册账户</a>
										</dd>
									</c:if>
									<c:if test="${sessionScope.fontUser.type == '3' }">
									<c:if test="${list.power_one==1}">
										<dd>
											<a href="${pageContext.request.contextPath}/weChat/regionInfor.htm?id=${list.id}">运营设置</a>
										</dd>
									</c:if>
									<c:if test="${list.power_one==0}">
										<dd>
											<a href="#">无权限</a>
										</dd>
									</c:if>
									<c:if test="${list.power_two==1}">
										<dd class="marglR">
											<a href="${pageContext.request.contextPath}/weChat/equipManage.htm?regionId=${list.id}">设备管理</a>
										</dd>
									</c:if>
									<c:if test="${list.power_two==0}">
										<dd class="marglR">
											<a href="#">无权限</a>
										</dd>
									</c:if>
									<c:if test="${list.power_three==1}">
										<dd>
											<a href="${pageContext.request.contextPath}/weChat/rateFind.htm?regId=${list.id}">费率查看</a>
										</dd>
									</c:if>
									<c:if test="${list.power_three==0}">
										<dd>
											<a href="#">无权限</a>
										</dd>
									</c:if>
									<c:if test="${list.power_four==1}">
										<dd>
											<a href="${pageContext.request.contextPath}/weChat/hardwareList.htm?regionId=${list.id}">设备状态</a>
										</dd>
									</c:if>
									<c:if test="${list.power_four==0}">
										<dd>
											<a href="#">无权限</a>
										</dd>
									</c:if>
									<c:if test="${list.power_five==1}">
										<dd class="marglR">
											<a href="${pageContext.request.contextPath}/weChat/statistics.htm?areaId=${list.id}">运营统计</a>
										</dd>
									</c:if>
									<c:if test="${list.power_five==0}">
										<dd class="marglR">
											<a href="#">无权限</a>
										</dd>
									</c:if>
									<c:if test="${list.power_six==1}">
										<dd>
											<a href="${pageContext.request.contextPath}/weChat/areaCardList.htm?areaId=${list.id}">注册账户</a>
										</dd>
									</c:if>
									<c:if test="${list.power_six==0}">
										<dd>
											<a href="#">无权限</a>
										</dd>
									</c:if>									
									</c:if>
									
								</dl>
							</div>
						</c:if>
						<c:if test="${list.state==0}">
							<div class="detailDiv">
								<span>功能需要通过审核后开放</span>
							</div>
						</c:if>
					</div>
				</li>
			</c:forEach>
			</ul>
			<div class="addAreaDiv">
				<button onclick="addCommunity()">添加小区</button>
			</div>
		</div>
		<!-- footer -->

	<jsp:include page="../../down.jsp">
		<jsp:param value="4" name="cmd"/>
	</jsp:include>

	<script src="${pageContext.request.contextPath}/weChat/jsPlugin/jquery.min.js"></script>
		<script src="${pageContext.request.contextPath}/weChat/Module/reChargeRecord/js/showDetailCon.js" type="text/javascript"></script>
		<script type="text/javascript">
			$(function(){
				showDetailCon();
			});
			//添加小区
			function addCommunity(){
				window.location.href = "${pageContext.request.contextPath}/weChat/findProvinceList.htm";
			}
		</script>
	</body>
</html>
