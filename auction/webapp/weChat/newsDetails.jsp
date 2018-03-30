<%@ page contentType="text/html;charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0"/>
<link href="css/main.min.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/aui.css" />
<title>商家帮-单页详情</title>
</head>
<body>
	<header class="aui-bar aui-bar-nav aui-bar-light" style="position: fixed;left:0;top:0;height:2rem;">
		<a class="aui-pull-left aui-btn" tapmode onclick="history.go(-1)">
			<span class="aui-iconfont aui-icon-left" style="color:#333;font-size:1rem;"></span>
		</a>
	</header>
	<div class="box" style="margin-top:2rem;">
		<div class="news_t">${news.title}</div>
		<div class="news_t1"> <span> ${news.addTime} </span>
		</div>
		<div id="content" class="news">
			${news.content}
		</div>
	</div>
	<jsp:include page="nav.jsp"/>
</body>
</html>