<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no"/>
	<meta name="format-detection" content="telephone=no" />
	<meta name="format-detection" content="email=no" />
	<meta name="apple-mobile-web-app-capable" content="yes" />
	<meta name="apple-mobile-web-app-status-bar-style" content="black" />
	<title>玉商通</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/webAndroid/dist/css/reset.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/webAndroid/dist/css/com/headercom2.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/webAndroid/dist/css/kind/auction/auction.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/webAndroid/jslib/swiper/css/swiper-3.4.1.min.css">
	<script src="${pageContext.request.contextPath}/webAndroid/js/jquery-1.11.0.js" ></script>
	<script src="${pageContext.request.contextPath}/webAndroid/jslib/swiper/js/swiper-3.4.1.min.js" ></script>
	<script src="${pageContext.request.contextPath}/webAndroid/js/kind/prokind/kind.js" ></script>
	<script src="${pageContext.request.contextPath}/webAndroid/js/com/com.js" ></script>
</head>
<body>
		<div id="container">
			<!-------------------------竟拍专区------------------------>
			<header id="aboutHeader">
				<div class="aBack">
					<a href="javascript:void(0);"><em class="iconfont">&#xe600;</em></a>
				</div>
				<div class="aUs">拍卖专区</div>
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
			<!--------------------------main-------------------------------->
			<div id="main">
				<ul class="mainCon">
					<li>
						<a href="auctiondetail.html">
							<div class="left">
								<img src="../../../image/kind/youpro.jpg" alt=""/>
							</div>
							<div class="right">
								<p>果敢翡翠果敢翡翠果敢翡翠果敢翡翠果敢翡翠果敢翡翠果敢翡翠翠果敢翡翠果敢翡翠果敢翡翠</p>
								<p>距结束<span>07</span>时<span>28</span>分<span>18</span>秒</p>
								<button>已竞拍150次</button>
							</div>
						</a>
					</li>
					<li>
						<a href="#">
							<div class="left">
								<img src="../../../image/kind/youpro.jpg" alt=""/>
							</div>
							<div class="right">
								<p>果敢翡翠果敢翡翠果敢翡翠果敢翡翠果敢翡翠果敢翡翠果敢翡翠翠果敢翡翠果敢翡翠果敢翡翠</p>
								<p>距结束<span>07</span>时<span>28</span>分<span>18</span>秒</p>
								<button>已竞拍150次</button>
							</div>
						</a>
					</li>
					<li>
						<a href="#">
							<div class="left">
								<img src="../../../image/kind/youpro.jpg" alt=""/>
							</div>
							<div class="right">
								<p>果敢翡翠果敢翡翠果敢翡翠果敢翡翠果敢翡翠果敢翡翠果敢翡翠翠果敢翡翠果敢翡翠果敢翡翠</p>
								<p>距结束<span>07</span>时<span>28</span>分<span>18</span>秒</p>
								<button>已竞拍150次</button>
							</div>
						</a>
					</li>
					<li>
						<a href="#">
							<div class="left">
								<img src="../../../image/kind/youpro.jpg" alt=""/>
							</div>
							<div class="right">
								<p>果敢翡翠果敢翡翠果敢翡翠果敢翡翠果敢翡翠果敢翡翠果敢翡翠翠果敢翡翠果敢翡翠果敢翡翠</p>
								<p>距结束<span>07</span>时<span>28</span>分<span>18</span>秒</p>
								<button>已竞拍150次</button>
							</div>
						</a>
					</li>
				</ul>
			</div>		
		</div>
	</body>
</html>
