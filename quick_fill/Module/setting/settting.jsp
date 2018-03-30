<!DOCTYPE html>
<%@page pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="v" tagdir="/WEB-INF/tags"%>
<html>
<head>
<meta charset="UTF-8">
<title>设置</title>
<meta name="viewport"
	content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/weChat/css/reset.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/weChat/Module/setting/css/setting.css" />
</head>
<body class="bodyPadBot">
	<div class="scanBg">
		<div class="scanCon">
			<img class="phoneBg" src="${pageContext.request.contextPath }/weChat/Module/charging/images/phone.png" />
			<div class="settingBtnDiv">
				
				<c:if test="${sessionScope.fontUser.type==2 }">
					<div>
						<button class="tixianBtn" ontouchend="getCash()">收益提现<tton>
					</div>
				</c:if>
				
				<c:if test="${sessionScope.fontUser.type==2 }">
					<div>
						<button class="tixianRec" ontouchend="goWithDrawRec()">提现记录<tton>
					</div>
				</c:if>
				<div>
					<button class="myArea" ontouchend="goMyCommunity()">我的小区</tton>
				</div>
			</div>
		</div>
	</div>
	<c:if test="${sessionScope.fontUser.type==2 }">
		<div class="settingDiv">
			<span class="shortSpan"></span> 
			<span class="longSpan"></span> 
			<strong class="settingTit"></strong>
			<c:if test="${sta == '1' }">
				<p class="firstP">累积收益：${list.get(0).countMoney}元</p>
				<p>累计用户：${list.get(0).coumtPerson}人</p>
				<p>当前用户：${list.get(0).countPerson}</p>
			</c:if>
			<c:if test="${sta == '0' }">
				<p class="firstP">累积收益：0元</p>
				<p>累计用户：0人</p>
				<p>当前用户：0</p>
			</c:if>
			
		</div>	
	</c:if>

	<div class="layer"></div>
	<div class="toast-wrap">
		<span class="toast-msg"></span>
	</div>
	<!-- footer -->
	<jsp:include page="../../down.jsp">
		<jsp:param value="4" name="cmd"/>
	</jsp:include>
	<script src="${pageContext.request.contextPath }/weChat/jsPlugin/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath }/weChat/jsPlugin/tipInfo.js" type="text/javascript"></script>
	<script type="text/javascript">
			$(function(){
				calPosScanForm()
			});
			//动态定位扫一扫手机内部的表单
			function calPosScanForm(){
				var longWidth = $(".settingDiv").width() - $(".shortSpan").width() - $(".settingTit").width();
				var leftPos = $(".settingTit").width() + $(".shortSpan").width();
				$(".longSpan").width(longWidth).css({"left":leftPos});
			}
			//跳转我的提现
			function getCash(){
				window.location.href = "${pageContext.request.contextPath }/weChat/Module/setting/cashApply.jsp";
			}
			//跳转提现记录
			function goWithDrawRec(){
				window.location.href ="/quick_fill/weChat/Withdrawals.htm";
			}
			//跳转我的小区
			function goMyCommunity(){
				var item = {}
				httpPost("/quick_fill/weChat/mySmallArea.htm",item);
			}
			//发送POST请求跳转到指定页面
			function httpPost(URL, PARAMS) {
			    var temp = document.createElement("form");
			    temp.action = URL;
			    temp.method = "post";
			    temp.style.display = "none";

			    for (var x in PARAMS) {
			        var opt = document.createElement("textarea");
			        opt.name = x;
			        opt.value = PARAMS[x];
			        temp.appendChild(opt);
			    }

			    document.body.appendChild(temp);
			    temp.submit();

			    return temp;
			}
		</script>
</body>
</html>
