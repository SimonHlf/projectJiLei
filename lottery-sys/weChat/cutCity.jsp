<%@ page contentType="text/html;charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0" />
<title>彩票-切换城市</title>
<link rel="icon" type="image/x-icon" href="favicon.ico">
<link rel="stylesheet" type="text/css" href="css/aui.css" />
<link rel="stylesheet" type="text/css" href="css/changeCity.css">
<script src="${pageContext.request.contextPath }/weChat/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/weChat/js/changeCity.js"></script>
<style type="text/css">
	#selBox{width:100%;height:1.75rem;line-height:1.75rem;background:#fff;border-bottom:1px solid #ddd;position:relative;z-index:1002;}
	#selBox .selInnerPar{float:left;width:33%;height:100%;font-size:0.7rem;text-indent:10px;color:#666;box-sizing:border-box;position:relative;}
	#selBox .selInnerPar:nth-of-type(3n-1),#selBox .selInnerPar:nth-of-type(3n){margin-left:0.5%;}
	.comTri{width:0px;height:0px;border-width:8px;border-color:#ccc transparent transparent transparent;
	border-style:solid dashed dashed dashed; display:inline-block;position:absolute;right:5px;top:12px;}
	.selInnerPar .innerTxt{width:90%;max-width:82%;position:absolute;left:0;top:0;height:100%;color:#999;
	white-space:nowrap;text-overflow:ellipsis;overflow:hidden;}
</style>
<script type="text/javascript">
$(function(){
	calMaskLayerHeight();
});	
function calMaskLayerHeight(){
	$(".maskLayer").height($(window).height() - $("#header").height() - $("#selBox").height());
	$(".maskLayer").css({"top":$("#header").height() + $("#selBox").height()});
}
</script>
</head>
<body id="areaList">
	<input type="hidden" id="backData_prov" value="${province }"/>
	<input type="hidden" id="backData_city" value="${city }"/>
	<input type="hidden" id="backData_country" value=""/>
    <header id="header" class="aui-bar aui-bar-nav">
        <a class="aui-pull-left aui-btn" tapmode onclick="history.go(-1)">
            <span class="aui-iconfont aui-icon-left"></span>
        </a>
        <div class="aui-title">选择地区</div>
    </header>
	<div id="selBox">
		<!-- 选择省  -->
		<div class="selInnerPar">
			<div id='choiceProv' class="provinces selBox fl" tapmode onclick="comShowDataLayer('provData')">
				<span class="comTri"></span>
				<span id="prov_sel" class="innerTxt">选择省</span>
			</div>
		</div>
		<div class="selInnerPar">
			<div id='choiceCity' class="citys selBox fl" tapmode onclick="comShowDataLayer('cityData')">
				<span class="comTri"></span>
				<span id="city_sel" class="innerTxt">选择市</span>
			</div>
		</div>
		<div class="selInnerPar">
			<div id='choiceCountry' class="selBox fl" tapmode onclick="comShowDataLayer('countryData')">
				<span class="comTri"></span>
				<span id="city_sel" class="innerTxt">选择县/区</span>
			</div>
		</div>
	</div>
	<!-- 遮罩层  -->
	<div class="maskLayer" tapmode onclick="hideAll()"></div>
	<!-- 省  -->
	<div id="provData" class="comDataBox">
		<ul id="provDataUl" class="dataUl">
			<c:forEach var="province" items="${provinceList }">
				<li><a alt="${province.name }" href="javascript:void(0)" tapmode onclick="getProvName(this)">${province.name }</a></li>
			</c:forEach>
		</ul>
	</div>
	<!-- 市  -->
	<div id="cityData" class="comDataBox">
		<ul id="cityDataUl" class="dataUl">
			<c:forEach var="city" items="${cityList }">
				<li><a alt="${city.name }" href="javascript:void(0)" tapmode onclick="getCityName(this)">${city.name }</a></li>
			</c:forEach>
		</ul>
	</div>
	<!-- 选择区县  -->
	<div id="countyData" class="comDataBox">
		<ul id="countyDataUl" class="dataUl">
			<c:forEach var="county" items="${countyList }">
				<li><a alt="${county.name }" href="javascript:void(0)" tapmode onclick="getCountryName(this)">${county.name }</a></li>
			</c:forEach>
		</ul>
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
</body>
</html>