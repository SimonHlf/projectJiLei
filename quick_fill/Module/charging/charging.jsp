<!DOCTYPE html>
<%@page pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>扫一扫充电</title>
<meta name="viewport"
	content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/weChat/css/reset.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/weChat/Module/charging/css/charging.css" />
</head>
<body class="bodyPadBot">
	<!-- 个人用户信息 -->
	<div class="perInfos">
		<div class="perImg fl">
			<img src="${sessionScope.fontUser.weImage }"
				class="avatar aui-img-round">
		</div>
		<div class="perInfoTxt fl">
			<strong>${sessionScope.regionName}小区</strong>
			<p>用户编号：${sessionScope.fontUser.account }</p>
			<p>赠送余额：${sessionScope.fontUser.dummyBalance }元</p>
			<p>账户余额：${sessionScope.fontUser.balance }元</p>
		</div>
		<div class="batteryDiv"></div>
	</div>
	<!-- 用户充电 -->
	<div class="chargingList">
		<!-- 没有充电二维码扫一扫 -->
		<div class="scanBg">
			<div class="scanCon">
				<img class="phoneBg" src="${pageContext.request.contextPath}/weChat/Module/charging/images/phone.png" />
				<div class="scanCharging">
					<p class="scanTit">扫码充电</p>
					<button class="saoyisao" id="scanQRCode">扫一扫</button>
					<p class="bianhao">充电桩编号充电</p>
					<div>
						<input type="text" id="qrCode"/>
					</div>
					<button class="sureBtn" onclick="goCharging()">确定</button>
				</div>
			</div>
		</div>
		<!-- 判断计费模式 -->

	</div>
	<div class="layer"></div>
	<div class="toast-wrap">
		<span class="toast-msg"></span>
	</div>
	<!-- footer -->
	<c:choose>
		<c:when test="${empty cmd}">
			<jsp:include page="../../down.jsp">
				<jsp:param value="2" name="cmd"/>
			</jsp:include>
		</c:when>
		<c:otherwise>
			<jsp:include page="../../down.jsp">
				<jsp:param value="3" name="cmd"/>
			</jsp:include>
		</c:otherwise>
	</c:choose>


	<script src="${pageContext.request.contextPath}/weChat/jsPlugin/jquery.min.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/weChat/jsPlugin/tipInfo.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/weChat/jsPlugin/jweixin-1.2.0.js"></script>
	<script type="text/javascript">
        $("#scanQRCode").click(function() {
            wx.scanQRCode({
                needResult : 1,
                scanType: ["qrCode","barCode"],
                success : function(res) {
                    var result = res.resultStr;
                    alert(result);
                    <%--window.location.href = "${pageContext.request.contextPath}/weChat/Charge/queryEquipment.htm?qrCode="+result;--%>
//                    var vid = res.resultStr.slice(-10);
                }
            });
        });
		 wx.config({
           debug : true, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
           appId : '${appid}', // 必填，公众号的唯一标识
           timestamp : '${jsparam.timestamp}', // 必填，生成签名的时间戳
           nonceStr : '${jsparam.noncestr}', // 必填，生成签名的随机串
           signature : '${jsparam.signature}',// 必填，签名，见附录1
           jsApiList : [ 'scanQRCode' ]
           // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
       });
		function goCharging() {
			window.location.href = "beginCharging.jsp";
		}

        //输入设备二维码
        function goCharging(){
            var qrCode = $("#qrCode").val();
            if(!qrCode){
            	toast("请输入设备二维码编号，或使用扫一扫充电");
            } else {
                window.location.href = "${pageContext.request.contextPath}/weChat/Charge/queryEquipment.htm?qrCode="+qrCode;
            }
        }
	</script>
</body>
</html>
