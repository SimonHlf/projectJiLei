<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<meta name="format-detection" content="telephone=no" />
		<meta name="format-detection" content="email=no" />
		<meta name="apple-mobile-web-app-capable" content="yes" />
		<meta name="apple-mobile-web-app-status-bar-style" content="black" />
		<title>玉商通</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/webAndroid/dist/css/reset.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/webAndroid/dist/css/com/headercom1.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/webAndroid/dist/css/kind/culture/artistsmsg.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/webAndroid/jslib/swiper/css/swiper-3.4.1.min.css" />
		<script src="${pageContext.request.contextPath }/webAndroid/js/jquery-1.11.0.js"></script>
		<script src="${pageContext.request.contextPath }/webAndroid/jslib/swiper/js/swiper-3.4.1.min.js"></script>
		<script src="${pageContext.request.contextPath }/webAndroid/js/kind/culture/artistsmsg.js"></script>
		<script src="${pageContext.request.contextPath }/webAndroid/js/com/com.js"></script>
	</head>

	<body>
		<!--------------------------艺术家档案---------------------------->
		<div id="container">
			<header id="aboutHeader">
				<div class="aBack">
					<a href="#"><em class="iconfont">&#xe600;</em></a>
				</div>
				<div class="aUs">艺术家档案</div>
				<div class="aMore">
					<em class="iconfont">&#xe617;</em>
				</div>
			</header>
			<!----------------------------morelistss--------------------------->
			<ul id="moreCon">
				<li class="active">
					<a href="/src/html/home/index.html">
						<em class="iconfont">&#xe6d9;</em><span>首页</span>
					</a>
				</li>
				<li>
					<a href="/src/html/kind/prokind/kind.html">
						<em class="iconfont">&#xe601;</em><span>分类搜索</span>
					</a>
				</li>
				<li>
					<a href="/src/html/cart/cart.html">
						<em class="iconfont">&#xe636;</em><span>购物车</span>
					</a>
				</li>
				<li>
					<a href="/src/html/person/person.html">
						<em class="iconfont">&#xe607;</em><span>个人中心</span>
					</a>
				</li>
			</ul>
			<!-------------------------------main区--------------------------->
			<div id="artMain">
				<div class="artPht">
					<div class="phtBox">
						<img src="/${metaInfo.p" alt="" title="" />
					</div>
					<div class="artJs">
						<p class="title">|&nbsp;&nbsp;艺术家介绍&nbsp;&nbsp;|</p>
						<p class="artName">${metaInfo.name}</p>
						<p class="level">${metaInfo.positio}</p>
					</div>
				</div>
				<div class="perTitle">
					<p class="perText">|&nbsp;&nbsp;个人简介&nbsp;&nbsp;|</p>
				</div>
				<div class="personMsg">
					<p class="content">${metaInfo.brief}
					</p>
				</div>
				<div class="perTitle">
					<p class="perText">|&nbsp;&nbsp;艺术家年表&nbsp;&nbsp;|</p>
				</div>
				<table class="txtCon">
					${metaInfo.chronology}
					<!-- <tr class="txt">
						<td>1964年</td>
						<td>入新疆玉雕厂从事玉雕工作</td>
					</tr>
					<tr class="txt">
						<td>1964年</td>
						<td>入新疆玉雕厂从事玉雕工作</td>
					</tr> -->
				</table>
				<div class="perTitle">
					<p class="perText">|&nbsp;&nbsp;获奖情况&nbsp;&nbsp;|</p>
				</div>
				<div class="honorLists">
					<p class="honorItem"> ${metaInfo.award}</p>
					<!-- <p class="honorItem"><span>2004年</span>《白玉错金嵌玉石》荣获中国玉石雕刻作品天工奖银奖。</p> -->
					
				</div>
				<div class="perTitle">
					<p class="perText">|&nbsp;&nbsp;代表作品&nbsp;&nbsp;|</p>
				</div>
				<!----------------------作品展示--------------------->
				<ul class="artZp">
					<%-- <li>
						<a href="#">
							<img src="${pageContext.request.contextPath }/webAndroid/image/kind/artZp.jpg" alt="" title="" />
						</a>
					</li> --%>
					  ${metaInfo.representwork}
				</ul>

			</div>
		</div>
	</body>

</html>