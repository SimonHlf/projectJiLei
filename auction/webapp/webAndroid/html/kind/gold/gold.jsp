<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/webAndroid/dist/css/com/headercom2.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/webAndroid/dist/css/com/shaiX.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/webAndroid/dist/css/kind/point/pointarea.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/webAndroid/dist/css/com/maincom1.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/webAndroid/jslib/swiper/css/swiper-3.4.1.min.css" />
		<script src="${pageContext.request.contextPath }/webAndroidjs/jquery-1.11.0.js"></script>
		<script src="${pageContext.request.contextPath }/webAndroidjslib/swiper/js/swiper-3.4.1.min.js"></script>
		<script src="${pageContext.request.contextPath }/webAndroidjs/kind/point/point.js"></script>
		<script src="${pageContext.request.contextPath }/webAndroidjs/com/com.js"></script>
	</head>
	<body>
		<!-------------------------积分专区头部------------------------>
		<div id="container">
			<header id="aboutHeader">
				<div class="aBack">
					<a href="javascript:void(0);"><em class="iconfont">&#xe600;</em></a>
				</div>
				<div class="aUs">金币兑换</div>
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
		
			<!-------------------------nav----------------------------------->
			<nav id="nav">
				<ul class="youlists">
					<li class="active">
						<a href="gold.html">
							<span>综合</span><em class="iconfont">&#xe651;</em>
						</a>
					</li>
					<li>
						<a href="goldprice.html">
							<span>价格</span><em class="iconfont">&#xe7b1;</em>
						</a>
					</li>
					<li>
						<a href="goldsalesvolume.html">
							<span>销量</span>
						</a>
					</li>
					<li>
						<a href="javascript:void(0);">
							<span id="select">筛选</span>
						</a>
					</li>
				</ul>
			</nav>
			<!----------------------------------main------------------------>
			<div id="main">
			
			<c:forEach var="n" items="${list}">
				<a class="mainBox" href="detail.html">
					<div class="mainLeft">
						<img src="/${n.thumbnailurl}" alt="" title='' />
					</div>
					<div class="mainRight">
						<p class="mainText">${n.name}</p>
						<p class="pointSum">${n.price}金币</p>
						<p class="saveMoney">这里是优惠活动这里是优惠活动</p>
					</div>
				</a>
			</c:forEach>

			</div>
			
			<!-------------------------筛选区---------------------------->
				<div id="shaiX">
					<div class="shaiLeft">
						<em class="iconfont iconBox">&#xe600;</em>
					</div>
					<div class="shaiRight">
						<div class="tit">
							<h4>价格区间</h4>
							<p class="titTop"><span>最低价</span><span>-</span><span>最高价</span></p>
							<p class="titBtm"><span>0-500</span><span>500-1000</span><span>1000-3000</span></p>
						</div>
						<div class="tit">
							<h4>题材分类</h4>
							<p class="titBtm"><span>笑佛</span><span>观音</span><span>生肖</span></p>
						</div>
						<div class="tit">
							<h4>首饰玉器</h4>
							<p class="titBtm"><span>手镯</span><span>手链</span><span>项链</span></p>
						</div>
						<div class="tit">
							<h4>配饰玉器</h4>
							<p class="titBtm"><span>挂件</span><span>手玩件</span><span>玉牌</span></p>
						</div>
						<div class="tit">
							<h4>颜色分类</h4>
							<p class="titBtm"><span>羊脂玉</span><span>白玉</span><span>糖白玉</span></p>
						</div>
						<div class="tit">
							<h4>重量分类</h4>
							<p class="titBtm"><span>20g以下</span><span>20-60g</span><span>61-120g</span></p>
						</div>
						<div class='btm'>
							<span>重置</span><span>确定</span>
						</div>
					</div>
				</div>
		</div>
	</body>
</html>
