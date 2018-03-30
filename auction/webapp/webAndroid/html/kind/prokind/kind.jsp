<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<meta name="format-detection" content="telephone=no" />
		<meta name="format-detection" content="email=no" />
		<meta name="apple-mobile-web-app-capable" content="yes" />
		<meta name="apple-mobile-web-app-status-bar-style" content="black" />
		<title>玉商通</title>
	</head>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/webAndroid/dist/css/reset.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/webAndroid/dist/css/com/headercom3.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/webAndroid/dist/css/kind/prokind/kind.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/webAndroid/jslib/swiper/css/swiper-3.4.1.min.css" />
	<script src="${pageContext.request.contextPath }/webAndroid/js/jquery-1.11.0.js"></script>
	<script src="${pageContext.request.contextPath }/webAndroid/jslib/swiper/js/swiper-3.4.1.min.js"></script>
	<script src="${pageContext.request.contextPath }/webAndroid/js/kind/prokind/kind.js"></script>
    <script src="${pageContext.request.contextPath }/webAndroid/js/com/com.js"></script>
	<body>
		<div id="container">
			<!---------------------------分类页头部headercom3--------------------------------->
			<header id="header">
				<div class="aBack">
					<a href="#"><em class="iconfont">&#xe600;</em></a>
				</div>
				<a class="aUs" href="search.html">
					<em class="iconfont">&#xe616;</em><input class="inpt" type="text" placeholder="翡翠玉" />
				</a>
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
			    		<a href="index.html">
			    			<em class="iconfont">&#xe607;</em><span>个人中心</span>
			    		</a>
			    	</li>
				</ul>
			<!---------------------------main----------------------------------->
			<div id="main">
				<div class="kindLists">
					<ul class="lists">
						<c:forEach items="${categories }" var="c">
							<li class="active">
								<a href="javascript:findTtwo('${c.id}')">${c.shopTypeName}</a>
							</li>
						</c:forEach>

					</ul>
				</div>
				<!-------------------------mianright ----------------------------->
				<div class="proCon">
					<%-- <div class="banner">
						<a href="#"><img src="${pageContext.request.contextPath }/webAndroid/image/kind/banner.jpg" /></a>
					</div> --%>
					<c:forEach items="${maplist}" var="map">
						<div class="pro">
							<p>${map.cate1.shopTypeName}</p>
							<div class="proImg">
								<c:forEach items="${map.categories2}" var="c2">
									<a href="">
										<div class="imgDiv"><img src="/${c2.shopTypeLogo}" alt="" /></div>
										<p>${c2.shopTypeName}</p>
									</a>
								</c:forEach>
	
							</div>
						</div>
				</c:forEach>
				</div>
			</div>
		</div>
		
		<script>
		function findTtwo(cid){
			$.ajax({
			    type: 'post',  
			    data:{cid:cid},
			    url: "${pageContext.request.contextPath }/web/android/categoryApp/findTwoCate.htm",
			    success: function (data) {	        	
			    	$(".proCon").html(data);
			    }
			    });
		}
		
		</script>
	</body>

</html>