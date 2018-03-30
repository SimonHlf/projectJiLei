<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
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
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/webAndroid/dist/css/reset.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/webAndroid/dist/css/com/headercom1.css">
		<link rel="stylesheet"  href="${pageContext.request.contextPath }/webAndroid/dist/css/person/person.css">
		<link rel="stylesheet" type="text/css"  href="${pageContext.request.contextPath }/webAndroid/jslib/swiper/css/swiper-3.4.1.min.css" />
		<script src="${pageContext.request.contextPath }/webAndroid/js/jquery-1.11.0.js" ></script>
		<script src="${pageContext.request.contextPath }/webAndroid/jslib/swiper/js/swiper-3.4.1.min.js" ></script>
		<script src="${pageContext.request.contextPath }/webAndroid/js/com/com.js" ></script>
	</head>
	<body>
		<!---------------------------个人中心---------------------------------->
		<div id="container">
			<header id="aboutHeader">
				<div class="aBack">
					<a href="#"><em class="iconfont">&#xe600;</em></a>
				</div>
				<div class="aUs">个人中心</div>
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
					<a href="index.html">
						<em class="iconfont">&#xe636;</em><span>购物车</span>
					</a>
				</li>
				<li>
					<a href="person.html">
						<em class="iconfont">&#xe607;</em><span>个人中心</span>
					</a>
				</li>
			</ul>
			<!-------------------------------main区--------------------------->
			<div id="main">
				<div class="perMsg">
					<div class="top">
						<a href="accountmanagement.html"><em class="iconfont">&#xe65b;</em><span>账户管理</span></a>
					</div>
					<div class="btm">
						<div class="perImg">
							<img src="../../image/person/presonImg1.jpg" alt=""/>
						</div>
						<div class="right">
							<p>昵称:
							<c:if test="${user.nickname == ''}">暂无昵称</c:if>
							<c:if test="${user.nickname != ''}">${user.nickname }</c:if>
							</p>
							<p>登录名:${user.useraccount}</p>
							<!-- <p>金牌运营商</p> -->
						</div>
					</div>
				</div>
				<div class="kong"></div>
				<div class="orderLists">
					<div class="orderTitle">
						<p><span>我的订单</span><a href="/src/html/person/order/order.html">查看更多></a></p>
					</div>
					<ul class="orderItem">
						<li>
							<a href="/src/html/person/order/obligation.html">
								<em class="iconfont">&#xe60b;</em>
								<p>待付款</p>
							</a>
						</li>
						<li>
							<a href="/src/html/person/order/pendingdelivery.html">
								<em class="iconfont">&#xe633;</em>
								<p>代发货</p>
							</a>
						</li>
						<li>
							<a href="/src/html/person/order/receipt.html">
								<em class="iconfont">&#xe60c;</em>
								<p>待收货</p>
							</a>
						</li>
						<li>
							<a href="/src/html/person/order/waitevaluate.html">
								<em class="iconfont">&#xe621;</em>
								<p>待评价</p>
							</a>
						</li>
					</ul>
				</div>
				<div class="kong"></div>
				<ul class="othertLists">
						<li>
							<a href="#">
								<span class="iconfont">￥</span>
								<p>零钱余额</p>
							</a>
						</li>
						<li>
							<a href="/src/html/kind/point/point.html">
								<span class="iconfont">${user.parentintegral }积分</span>
								<p>我的积分</p>
							</a>
						</li>
						<li>
							<a href="/src/html/kind/gold/gold.html">
								<span class="iconfont">${user.parentgold }金币</span>
								<p>金币</p>
							</a>
						</li>
						<li>
							<a href="#">
								<span class="iconfont">￥</span>
								<p>共计消费</p>
							</a>
						</li>
					</ul>
					<div class="kong"></div>
					<ul class="moreLists">
						<li>
							<a href="/src/html/cart/cart.html">
								<em class="iconfont" style="color:#f2575b;">&#xe636;</em>
								<p>购物车</p>
							</a>
						</li>
						<li>
							<a href="#">
								<em class="iconfont" style="color:#e3c63c;">&#xe608;</em>
								<p>积分</p>
							</a>
						</li>
						<li>
							<a href="/src/html/kind/sell/sell.html">
								<em class="iconfont" style="color:#ac3411;">&#xe6ba;</em>
								<p>拍卖</p>
							</a>
						</li>
						<li>
							<a href="address.html">
								<em class="iconfont" style="color:#3f8ff0;">&#xe604;</em>
								<p>收货地址</p>
							</a>
						</li>
						<li>
							<a href="commission/revenue.html">
								<em class="iconfont" style="color:#e3c63c;">&#xe621;</em>
								<p>佣金</p>
							</a>
						</li>
						<li>
							<a href="merchatssettled.html">
								<em class="iconfont" style="color:#44b6c0;">&#xe63f;</em>
								<p>商家入住</p>
							</a>
						</li>
					</ul>
					<div class="kong"></div>
					<div class="uLike">
			    	<div class="likeTitle">
			    		<span class="bar"></span><a href="" class="text"><span>推荐商品</span></a><a href="more.html" class='next'><span class="pro">查看更多></span></a>
			    	</div>
			    	<ul class="likeLists">
			    		<li class="item">
			    			<a class="imgBox" href="detail.html">
			    				<img src="../../image/home/prolist.jpg" alt=""/>
			    			</a>
			    			<p class="desc"><strong>【包邮】</strong><span>水晶翡翠</span></p>
			    			<p class="price"><span>￥2353.00</span><a href="detail.html">去看看</a></p>
			    		</li>
			    		<li class="item">
			    			<a class="imgBox" href="detail.html">
			    				<img src="../../image/home/prolist.jpg" alt=""/>
			    			</a>
			    			<p class="desc"><strong>【包邮】</strong><span>水晶翡翠</span></p>
			    			<p class="price"><span>￥2353.00</span><a href="detail.html">去看看</a></p>
			    		</li>
			    		<li class="item">
			    			<a class="imgBox" href="detail.html">
			    				<img src="../../image/home/prolist.jpg" alt=""/>
			    			</a>
			    			<p class="desc"><strong>【包邮】</strong><span>水晶翡翠</span></p>
			    			<p class="price"><span>￥2353.00</span><a href="detail.html">去看看</a></p>
			    		</li>
			    		<li class="item">
			    			<a class="imgBox" href="detail.html">
			    				<img src="../../image/home/prolist.jpg" alt=""/>
			    			</a>
			    			<p class="desc"><strong>【包邮】</strong><span>水晶翡翠</span></p>
			    			<p class="price"><span>￥2353.00</span><a href="detail.html">去看看</a></p>
			    		</li>
			    		<li class="item">
			    			<a class="imgBox" href="detail.html">
			    				<img src="../../image/home/prolist.jpg" alt=""/>
			    			</a>
			    			<p class="desc"><strong>【包邮】</strong><span>水晶翡翠</span></p>
			    			<p class="price"><span>￥2353.00</span><a href="detail.html">去看看</a></p>
			    		</li>
			    		<li class="item">
			    			<a class="imgBox" href="detail.html">
			    				<img src="../../image/home/prolist.jpg" alt=""/>
			    			</a>
			    			<p class="desc"><strong>【包邮】</strong><span>水晶翡翠</span></p>
			    			<p class="price"><span>￥2353.00</span><a href="detail.html">去看看</a></p>
			    		</li>
			    		<li class="item">
			    			<a class="imgBox" href="detail.html">
			    				<img src="../../image/home/prolist.jpg" alt=""/>
			    			</a>
			    			<p class="desc"><strong>【包邮】</strong><span>水晶翡翠</span></p>
			    			<p class="price"><span>￥2353.00</span><a href="detail.html">去看看</a></p>
			    		</li>
			    		<li class="item">
			    			<a class="imgBox" href="detail.html">
			    				<img src="../../image/home/prolist.jpg" alt=""/>
			    			</a>
			    			<p class="desc"><strong>【包邮】</strong><span>水晶翡翠</span></p>
			    			<p class="price"><span>￥2353.00</span><a href="detail.html">去看看</a></p>
			    		</li>
			    		<li class="item">
			    			<a class="imgBox" href="detail.html">
			    				<img src="../../image/home/prolist.jpg" alt=""/>
			    			</a>
			    			<p class="desc"><strong>【包邮】</strong><span>水晶翡翠</span></p>
			    			<p class="price"><span>￥2353.00</span><a href="detail.html">去看看</a></p>
			    		</li>
			    	</ul>
			    </div>
			</div>
		</div>
	</body>
</html>
