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
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/webAndroid/dist/css/com/headercom1.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath }/webAndroid/dist/css/person/personaldata.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/webAndroid/jslib/swiper/css/swiper-3.4.1.min.css" />
		<link href="${pageContext.request.contextPath }/webAndroid/jslib/jqueryarea/area.css" rel="stylesheet" type="text/css"/>
		<script src="${pageContext.request.contextPath }/webAndroid/js/jquery-1.11.0.js"></script>
		<script src="${pageContext.request.contextPath }/webAndroid/js/jquery.date.js"></script>
		<script src="${pageContext.request.contextPath }/webAndroid/jslib/swiper/js/swiper-3.4.1.min.js"></script>
		<script src="${pageContext.request.contextPath }/webAndroid/jslib/jqueryarea/jquery-1.9.1.js" ></script>
    	<script type="text/javascript" src="../../jslib/jqueryarea/area.js"></script>
		<script src="${pageContext.request.contextPath }/webAndroid/js/com/com.js"></script>
		<script src="${pageContext.request.contextPath }/webAndroid/js/person/personaldata.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/web/js/layer.js"></script>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/web/css/layer.css"/>
	</head>

	<body>
		<!---------------------------个人中心---------------------------------->
		<div id="container">
			<header id="aboutHeader">
				<div class="aBack">
					<a href="#"><em class="iconfont">&#xe600;</em></a>
				</div>
				<div class="aUs">个人资料</div>
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
				<form class="addrMsg">
					<p>
						<label for="person">*昵称:</label>
						<input type="text" placeholder="玉商通" name="收货人" id="person" />
					</p>
					<p>
						
						*性别
						<select>
							<option selected="selected">请选择</option>
							<option>男</option>
							<option>女</option>
						</select>
					</p>
					<p>
						*生日
						<input type="text" name="生日" placeholder="请选择日期" id="date2" data-options="{'type':'YYYY-MM-DD','beginYear':1990,'endYear':2088}" style="width:166px;height:19px;">
					</p>
					<p>
						<label for="person">移动电话:</label>
						<input type="text" placeholder="123****789" name="移动电话" id="person" />
					</p>
					<p>
						<label for="person">固定电话:</label>
						<input type="text" name="固定电话" id="person" />
					</p>
					<p id="selectArea">
						*所在区域 
						 <input class="address_input1"  type="text" placeholder="请选择地区" id="shengshi" onClick="getProvinceBuy()" readonly="readonly">
						<span>></span>
					</p>
					<p>
						<label for="dec">*详细地址</label></br>
						<input class="inpt" type="text" id="dec" />
					</p>
					<p>
						<label for="default">*邮箱:</label>
						<input type="email" id="default" />
					</p>
				</form>
				<div class="btn">
					<p>
						<a href="javascript:void(0);">提交</a>
						<a href="javascript:void(0);">重置</a>
					</p>
				</div>
			</div>
		</div>
	</body>
	<script type="text/javascript">
	
	
	
	</script>
</html>