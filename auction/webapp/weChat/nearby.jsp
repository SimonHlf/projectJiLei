<%@ page contentType="text/html;charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0"/>
    <title>商家帮-商家列表</title>
    <link rel="icon" type="image/x-icon" href="favicon.ico">
    <link rel="stylesheet" type="text/css" href="css/aui.css" />
    <link rel="stylesheet" href="css/aui-flex.css">
    <link rel="stylesheet" href="css/aui-slide.css">
    <script src="js/iscroll.js"></script>
    <script src="js/comScroll.js"></script>
    <style>
        .aui-list-item-title{
            font-size:0.7rem !important;
            color:#666;
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
    </style>
    <script type="text/javascript">
        window.onload = function(){
            wrapScroll();
        }
    </script>
</head>
<body style="background:none">
<div id="wrapBox">
    <div id="wrapScroll">
        <div id="aui-slide">
            <div class="aui-slide-wrap" >
                <c:forEach items="${adInfoList }" var="adInfo">
                    <div class="aui-slide-node bg-dark">
                        <a href="isURL.htm?id=${adInfo.id }"><img src="/${adInfo.attr0 }" /></a>
                    </div>
                </c:forEach>
            </div>
            <div class="aui-slide-page-wrap"><!--分页容器--></div>
        </div>
        <!-- 门店商家列表 -->
        <div class="aui-content">
            <ul class="aui-list aui-media-list">
                <c:forEach items="${list}" var="merchant">
                    <li class="aui-list-item">
                        <a href="detail_.htm?shopid=${merchant.id}" style="width: 100%;height: 100%;display:block;">
                            <div class="aui-media-list-item-inner">
                                <div class="aui-list-item-media">
                                    <img src="/${merchant.attr1}">
                                </div>
                                <div class="aui-list-item-inner">
                                    <div class="aui-list-item-title" style="padding-left:0px;">
                                        ${merchant.merchantName}
                                    </div>
                                    <div class="aui-list-item-text">${merchant.attr0}</div>
                                    <div class="aui-list-item-text aui-margin-t-10">
                                        <div class="aui-ellipsis-2">
                                            ${merchant.address}
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </div>
</div>
<jsp:include page="nav.jsp"/>
</body>
<script type="text/javascript" src="script/api.js" ></script>
<script type="text/javascript" src="script/aui-tab.js" ></script>
<script type="text/javascript" src="script/aui-slide.js"></script>
<script type="text/javascript">
    var slide = new auiSlide({
        container:document.getElementById("aui-slide"),
        // "width":300,
        "height":185,
        "speed":300,
        "autoPlay":5000, //自动播放时间
        "pageShow":true,
        "loop":true,
        "pageStyle":'dot',
        'dotPosition':'center'
    })

    function currentFun(index) {
        console.log(index);
    }
    var slide2 = new auiSlide({
        container:document.getElementById("aui-slide2"),
        // "width":300,
        "height":220,
        "speed":300,
        "autoPlay":0, //自动播放
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

   /*apiready = function(){
        api.parseTapmode();
    }
    var tab = new auiTab({
        element:document.getElementById("footer")
    },function(ret){
        console.log(ret);
        if(ret){
            document.getElementById("demo").textContent = ret.index;
        }
    });*/
</script>
</html>