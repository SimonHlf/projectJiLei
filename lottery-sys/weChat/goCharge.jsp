<%@ page contentType="text/html;charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0" />
<title>充值</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/weChat/reception/css/aui.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/weChat/reception/css/goCharge.css"/>
</head>
<body>
	<header class="aui-bar aui-bar-nav headerNav">
        <a class="aui-pull-left aui-btn" tapmode onclick="history.go(-1)" href="javascript:void(0)">
            <span class="aui-iconfont aui-icon-left"></span>
        </a>
        <div class="aui-title">充值</div>
    </header>
	<div class="chargeDiv">
		<div class="chargeBg">
		<c:forEach items="${lists}" var="persons">
			<c:if test="${persons.type==5 }"><img id="bgImg" src="/${persons.path }"/></c:if>
			</c:forEach>
		</div>
		<!-- 充值层 --><%-- ${pageContext.request.contextPath }/weChat/images/chargeBg.jpg --%>
		<%-- <input type="hidden" id="userId" value="${frontUser.userId }"> --%>
		<div class="chargeCon">
			<div class="topPart">
				<!-- 二维码层 -->
				
				<div class="erweima">
				<c:forEach items="${lists}" var="persons">
					<c:if test="${persons.type==1 }"><img alt="客服二维码" src="/${persons.path }"></c:if>
					</c:forEach>
				</div>
				
				<div class="txtDiv">
					<c:forEach items="${list}" var="person">
					<p><c:if test="${person.type==0 }">${person.contactNuma }
					</c:if></p>
					</c:forEach>
					<c:forEach items="${list}" var="person">
                    <p><c:if test="${person.type==1 }">${person.contactNuma }
                    </c:if></p>
                     </c:forEach>   
					
					<!-- <p>客服QQ：548620051</p>
					<p>客服微信：wxdy1258</p> -->
					<!-- <a href="javascript:void(0)" tapmode onclick="selectChargeWay()" class="goChargeBtn">点击充值</a> -->
				</div>
			</div>
			<div class="botPart">
				<p class="">重要提示：充值前请先扫描二维码，联系客服办理！</p>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="${pageContext.request.contextPath }/weChat/reception/jsPlugin/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/weChat/reception/jsPlugin/aui-dialog.js"></script>
	<script type="text/javascript">
		window.onload = function(){
			$(".chargeDiv").height($("#bgImg").height());
		}
		function selectChargeWay(){
			$.ajax({
				method:'post',
				url:'${pageContext.request.contextPath }/personal/loginCheck.htm',
				data:{},				
				success:function(data){
					
					var data = eval("(" + data + ")");
					
					if(data.message=='success'){
						
						location.href = "${pageContext.request.contextPath }/personal/selectChargeWay.htm";
					}else{
						dialogCb(data.result,'暂不绑定','去完善资料',function(){
							location.href = "${pageContext.request.contextPath }/personal/bindPhoneNums.htm";
						});
					}
		   
				},
				error : function() {
					dialog("登录出错");
				}
			})
		}
	</script>
</body>
</html>