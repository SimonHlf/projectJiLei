<%@ page contentType="text/html;charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0" />
<title>商家帮-周边</title>
<link rel="icon" type="image/x-icon" href="favicon.ico">
<link rel="stylesheet" type="text/css" href="css/aui.css" />
<link rel="stylesheet" href="css/aui-flex.css">
<link rel="stylesheet" href="css/aui-slide.css">
<link rel="stylesheet" href="css/changeCity.css">
<link rel="stylesheet" href="http://at.alicdn.com/t/font_480287_b7kxw136egtoi529.css"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<script src="${pageContext.request.contextPath }/admin/assets/js/jquery-2.0.3.min.js"></script>
<script src="${pageContext.request.contextPath }/weChat/js/jweixin-1.2.0.js"></script>
<script src="${pageContext.request.contextPath }/weChat/js/jquery.min.js"></script>
<script charset="utf-8" src="http://map.qq.com/api/js?v=2.exp"></script>
<script src="js/iscroll.js"></script>
<script src="js/comScroll.js"></script>
<style type="text/css">
#smInfoCon {
	border-bottom: 1px solid #ddd;
}
.mallName {
	padding: 0px !important;
	font-size: 0.8rem !important;
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

#locationBox {
	font-size: 0.8rem;
}
</style>
<script type="text/javascript">
	window.onload = function() {
		wrapScroll();
		piPeiIndex();
		calMaskLayerHeight();
	}
	function calMaskLayerHeight(){
		$(".maskLayer").height($(window).height() - $("#header").height());
		$(".maskLayer").css({"top":$("#header").height()});
		changeName();
	}
	function ditu() {
		window.location.href = "";
	}
	function changeName(){
		$("#cityNameA").on("click",function(){
			$(".maskLayer").show().animate({"opacity":1},function(){
				$("#city").css({
					"-webkit-transform":"translateY("+ $("#header").height() +"px)",
					"transform":"translateY("+ $("#header").height() +"px)"
				});
			});
		});
		$(".maskLayer").on("touchend",function(){
			$("#city").css({
				"-webkit-transform":"translateY(-100%)",
				"transform":"translateY(-100%)"
			});
			$(".maskLayer").animate({"opacity":0},function(){
				$(".maskLayer").hide();
			});
		});
	}
	function getCityName(obj){
		var cityName = $(obj).attr("alt");
		$(".toastDiv").show();
		$(".midLayer").show();
		$.ajax({
			method:'post',
			url:'findMerInfoByCity.htm',
			data:{
				cityName:cityName
			},
			success:function(data){
				//alert("切换城市成功");
				$("#merchantInfoList").html(data);
				$("#cityNameA").html(cityName);
				$("#city").css({
					"-webkit-transform":"translateY(-100%)",
					"transform":"translateY(-100%)"
				});
				$(".maskLayer").animate({"opacity":0},function(){
					$(".maskLayer").hide();
				});
				$(".toastDiv").hide();
				$(".midLayer").hide();
			}		
		})
	}
