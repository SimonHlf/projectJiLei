<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0"/>
	<title>联系客服</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/weChat/reception/css/aui.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/weChat/reception/css/goCharge.css"/>
</head>
<body>
	<header class="aui-bar aui-bar-nav headerNav">
        <a class="aui-pull-left aui-btn" tapmode onclick="history.go(-1)" href="javascript:void(0)">
            <span class="aui-iconfont aui-icon-left"></span>
        </a>
        <div class="aui-title">联系客服</div>
    </header>
 	<div class="chargeDiv">
		<div class="chargeBg_1">
		<c:forEach items="${lists}" var="persons">
			<c:if test="${persons.type==7 }"><img id="bgImg" src="/${persons.path }"/></c:if>
			</c:forEach>
		</div>
		<!-- 充值层 --><%-- ${pageContext.request.contextPath }/weChat/images/kefu.jpg --%>
		<%-- <input type="hidden" id="userId" value="${frontUser.userId }"> --%>
		<div class="chargeCon">
			<div class="topPart">
				<!-- 二维码层 -->
				<div class="erweima">
				<c:forEach items="${lists}" var="persons">
					<c:if test="${persons.type==0 }"><img alt="客服二维码" src="/${persons.path }"></c:if>
				</c:forEach>
				</div>
				<div class="txtDiv">
					<c:forEach items="${list}" var="person">
					<p><c:if test="${person.type==11 }">${person.contactNuma }
					</c:if></p>
					</c:forEach>
					<c:forEach items="${list}" var="person">
                    <p><c:if test="${person.type==12 }">${person.contactNuma }
                    </c:if></p>
                     </c:forEach> 
					<!-- <p>客服QQ：548620051</p>
					<p>客服微信：wxdy1258</p> -->
				</div>
			</div>
			<div class="botPart_1">
				<p class="">重要提示：请先扫描二维码，联系客服办理！</p>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="${pageContext.request.contextPath }/weChat/reception/jsPlugin/jquery.min.js"></script>
	<script type="text/javascript">
		window.onload = function(){
			$(".chargeDiv").height($("#bgImg").height());
		}
	</script>
</body>
</html>