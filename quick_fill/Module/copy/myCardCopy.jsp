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
<title>我的电卡</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/weChat/css/reset.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/weChat/Module/myElecCard/css/myElecCard.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/weChat/Module/copy/copyJs.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/weChat/jsPlugin/jquery.min.js"></script>
</head>
<body class="bodyPadBot">
	<%
		List<Map<String, Object>> i = (List<Map<String, Object>>) session.getAttribute("getByUser");
	%>
	<!-- 个人用户信息 -->
	<div class="perInfos">
		<div class="perImg fl">
			<img src="<%=i.get(0).get("we_image")%>"
				class="avatar aui-img-round">
		</div>
		<div class="perInfoTxt fl">
			<strong><%=i.get(0).get("name")%>小区</strong>
			<p>
				用户编号：<span id="byuser"><%=i.get(0).get("account")%></span>
			</p>
			<p>
				赠送余额：<%=i.get(0).get("dummy_balance")%>元
			</p>
			<p>
				账户余额：<%=i.get(0).get("balance")%>元
			</p>
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
	<div class="addCardDiv">
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
	<jsp:include page="../../down.jsp">
		<jsp:param value="4" name="cmd"/>
	</jsp:include>
	<script
		src="${pageContext.request.contextPath}/weChat/jsPlugin/tipInfo.js"></script>
	<script type="text/javascript">
		$(function() {
			//toast("此卡号已被其他用户绑定");
		});
	</script>
</body>
</html>