</script>
</head>
<body style="background: none">
	<header id="header" class="aui-bar aui-bar-nav headerNav">
		<div id="locationBox" class="aui-col-xs-12">
			<div class="aui-col-xs-1"
				style="text-align: left; padding-left: 0.2rem;">
				<i class="aui-iconfont aui-icon-location"></i>
			</div>
			<div class="aui-col-xs-10" style="text-align: left; padding-left: 0.4rem; font-size: 0.6rem;">
				<a id="cityNameA" href="javascript:void(0)" tapmode>${quName }</a>
			</div>
		</div>
	</header>
	<div id="wrapBox">
		<div id="wrapScroll">
			<input type="hidden" id="navFlag" value="${navFlag}">
			<!-- 首页轮播 -->
			<div id="aui-slide">
				<div class="aui-slide-wrap">
					<c:forEach items="${adInfoList}" var="ad">
						<div class="aui-slide-node bg-dark">
							<a href="isURL.htm?id=${ad.id }"><img src="/${ad.attr0}" /></a>
						</div>
					</c:forEach>
				</div>
				<div class="aui-slide-page-wrap">
					<!--分页容器-->
				</div>
			</div>
			<!-- 首頁分类板块 -->
			<div id="aui-slide2">
				<div class="aui-slide-wrap">
					<div class="aui-slide-node">
						<div class="aui-grid">
							<div class="aui-row aui-row-img-wt">
								<div class="aui-col-xs-3">
									<a href="nearby_.htm?type=1&&quName=${quName }"> <i class="aui-iconfont "><img
											src="image/icon/icon-1.png" alt=""></i>
										<div class="aui-grid-label">${oneType }</div></a>
								</div>
								<div class="aui-col-xs-3">
									<a href="nearby_.htm?type=2&&quName=${quName }"> <i class="aui-iconfont "><img
											src="image/icon/icon-2.png" alt=""></i>
										<div class="aui-grid-label">${twoType }</div></a>
								</div>
								<div class="aui-col-xs-3">
									<a href="nearby_.htm?type=3&&quName=${quName }"> <i class="aui-iconfont "><img
											src="image/icon/icon-3.png" alt=""></i>
										<div class="aui-grid-label">${threeType }</div></a>
								</div>
								<div class="aui-col-xs-3">
									<a href="nearby_.htm?type=4&&quName=${quName }"> <i class="aui-iconfont "><img
											src="image/icon/icon-4.png" alt=""></i>
										<div class="aui-grid-label">${fourType }</div></a>
								</div>
								<div class="aui-col-xs-3">
									<a href="nearby_.htm?type=5&&quName=${quName }"> <i class="aui-iconfont "><img
											src="image/icon/icon-1.png" alt=""></i>
										<div class="aui-grid-label">${fiveType }</div></a>
								</div>
								<div class="aui-col-xs-3">
									<a href="nearby_.htm?type=6&&quName=${quName }"> <i class="aui-iconfont "><img
											src="image/icon/icon-2.png" alt=""></i>
										<div class="aui-grid-label">${sixType }</div></a>
								</div>
								<div class="aui-col-xs-3">
									<a href="nearby_.htm?type=7&&quName=${quName }"> <i class="aui-iconfont "><img
											src="image/icon/icon-1.png" alt=""></i>
										<div class="aui-grid-label">${sevenType }</div></a>
								</div>
								<div class="aui-col-xs-3">
									<a href="nearby_.htm?type=8&&quName=${quName }"> <i class="aui-iconfont "><img
											src="image/icon/icon-2.png" alt=""></i>
										<div class="aui-grid-label">${eightType }</div></a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<section id="smInfoCon" style="background-color: #fff;">
				<div class="aui-flex-col">
					<c:forEach items="${goodsList}" var="goods">
						<div class="aui-flex-item-6 aui-padded-10">
							<a href="detail_good.htm?goodsid=${goods.id}">
								<div class="aui-flex-item-7">
									<h3 class="aui-text-info aui-ellipsis-1"
										style="color: #e0620d !important">${goods.name}</h3>
									<p class="aui-ellipsis-2">${goods.keyWords}</p>
								</div>
								<div class="aui-flex-item-5">
									<img src="/${goods.thumbnailUrl}" />
								</div>
							</a>
						</div>
					</c:forEach>
				</div>
			</section>
			<!-- 广告图 -->
			<c:forEach items="${adList}" var="ad">
				<div style="padding: 0.75rem 0.75rem 0 0.75rem">
					<a href="isURL.htm?id=${ad.id }"><img src="/${ad.attr0}" alt=""></a>
				</div>
			</c:forEach>
			<!-- 店铺列表 -->
			<div class="mallList" id="merchantInfoList">
				<div class="aui-content">
					<%-- <ul class="aui-list aui-media-list">
					<c:forEach items="${merchantList}" var="merchant">
						<li class="aui-list-item">
							<a href="detail_.htm?shopid=${merchant.id}" style="width: 100%;height: 100%;display:block;">
								<div class="aui-media-list-item-inner">
								<div class="aui-list-item-media">
									<img src="/${merchant.attr1}">
								</div>
								<div class="aui-list-item-inner">
									<div class="aui-list-item-title mallName">
											${merchant.merchantName}
									</div>
									<div class="aui-list-item-text">${merchant.attr0}</div>
									<c:forEach items="${merchantInfoKmList }" var="mer">
									<c:if test="${mer.id == merchant.id }">
										<div class="aui-list-item-text">${mer.km}km</div>
									</c:if>
									</c:forEach>
									<div class="aui-list-item-text">
										<div class="aui-ellipsis-2">${merchant.address}</div>
									</div>
								</div>
							</div>
							</a>
						</li>
					</c:forEach>
				</ul> --%>
					<ul class="aui-list aui-media-list">
						<c:forEach items="${merchantInfoKmList }" var="mer">
							<c:forEach items="${merchantList}" var="merchant">
								<c:if test="${mer.id == merchant.id }">
									<li class="aui-list-item"><a
										href="detail_.htm?shopid=${merchant.id}"
										style="width: 100%; height: 100%; display: block;">
											<div class="aui-media-list-item-inner">
												<div class="aui-list-item-media">
													<img src="/${merchant.attr1}">
												</div>
												<div class="aui-list-item-inner">
													<div class="aui-list-item-title mallName">
														${merchant.merchantName}</div>
													<div class="aui-list-item-text">${merchant.attr0}</div>
													<div class="aui-list-item-text">${mer.km}km</div>
													<div class="aui-list-item-text">
														<div class="aui-ellipsis-2">${merchant.address}</div>
													</div>
												</div>
											</div>
									</a></li>
								</c:if>
							</c:forEach>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div class="maskLayer"></div>
	<div id="city" class="comDataBox">
		<ul class="clearfixs">
			<c:forEach var="city" items="${cityList }">
				<li><a alt="${city }" href="javascript:void(0)" tapmode onclick="getCityName(this)">${city }</a></li>
			</c:forEach>
		</ul>
		<div class="changeDiv"><a href="findProvinceList.htm">切换城市<i class="iconfont icon-qiehuan"></i></a></div>
	</div>
	<div class="midLayer"></div>
	<div class="toastDiv">
		<div class="loading">
	        <span></span>
	        <span></span>
	        <span></span>
	        <span></span>
	        <span></span>
		</div>
		<p>正在加载</p>
	</div>
	<jsp:include page="nav.jsp" />
	<script>
		wx.config({
			//debug : true, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
			appId : '${appid}', // 必填，公众号的唯一标识
			timestamp : '${jsparam.timestamp}', // 必填，生成签名的时间戳
			nonceStr : '${jsparam.noncestr}', // 必填，生成签名的随机串
			signature : '${jsparam.signature}',// 必填，签名，见附录1
			jsApiList : [ 'openLocation', 'getLocation' ]
		// 必填，需要使用的JS接口列表，所有JS接口列表见附录2
		});
		function init() {
			alert("dd");
			wx.ready(function() {
				alert("ff");
				wx.getLocation({
					type : 'gcj02', // 默认为wgs84的gps坐标，如果要返回直接给openLocation用的火星坐标，可传入'gcj02'
					success : function(res) {
						var latitude = res.latitude;
						var longitude = res.longitude;
						$.ajax({
							method : 'post',
							url : 'getmerchantMapListKm.htm',
							data : {
								latitude : latitude,
								longitude : longitude
							},
							success : function(data) {
								$("#merchantInfoList").html(data);
							}
						})
					},
				});
			});
		}
	</script>
