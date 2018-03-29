<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0"/>
	<title>分享赚钱</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/weChat/reception/css/aui.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/weChat/reception/css/goCharge.css"/>
	<style type="text/css">
		.imgBgDiv{width:100%;background:#000;text-align:center;}
		.imgBgDiv img{display:inline-block;}
	</style>
</head>
<body>
	<header class="aui-bar aui-bar-nav headerNav shareNav">
        <a class="aui-pull-left aui-btn" tapmode onclick="history.go(-1)">
            <span class="aui-iconfont aui-icon-left"></span>
        </a>
        <input type="hidden" id="userId" value="${frontUser.userId }">
        <div class="aui-title">分享赚钱</div>
    </header>
	<div class="imgBgDiv">
		<c:forEach items="${lists}" var="persons">
			<c:if test="${persons.type==8 }"><img id="bgImg" src="/${persons.path }"/></c:if>
		</c:forEach>
	</div>
	<div class="chargeCon">
		<div class="topPart">
			<!-- 二维码层 -->
			<div class="txtDiv1">
				<c:forEach items="${list}" var="person">
				<p><c:if test="${person.type==15 }">${person.contactNuma }
				</c:if></p>
				</c:forEach>
				<c:forEach items="${list}" var="person">
				<p><c:if test="${person.type==16 }">${person.contactNuma }
				</c:if></p>
				 </c:forEach>
				 <c:forEach items="${list}" var="person">
				<span><c:if test="${person.type==17 }">${person.contactNuma }
				</c:if></span>
				 </c:forEach> 
				<!-- <p>客服QQ：548620051</p>
				<p>客服微信：wxdy1258</p>
				<span>永久网址：www.xxcaipiao.com</span> -->
			</div>
		</div>
		<div class="erweima1">
			
			<img src="${pageContext.request.contextPath}/lotterts/validateCode.htm"/>
			
		</div>
	</div>
	<!-- div class="copyLinkDiv">
		<input type="text" id="fenxiang" value="${qrurl }" readonly="readonly"/>
		<div class="copyBtn" onClick="jsCopy()">复制</div>
	</div -->
	<script type="text/javascript" src="${pageContext.request.contextPath }/weChat/reception/jsPlugin/jquery.min.js"></script>
	<script type="text/javascript">
		window.onload = function(){	
			$(".imgBgDiv").height($(window).height());
			$(".imgBgDiv img").height($(window).height()); 
			$(".chargeCon").height($(window).height());
		}
		 function jsCopy(){  
             var e=document.getElementById("fenxiang");//对象是copy-num1  
             e.select(); //选择对象  
             document.execCommand("Copy"); //执行浏览器复制命令  
             toast("复制成功","success");
         }  
	</script>
</body>
</html>