<!DOCTYPE html>
<%@page pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0"/>
		<title>设备状态查看</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/weChat/css/reset.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/weChat/Module/setting/css/checkDeviceStatus.css"/>
		
	</head>
	<body>
		<div class="equipment">
			<strong class="comStrongTit">设备管理</strong>
			<p class="areaName">${name}</p>
			<div class="equipNote clearfix">
				<span class="fl">注：</span>
				<ul class="noteUl fl">
					<li class="connectNet">
						<span></span>
						<p>充电桩已联网</p>
					</li>
					<li class="loseNet">
						<span></span>
						<p>充电桩已断网</p>
					</li>
					<li class="portFree">
						<span></span>
						<p>端口空闲</p>
					</li>
					<li class="usePort">
						<span></span>
						<p>端口占用</p>
					</li>
				</ul>
			</div>
			<div class="listEquip">
				<ul>
					<c:forEach items="${list}" var="list">
						<li <c:if test="${list.state==0}">class="listConnectLi"</c:if><c:if test="${list.state==1}">class="listLostNetLi"</c:if>>
							<span></span>
							<p>设备名称:${list.sbName}&nbsp;&nbsp;&nbsp;编号:${list.num}</p>
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>
		<div class="layer"></div>
		<div class="confirmDiv remarkDiv">
	    	<p>位置及其他备注信息</p>
	    	<div class="remarkInfo">1号楼架空层出入口处</div>
	    	<button class="comTwoBtn twoBtn_sure" onclick="closeAlert($('.remarkDiv'))" style="margin-top: 10px;">确定</button>
	    </div>
		<!-- footer -->
			<jsp:include page="../../down.jsp">
		<jsp:param value="4" name="cmd"/>
	</jsp:include>
	</body>
</html>
