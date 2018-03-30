<%@page pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
	<meta charset="UTF-8">
	<title>常见问题内容详情</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/web/Module/personalCen/css/usualQuestion.css">
</head>
<body>
		<!-- 顶部副导航 -->
		<%@ include file="../../head.jsp"%>  
		<!-- 个人中心内容 -->
		<div class="personalCenCon clearfix w1100">
			<div class="rightPersonal fr">
				<strong class="rightTit"><span></span>常见问题
						<b>&nbsp;&gt;&nbsp;${problem.subject }</b>
						<a href="">返回列表&gt;&gt;</a>
				</strong>
				<div class="rightCon">
					<div class="usualQueWrap">
						${problem.answer }
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
