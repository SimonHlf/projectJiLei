<%@ page contentType="text/html;charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0" />
<title>彩票-保险金</title>
<link rel="icon" type="image/x-icon" href="favicon.ico">
<link rel="stylesheet" type="text/css" href="css/aui.css" />
<link rel="stylesheet" href="css/aui-flex.css">
<link rel="stylesheet" href="css/aui-slide.css">
<style type="text/css">
	.user-info {
		background-color: #ffffff;
		padding: 10px 0;
	}

	img.avatar {
		display: block;
		margin: 0 auto;
		width: 20%;
	}
	.aui-list{
		background-image:none !important;
	}
	.aui-list .aui-list-header {
		background-color: #ffffff;
		line-height: 1.2rem;
	}
</style>
</head>
<body>
	<section class="aui-content user-info aui-text-center aui-margin-b-15">
		<img src="${sessionScope.consumer.pic }" class="avatar aui-img-round">
		<h2 class="aui-margin-t-15">${sessionScope.consumer.name }<small><i
				class="aui-iconfont aui-icon-cert aui-text-danger"></i></small>
		</h2>
	</section>

	<section class="aui-content aui-grid aui-margin-b-15">
		<div class="aui-row">
			<div class="aui-col-xs-6 aui-border-r">
				<big class="aui-text-warning">${sessionScope.consumer.cash }<small>
						元</small></big>
				<div class="aui-gird-lable aui-font-size-12">优惠券余额</div>
			</div>
			<div class="aui-col-xs-6 aui-border-r">
				<big class="aui-text-danger">${sessionScope.consumer.insurance }<small>
						元</small></big>
				<div class="aui-gird-lable aui-font-size-12">保险金</div>
			</div>
		</div>
	</section>
	<section class="aui-content">
		<ul class="aui-list aui-form-list">
			<li class="aui-list-item">
				<div class="aui-list-item-inner">
					<div class="aui-list-item-label">
						保险金:
					</div>
					<div class="aui-list-item-input">
						<input type="text" value="${sessionScope.consumer.insurance}元"
							   name="insurance" disabled>
					</div>
				</div>
			</li>
		</ul>
	</section>
	<jsp:include page="nav.jsp" />
</body>
</html>