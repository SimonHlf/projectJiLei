<%@ page contentType="text/html;charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0"/>
	<title>彩票-商品详情</title>
	<link rel="icon" type="image/x-icon" href="favicon.ico">
	<link rel="stylesheet" type="text/css" href="css/aui.css"/>
	<link rel="stylesheet" type="text/css" href="css/aui-slide.css"/>
	<link rel="stylesheet" type="text/css" href="css/pop.css"/>
		<script src="js/iscroll.js"></script>
	<script src="js/comScroll.js"></script>
	<style type="text/css">
		#wrapBox{
			width: 100%;
			position:relative;
			overflow: hidden;
		}
		#wrapScroll{
			width:100%;
			position:absolute;
			left:0;
			top:0px;
			-webkit-tap-highlight-color:rgba(0,0,0,0);
		}
	</style>
	<script type="text/javascript">
        window.onload = function(){
            wrapScroll();
        }
	</script>
</head>
<body style="background:#fff;">
<div id="wrapBox">
	<div id="wrapScroll">
<div id="aui-slide2">
	<div class="aui-slide-wrap">
		<div class="aui-slide-node aui-slide-node-middle aui-slide-node-center">
			<img src="/${goods.thumbnailUrl}" alt="">
		</div>
	</div>
	<div class="aui-slide-page-wrap"></div>
</div>
<div class="aui-title-text">
	<h2>${goods.name}</h2>
	<div style="font-size:18px; font-weight:800; color:#f34347">￥${goods.price} </div>
</div>
<div class="wrap" id="wrap">
	<div class="tabCon">
		<div class="tabBox">
			<div class="tabList aui-padded-l-10 aui-padded-r-10">
				${goods.content}
			</div>
		</div>
	</div>
</div>
</div>
</div>
<jsp:include page="nav.jsp"/>

<script type="text/javascript" src="script/api.js" ></script>
<script type="text/javascript" src="script/aui-slide.js"></script>
<script type="text/javascript">
    var slide = new auiSlide({
        container:document.getElementById("aui-slide"),
        // "width":300,
        "height":260,
        "speed":300,
        "pageShow":true,
        "pageStyle":'dot',
        "loop":true,
        'dotPosition':'center',
        currentPage:currentFun
    })

    function currentFun(index) {
        console.log(index);
    }
    var slide2 = new auiSlide({
        container:document.getElementById("aui-slide2"),
        // "width":300,
        "height":290,
        "speed":300,
        "autoPlay":4000, //自动播放
        "pageShow":true,
        "loop":true,
        "pageStyle":'dot',
        'dotPosition':'center'
    })
    var slide3 = new auiSlide({
        container:document.getElementById("aui-slide3"),
        // "width":300,
        "height":240,
        "speed":500,
        "autoPlay": 3000, //自动播放
        "loop":true,
        "pageShow":true,
        "pageStyle":'line',
        'dotPosition':'center'
    })
    console.log(slide3.pageCount());

</script>
</body>
</html>
