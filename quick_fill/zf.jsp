<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>好快充-支付界面</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<link rel="stylesheet" href="../admin/assets/css/bootstrap.min.css">
<style>
div {
	margin-top: 10px;
}
</style>
</head>
<body style="text-align: center">
	<div class="main-container container-fluid">
		<div class="page-container">
			<div class="page-content">
				<div class="row">
					<div class="col-lg-1 col-sm-1 col-xs-1"></div>
					<div class="col-lg-10 col-sm-10 col-xs-10">
						<div class="cdTitle">
							<div class="top">
							</div>
							<div class="bottom">支付</div>
						</div>
						<div class="input-group">
							<span class="input-group-addon">&nbsp;&nbsp;&nbsp;&nbsp;订单号</span>
							<input type="text" class="form-control" id="ddh" readonly
								value="${trade_no}">
						</div>
						<div class="input-group">
							<span class="input-group-addon">订单金额</span> <input type="text"
								class="form-control" readonly value="${pay}">
						</div>
						<!-- <div>
							<button type="hidden" class="btn btn-success" onclick="pay()">付款</button>
						</div> -->
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
    function onBridgeReady(){
        pay();
    }

    function pay(){
        WeixinJSBridge.invoke('getBrandWCPayRequest', {
            <c:forEach items="${nvps}" var="item">
            "${item.name}": "${item.value}",
            </c:forEach>
            "_1": "-1"
        }, function (res) {
            if (res.err_msg == "get_brand_wcpay_request:ok") {
            	window.location="${pageContext.request.contextPath}/weChat/homePage2.htm?zf=1";
            }
        });
    }

    if (typeof WeixinJSBridge == "undefined"){
        if( document.addEventListener ){
            document.addEventListener('WeixinJSBridgeReady', onBridgeReady, false);
        }else if (document.attachEvent){
            document.attachEvent('WeixinJSBridgeReady', onBridgeReady);
            document.attachEvent('onWeixinJSBridgeReady', onBridgeReady);
        }
    }else{
        onBridgeReady();
    }
</script>
</body>
</html>