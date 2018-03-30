<%@page pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
	<meta charset="UTF-8">
	<title>常见问题</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/web/Module/aboutUs/css/aboutUs.css">
</head>
<body>
<strong class="rightTit"><span></span>${problem.subject }</strong>
<div class="rightCon">
	${problem.answer }
</div>
</body>
</html>