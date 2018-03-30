<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		<link rel="stylesheet"  href="${pageContext.request.contextPath }/webAndroid/dist/css/person/address.css">
		<link rel="stylesheet" type="text/css"  href="${pageContext.request.contextPath }/webAndroid/jslib/swiper/css/swiper-3.4.1.min.css" />
		<script src="${pageContext.request.contextPath }/webAndroid/js/jquery-1.11.0.js" ></script>
		<script src="${pageContext.request.contextPath }/webAndroid/jslib/swiper/js/swiper-3.4.1.min.js" ></script>
		<script src="${pageContext.request.contextPath }/webAndroid/js/com/com.js" ></script>
	</head>
	<body>
		<!---------------------------收货地址---------------------------------->
		<div id="container">
			<header id="aboutHeader">
				<div class="aBack">
					<a href="javascript:void(0);"><em class="iconfont">&#xe600;</em></a>
				</div>
				<div class="aUs">收货地址</div>
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
				<ul class="addrLists">
					<c:forEach items="${list}" var="c">
						<li>
							<div class="name"><span>${c.condigneeName}</span><span>${c.telephone}</span></div>
							<p class="addr">${c.provinceName}${c.cityName}${c.areaName}${c.liveAddress}</p>
							<div class="btm">
							<c:if test="${c.defaultStatus==1}">
								<p><input class="checked" name="radio" type="radio" checked="checked"/><span>默认地址</span></p>
							</c:if>	
							<c:if test="${c.defaultStatus!=1}">
								<p><input class="checked" name="radio" type="radio" value="${c.id}"/><span>默认地址</span></p>
							</c:if>	
								<p><a href="javascript:modifyAddress(${c.id})"><em class="iconfont">&#xe6b9;</em>编辑</a><span onclick="delAddress(${c.id})"><em class="iconfont">&#xe62b;</em>删除</span></p>
							</div>
							<div class="kong"></div>
						</li>
					</c:forEach>
					
				</ul>
				<div class="addNew">
					<a href="javascript:addAddress()">添加新地址</a>
				</div>
			</div>
		</div>
		
		<script type="text/javascript">
		//添加新地址
		function addAddress(){
			window.location.href="${pageContext.request.contextPath }/web/android/consigneeApp/toAdd.htm";
		}
		//删除
		function delAddress(id){
			$.ajax({
			    type: 'post',  
			    data:{id:id},
			    url: "${pageContext.request.contextPath }/web/android/consigneeApi/del.htm",
			    success: function (data) {	        	
			    	 if(data.result=="ok"){
			    		
			    		window.location.href="${pageContext.request.contextPath}/web/android/consigneeApi/toConsigneeJsp.htm";
			    		layer.msg("删除成功");
			    	 }else{
			    		 layer.msg("删除失败");
			    		 
			    	 }  
			    }
			    });
		}
		//设为默认地址
		$("addrLists ul li input:checked").click(function(){
			
			alert(1111)
		});
		
		
		
		function setDefault(id){
			$.ajax({
			    type: 'post',  
			    data:{consigneeId:id},
			    url: "${pageContext.request.contextPath }/web/android/consigneeApi/updateStatus.htm",
			    success: function (data) {	        	
			    	 if(data.result=="ok"){
			    		//layer.msg("设置成功");
			    		window.location.href="${pageContext.request.contextPath}/web/android/consigneeApi/toConsigneeJsp.htm";
			    	 }else{
			    		 layer.msg("设置失败");
			    		 
			    	 }  
			    }
			    });
		}
		
		</script>
		
	</body>
</html>
