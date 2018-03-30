<%@page pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
	<meta charset="UTF-8">
	<title>常见问题</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/web/Module/personalCen/css/usualQuestion.css">
</head>
<body>
		<!-- 顶部副导航 -->
		<%@ include file="../../head.jsp"%>  
		<!-- 个人中心内容 -->
		<div class="personalCenCon clearfix w1100">
			<div class="rightPersonal fr">
				<strong class="rightTit"><span></span>常见问题</strong>
				<div class="rightCon">
					<div class="usualQueWrap">
						<ul class="listQues">
							<c:forEach items="${list }" var="problem">
								<li>
									<p>
										<a class="ellip" href="${pageContext.request.contextPath}/web/aboutUs/toProlemDetail.htm?id=${problem.id}">${problem.subject }</a>
									</p>
									<span>${problem.addTime }</span>
								</li>
							</c:forEach>
						</ul>
						<!-- <div id="detialQuesCon">
						</div> -->
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
