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
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/webAndroid/dist/css/home/home.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/webAndroid/jslib/swiper/css/swiper-3.4.1.min.css">
	<script src="${pageContext.request.contextPath}/webAndroid/js/jquery-1.11.0.js" ></script>
	<script src="${pageContext.request.contextPath}/webAndroid/jslib/swiper/js/swiper-3.4.1.min.js" ></script>
	<script src="${pageContext.request.contextPath}/webAndroid/js/home/index.js" ></script>
</head>
<body>
	<div id="homeContainer">
	    <div class='homeHeader'>
	    	<a class='headerLeft' href="search.html">
	    		<input class="inpt" type="text" placeholder="翡翠玉"/><img class="search" src="${pageContext.request.contextPath}/webAndroid/image/home/search.png" />
	    	</a>
	    	<a href="${pageContext.request.contextPath}/web/android/userLogin/getLoginJsp.htm" class="headerRight">
	    		登录
	    	</a>
	    </div>
	    <!--------------------轮播图--------------->
	     <div class="banner-con">
	 	    <div class="swiper-container">
			    <div class="swiper-wrapper">
			    	<c:forEach items="${adList }" var="adList">
			    		<div class="swiper-slide"><a href="${pageContext.request.contextPath}/${adList.jumpUrl}"><img src="/${adList.imgUrl }" title='' alt=''/ ></a></div>
			    	</c:forEach>
			    </div>
			    <!-- 如果需要分页器 -->
			    <div class="swiper-pagination"></div>
	       </div>
       </div>
	    <!--------------------分类-------------------------->
	    <div class="kong"></div>
	    <ul class="kindPro">
	    	<li>
	    		<a href="${pageContext.request.contextPath }/web/android/youLeBuyApp/toYouleBuyJsp.htm">
	    			<img src="${pageContext.request.contextPath}/webAndroid/image/home/buy.jpg" alt="" />
	    		</a>
	    		<span>优乐购</span>
	    	</li>
	    	<li>
	    		<a href="${pageContext.request.contextPath }/web/android/jiFenBuyApp/toJifenJsp.htm">
	    			<img src="${pageContext.request.contextPath}/webAndroid/image/home/jifen.jpg" alt="" />
	    		</a>
	    		<span>积分兑换</span>
	    	</li>
	    	<li>
	    		<a href="${pageContext.request.contextPath}/webAndroid/android/auction/list.htm">
	    			<img src="${pageContext.request.contextPath}/webAndroid/image/home/mai.jpg" alt="" />
	    		</a>
	    		<span>拍卖</span>
	    	</li>
	    	<li>
	    		<a href="${pageContext.request.contextPath }/web/android/metaApp/metaList.htm">
	    			<img src="${pageContext.request.contextPath}/webAndroid/image/home/wenh.jpg" alt="" />
	    		</a>
	    		<span>文化荟萃</span>
	    	</li>
	    </ul>
	    <!-----------------------------分类---------------------------------->
	    <div class="kindCon">
	    	<div class="buyCon">
	    		<a href="/src/html/kind/youlgou/youlgou.html" class="gou">
	    			<h3>优乐购</h3>
	    		    <p>精选优质产品</p>
	    		    <div class="box"><img src="${pageContext.request.contextPath}/webAndroid/image/home/pro.png" alt="" /></div>
	    		</a>
	    	</div>
	    	<ul class='otherCon'>
	    		<li >
	    			<a href="/src/html/kind/point/point.html">
			    		<h3>积分兑换</h3>
			    		 <p>精选优质产品</p>
			    		 <div class="boxI"><img src="${pageContext.request.contextPath}/webAndroid/image/home/webyu.jpg" alt="" /></div>
		    	   </a>
	    		</li>
		    	<li >
	    			<a href="/src/html/kind/sell/sell.html">
			    		<h3>拍卖</h3>
			    		 <p>精选优质产品</p>
			    		 <div class="boxI"><img src="${pageContext.request.contextPath}/webAndroid/image/home/webyu.jpg" alt="" /></div>
		    	   </a>
	    		</li>
	    		<li >
	    			<a href="/src/html/kind/gold/gold.html">
			    		<h3>金币购买</h3>
			    		 <p>精选优质产品</p>
			    		 <div class="boxI"><img src="${pageContext.request.contextPath}/webAndroid/image/home/webyu.jpg" alt="" /></div>
		    	   </a>
	    		</li>
	    		<li >
	    			<a href="/src/html/kind/culture/culture.html">
			    		<h3>文化荟萃</h3>
			    		 <p>精选优质产品</p>
			    		 <div class="boxI"><img src="${pageContext.request.contextPath}/webAndroid/image/home/webyu.jpg" alt="" /></div>
		    	   </a>
	    		</li>
	    	</ul>
	    </div>
	    <div class="kong"></div>
	    <!------------------------------------限时秒杀----------------------------------->
	    <div class="limitT">
	    	<div class="title">
	    		<span class="bar"></span><span class="text">限时秒杀</span><a href="" class='next'><span class="pro">秒杀好货></span></a>
	    	</div>
	    	<ul class="proList">
	    		<li>
	    			<a class="imgA" href="detail.html">
	    				<img class="proimg" src="${pageContext.request.contextPath}/webAndroid/image/home/pro.png" alt=""/>
	    			</a>
	    				<p>￥13436.00</p>
	    				<a class="btn" href="detail.html">马上抢</a>
	    				<img class="msBg" src="${pageContext.request.contextPath}/webAndroid/image/home/ms_bg.png" alt="" />
	    				<!--<span class="msBg"></span>-->
	    			
	    		</li>
	    		<li>
	    			<a class="imgA" href="detail.html">
	    				<img class="proimg" src="${pageContext.request.contextPath}/webAndroid/image/home/pro.png" alt=""/>
	    			</a>
	    				<p>￥13436.00</p>
	    				<a class="btn" href="detail.html">马上抢</a>
	    				<img class="msBg" src="${pageContext.request.contextPath}/webAndroid/image/home/ms_bg.png" alt="" />
	    			
	    		</li>
	    		<li>
	    			<a class="imgA" href="detail.html">
	    				<img class="proimg" src="${pageContext.request.contextPath}/webAndroid/image/home/pro.png" alt=""/>
	    			</a>
	    				<p>￥1343.00</p>
	    				<a class="btn" href="detail.html">马上抢</a>
	    				<img class="msBg" src="${pageContext.request.contextPath}/webAndroid/image/home/ms_bg.png" alt="" />
	    			
	    		</li>
	    		<li>
	    			<a class="imgA" href="detail.html">
	    				<img class="proimg" src="${pageContext.request.contextPath}/webAndroid/image/home/pro.png" alt=""/>
	    			</a>
	    				<p>￥1343.00</p>
	    				<a class="btn" href="detail.html">马上抢</a>
	    				<img class="msBg" src="${pageContext.request.contextPath}/webAndroid/image/home/ms_bg.png" alt="" />
	    		</li>
	    	</ul>
	    </div>
	    
	    <!---------------猜你喜欢--------------->
	    <div class="uLike">
	    	<div class="likeTitle">
	    		<span class="bar"></span><a href="" class="text"><span>猜你喜欢</span></a><a href="more.html" class='next'><span class="pro">查看更多></span></a>
	    	</div>
	    	<ul class="likeLists">
	    		<li class="item">
	    			<a class="imgBox" href="/src/html/detail/detail.html">
	    				<img src="${pageContext.request.contextPath}/webAndroid/image/home/prolist.jpg" alt=""/>
	    			</a>
	    			<p class="desc"><strong>【包邮】</strong><span>水晶翡翠</span></p>
	    			<p class="price"><span>￥2353.00</span><a href="detail.html">去看看</a></p>
	    		</li>
	    		<li class="item">
	    			<a class="imgBox" href="/src/html/detail/detail.html">
	    				<img src="${pageContext.request.contextPath}/webAndroid/image/home/prolist.jpg" alt=""/>
	    			</a>
	    			<p class="desc"><strong>【包邮】</strong><span>水晶翡翠</span></p>
	    			<p class="price"><span>￥2353.00</span><a href="detail.html">去看看</a></p>
	    		</li>
	    		<li class="item">
	    			<a class="imgBox" href="/src/html/detail/detail.html">
	    				<img src="${pageContext.request.contextPath}/webAndroid/image/home/prolist.jpg" alt=""/>
	    			</a>
	    			<p class="desc"><strong>【包邮】</strong><span>水晶翡翠</span></p>
	    			<p class="price"><span>￥2353.00</span><a href="detail.html">去看看</a></p>
	    		</li>
	    		<li class="item">
	    			<a class="imgBox" href="/src/html/detail/detail.html">
	    				<img src="${pageContext.request.contextPath}/webAndroid/image/home/prolist.jpg" alt=""/>
	    			</a>
	    			<p class="desc"><strong>【包邮】</strong><span>水晶翡翠</span></p>
	    			<p class="price"><span>￥2353.00</span><a href="detail.html">去看看</a></p>
	    		</li>
	    		<li class="item">
	    			<a class="imgBox" href="/src/html/detail/detail.html">
	    				<img src="${pageContext.request.contextPath}/webAndroid/image/home/prolist.jpg" alt=""/>
	    			</a>
	    			<p class="desc"><strong>【包邮】</strong><span>水晶翡翠</span></p>
	    			<p class="price"><span>￥2353.00</span><a href="detail.html">去看看</a></p>
	    		</li>
	    		<li class="item">
	    			<a class="imgBox" href="detail.html">
	    				<img src="${pageContext.request.contextPath}/webAndroid/image/home/prolist.jpg" alt=""/>
	    			</a>
	    			<p class="desc"><strong>【包邮】</strong><span>水晶翡翠</span></p>
	    			<p class="price"><span>￥2353.00</span><a href="detail.html">去看看</a></p>
	    		</li>
	    		<li class="item">
	    			<a class="imgBox" href="detail.html">
	    				<img src="${pageContext.request.contextPath}/webAndroid/image/home/prolist.jpg" alt=""/>
	    			</a>
	    			<p class="desc"><strong>【包邮】</strong><span>水晶翡翠</span></p>
	    			<p class="price"><span>￥2353.00</span><a href="detail.html">去看看</a></p>
	    		</li>
	    		<li class="item">
	    			<a class="imgBox" href="detail.html">
	    				<img src="${pageContext.request.contextPath}/webAndroid/image/home/prolist.jpg" alt=""/>
	    			</a>
	    			<p class="desc"><strong>【包邮】</strong><span>水晶翡翠</span></p>
	    			<p class="price"><span>￥2353.00</span><a href="detail.html">去看看</a></p>
	    		</li>
	    		<li class="item">
	    			<a class="imgBox" href="detail.html">
	    				<img src="${pageContext.request.contextPath}/webAndroid/image/home/prolist.jpg" alt=""/>
	    			</a>
	    			<p class="desc"><strong>【包邮】</strong><span>水晶翡翠</span></p>
	    			<p class="price"><span>￥2353.00</span><a href="detail.html">去看看</a></p>
	    		</li>
	    	</ul>
	    </div>
	    <!--底部-->
	    <ul class="footer">
	    	<li class="active">
	    		<a href="index.html">
	    			<div class="icon"><em class="iconfont">&#xe6d9;</em></div>
	    			<p>首页</p>
	    		</a>
	    	</li>
	    	<li>
	    		<a href="${pageContext.request.contextPath}/web/android/categoryApp/toCategoryJsp.htm">
	    			<div class="icon"><em class="iconfont">&#xe601;</em></div>
	    			<p>分类</p>
	    		</a>
	    	</li>
	    	<li>
	    		<a href="/src/html/kind/auction/auction.html">
	    			<div class="icon"><em class="iconfont">&#xe602;</em></div>
	    			<p>拍卖</p>
	    		</a>
	    	</li>
	    	<li>
	    		<a href="/src/html/cart/cart.html">
	    			<div class="icon"><em class="iconfont">&#xe636;</em></div>
	    			<p>购物车</p>
	    		</a>
	    	</li>
	    	<li>
	    		<a href="${pageContext.request.contextPath}/web/android/userCenterApp/toUserCenter.htm">
	    			<div class="icon"><em class="iconfont">&#xe607;</em></div>
	    			<p>个人中心</p>
	    		</a>
	    	</li>
	    </ul>
	</div>
	</body>
</html>
