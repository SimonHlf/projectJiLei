<!DOCTYPE html>
<%@page pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0" />
<title>我的电卡</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/weChat/css/reset.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/weChat/Module/myElecCard/css/myElecCard.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/weChat/Module/myElecCard/js/myElecCard.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/weChat/jsPlugin/jquery.min.js"></script>
</head>
<body class="bodyPadBot">
	<!-- 个人用户信息 -->
	<div class="perInfos">
		<div class="perImg fl">
			<img src="${sessionScope.fontUser.weImage }"
				class="avatar aui-img-round">
		</div>
		<div class="perInfoTxt fl">
			<strong> <c:if test="${sessionScope.fontUser.regionId == null}">暂无小区</c:if>
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
	<!-- 我的电卡list -->
	<div class="myElcCardLists">
		<p class="tipTxtP">每个用户最多绑定5张IC卡</p>
		<div class="listsCard">
			<strong class="comStrongTit">我的电卡</strong>
			<ul class="clearfix">
				<c:forEach items="${list}" var="list">
					<li>
						<p>电卡编号:${list.number}</p> <a href="javascript:void(0)"
						onclick="userDelCard(${list.id})">删除</a>
					</li>
				</c:forEach>
			</ul>
		</div>
		<div class="addElcCard">
			<button onclick="comEditShowAlert('addCardDiv')">绑定电卡</button>
		</div>
	</div>
	<div class="layer"></div>
	<!-- 增加电卡弹窗 -->
	<div class="comEditDiv addCardDiv">
		<input id="addCardInp" type="text" placeholder="请输入卡号" />
		<button class="comTwoBtn twoBtn_cancel"
			onclick="closeAlert($('.addCardDiv'))">取消</button>
		<button class="comTwoBtn twoBtn_sure" onclick="binding()">添加</button>
	</div>
	<div class="toast-wrap">
		<span class="toast-msg"></span>
	</div>
	<!-- confirm -->
	<div class="confirmDiv">
		<p>删除后此电卡将无法使用</p>
		<p>请确认要从账户中删除此电卡？</p>
		<div class="confirmImg"></div>
		<button class="comTwoBtn twoBtn_cancel"
			onclick="closeAlert($('.confirmDiv'))">取消</button>
		<button class="comTwoBtn twoBtn_sure">确定</button>
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
	<script src="${pageContext.request.contextPath}/weChat/jsPlugin/jquery.min.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/weChat/jsPlugin/tipInfo.js"></script>
	<script type="text/javascript">
			$(function(){
				//toast("此卡号已被其他用户绑定");
			});
		</script>
</body>
</html>