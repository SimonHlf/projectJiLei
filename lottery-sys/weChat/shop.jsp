<%@ page contentType="text/html;charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0" />
<title>商家帮-商家详情</title>
<link rel="icon" type="image/x-icon" href="favicon.ico">
<link rel="stylesheet" type="text/css" href="css/aui.css" />
<link href="css/layer/default/layer.css" rel="stylesheet"
	type="text/css" />


<script
	src="${pageContext.request.contextPath }/admin/assets/js/jquery-2.0.3.min.js"></script>
<script src="js/iscroll.js"></script>
<script src="js/comScroll.js"></script>
<script src="js/layer.js"></script>

<style>
.telABox {
	width: 100%;
	height: 100%;
	display: block;
	position: relative;
}

.aui-icon-phone {
	font-size: 1rem !important;
	color: #68c7ec;
}

.shopInfo {
	background: #fff;
}

.infoTit {
	width: 100%;
	height: 2rem;
	line-height: 2rem;
	background: #fff;
	font-size: 0.8rem;
	color: #333;
	text-indent: 10px;
	border-bottom: 1px solid #ccc;
}

.aui-content {
	font-size: 0.7rem !important;
	color: #333 !important;
}

#wrapBox {
	width: 100%;
	position: relative;
	overflow: hidden;
}

#wrapScroll {
	width: 100%;
	position: absolute;
	left: 0;
	top: 0px;
	-webkit-tap-highlight-color: rgba(0, 0, 0, 0);
}

.imgs {
	width: 45% !important;
	float: left;
	margin: 7px;
}
</style>
<script type="text/javascript">
	window.onload = function() {
		wrapScroll();
	}
</script>
</head>
<body>
	<div id="wrapBox">
		<div id="wrapScroll">
			<div class="aui-content aui-margin-b-15">
				<!-- 店铺图片 -->
				<div class="aui-card-list-content-padded" style="padding: 0px;">
					<img src="/${merchantInfo.attr1}">
				</div>
				<!-- 店铺信息 -->
				<ul class="aui-list aui-margin-b-10">
					<li class="aui-list-item">
						<div class="aui-list-item-inner" style="font-size: 0.8rem;">
							${merchantInfo.merchantName}</div>
					</li>
					<li class="aui-list-item">
						<div class="aui-list-item-inner"
							style="font-size: 0.7rem; padding-right: 0px; box-sizing: border-box;">
							<div style="width: 85%; float: left; padding-bottom: 5px;"
								class="aui-ellipsis-2">
								<a
									href="merchantMap.htm?longitude=${merchantInfo.longitude }&&latitude=${merchantInfo.latitude}"><i
									class="aui-iconfont aui-icon-location"></i>
									${merchantInfo.address}</a>
							</div>
							<div
								style="width: 15%; height: 100%; text-align: center; float: right;">
								<a class="telABox" href="tel:${merchantInfo.attr0}"> <i
									class="aui-iconfont aui-icon-phone"></i>
								</a>
							</div>
						</div>
					</li>
				</ul>
				<style type="text/css">
					.imgBox{
						margin:0.5rem 0px;
					}
					.clearfixs{
						zoom:1;
					}
					.clearfixs:after{
						content:"";
						display:block;
						clear:both;
					}
					.img1div{
						width: 100%;
						float: left;
					}
					.img1div img{
						width: 49%;
						height: 5rem;
					}
					.shopInfo{
						width: 100%;

					}
				</style>
				<!-- 商家信息 --><p class="infoTit">商家信息</p>
				<div class="imgBox aui-content">
					<!--  div class="aui-card-list-content-padded" style="padding: 0px;"-->
						<div class="img1div clearfixs">
							<c:if test="${merchantInfo.attr5 != null }">
								<img src="/${merchantInfo.attr5}" class="imgs"
									onclick="open_(this)">
							</c:if> 
							<c:if test="${merchantInfo.attr6 != null }">
									<img src="/${merchantInfo.attr6}"
									class="imgs" onclick="open_(this)" style="margin-left:0.5rem;"/>
							</c:if> 
						</div>
					<!--/div-->
						<div class="img1div clearfixs">
							<c:if test="${merchantInfo.attr7 != null }">
								<img src="/${merchantInfo.attr7}" class="imgs"
								onclick="open_(this)">
							</c:if> 
							<c:if test="${merchantInfo.attr8 != null }">
								 <img src="/${merchantInfo.attr8}"
								class="imgs" onclick="open_(this)" style="margin-left:0.5rem;"/>
							</c:if>
						</div>
				</div>
				<div class="shopInfo">
					<div class="aui-content aui-padded-10">
						${merchantInfo.remark}</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="nav.jsp" />
</body>
<script type="text/javascript">
	function open_(obj) {
		layer.open({
			type : 1,
			shade : false,
			title : false,
			content : "<img src='" + $(obj).attr("src")
					+ "' style='width:280px;height:280px;'/>"
		});
	}
</script>
</html>