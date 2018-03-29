<%@ page contentType="text/html;charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="Cache-Control" content="no-cache" />
	<meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0"/>
	<title>彩票-信息广场</title>
    <script src="script/jquery.min.js"></script>
	<script src="js/iscroll.js"></script>
	<script src="js/comScroll.js"></script>
	<link href="css/main.min.css" rel="stylesheet" type="text/css" />
	<link rel="apple-touch-icon-precomposed" href="images/icons.png" />
	<link rel="stylesheet" type="text/css" href="css/aui.css" />
	<link rel="stylesheet" href="css/aui-slide.css">
	<title></title>
    <style>
        .aui-tab:after {
            content: '';
            position: absolute;
            left: 0;
            bottom: 0;
            right: auto;
            top: auto;
            height: 1px;
            width: 100%;
            background-color: #dddddd;
            display: block;
            z-index: 2;
            -webkit-transform-origin: 50% 100%;
            transform-origin: 50% 100%;
        }
        .aui-tab-item a{
            color:#333;
        }
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
		#tabBox{
			background:#fff;
			height:2rem;
			position:relative;
			z-index:1;
			box-shadow:0px 0 5px #666;
		}
		#tabBox ul{
			width:100%;
			height:2rem;
			float:left;
		}
		#tabBox li{
			width:3.5rem;
			max-width:3.5rem;
			line-height:2rem;
			float:left;
			text-align:center;
		}
		#tabBox li a{
			display:inline-block;
			width:100%;
			height:100%;
			color:#666;
		}
		#tabBox li.active{
			height:2rem;
			line-height:2rem;
			border-bottom:2px solid #f34347;
		}
		#tabBox li.active a{
			color:#f34347;
		}
    </style>
	<script type="text/javascript">
        window.onload = function(){
            wrapScroll();
            piPeiIndex();
        }
    	function loaded() {
    		$("#tabBox ul").width($("#tabBox ul li").width() * $("#tabBox ul li").length)
    		myScroll = new iScroll('tabBox', { 
    			checkDOMChanges: true,
    			hScrollbar : false,
    			vScroll : false,
    			onScrollMove:function(){
    				selSubFlag = false;
    			},
    			onScrollEnd:function(){
    				selSubFlag = true;
    			}
    		});
    	}
    	window.addEventListener("load",loaded,false);
	</script>
</head>
<body>
	<div id="tabBox" class="headerNav">
		<ul>
			<li class="active"><a href="info.htm">全部</a></li>
			<c:forEach items="${list}" var="type">
				<li class="" id="${type.id}"><a href="list.htm?id=${type.id}">${type.name}</a></li>
			</c:forEach>
		</ul>
	</div>
	<div id="wrapBox">
		<div id="wrapScroll">
			<input type="hidden" id="navFlag" value="${navFlag}">
			<input type="hidden" id="typeId" value="${typeId}">
			<%-- 信息tab切换 --%>
			<!--  div id="tabBox" class="aui-tab aui-margin-b-10">
				<div class="aui-tab-item aui-active"><a href="info.htm">全部</a></div>
				<c:forEach items="${list}" var="type">
					<div class="aui-tab-item" id="${type.id}"><a href="list.htm?id=${type.id}">${type.name}</a></div>
				</c:forEach>
			</div-->
			<%-- banner轮播 --%>
			<div id="aui-slide">
				<div class="aui-slide-wrap" >
					<c:forEach items="${adList}" var="ad">
						<div class="aui-slide-node bg-dark">
							<a href="isURL.htm?id=${ad.id }"><img src="/${ad.attr0}" width="100%" /></a>
						</div>
					</c:forEach>
				</div>
				<div class="aui-slide-page-wrap"><!--分页容器--></div>
			</div>
			<%-- 列表内容 --%>
			<c:forEach items="${newsList}" var="news">
				<div class="news_list">
					<a style="display: block;" href="detail.htm?id=${news.id}">${news.title}
						<p class="news_list_t">
							<span class="left">${news.author}</span>
							<span class="left">${news.addTime}</span>
						</p>
					</a>
				</div>
			</c:forEach>
		</div>
	</div>
	<jsp:include page="nav.jsp"/>
	<script type="text/javascript" src="script/aui-slide.js"></script>
	<script type="text/javascript">
        var slide = new auiSlide({
            container:document.getElementById("aui-slide"),
            // "width":300,
            "height":120,
            "speed":300,
            "autoPlay":5000, //自动播放时间
            "pageShow":true,
            "loop":true,
            "pageStyle":'dot',
            'dotPosition':'center'
        })
        //信息广场下在tab的active切换
        function swipeActive(){
            var aLi = $("#tabBox li");
            aLi.each(function(i){
                if($("#typeId").val() == aLi.eq(i).attr("id")){
                	aLi.removeClass("active");
                	aLi.eq(i).addClass("active");
                }
            });
        }
        swipeActive();
	</script>
</body>

</html>