</body>
<script type="text/javascript" src="script/api.js"></script>
<script type="text/javascript" src="script/aui-tab.js"></script>
<script type="text/javascript" src="script/aui-slide.js"></script>
<script type="text/javascript">
	//wrapScroll();
	var slide = new auiSlide({
		container : document.getElementById("aui-slide"),
		// "width":300,
		"height" : 185,
		"speed" : 300,
		"autoPlay" : 5000, //自动播放时间
		"pageShow" : true,
		"loop" : true,
		"pageStyle" : 'dot',
		'dotPosition' : 'center'
	})
	function currentFun(index) {
		console.log(index);
	}
	var slide2 = new auiSlide({
		container : document.getElementById("aui-slide2"),
		// "width":300,
		// "height":220,
		"speed" : 300,
		"autoPlay" : 0, //自动播放
		"pageShow" : true,
		"loop" : true,
		"pageStyle" : 'dot',
		'dotPosition' : 'center'
	})
	var slide3 = new auiSlide({
		container : document.getElementById("aui-slide3"),
		// "width":300,
		"height" : 240,
		"speed" : 500,
		"autoPlay" : 3000, //自动播放
		"loop" : true,
		"pageShow" : true,
		"pageStyle" : 'line',
		'dotPosition' : 'center'
	})
</script>
</html>