<%@page pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <meta charset="UTF-8">
    <title>欢迎来到玉商通竞拍</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/web/css/index.css">
    <script src="${pageContext.request.contextPath}/web/js/jquery-1.7.2.min.js" type="text/javascript"></script>
</head>
<body>
	<%@ include file="head.jsp"%>
		
		<!-- 轮播图 -->
		<div id="flashBox" class="bigFlashBox">
		    <ul class="banner">
		    	<c:forEach items="${adList}" var="ad">
		    		
					        <li style="background: url(/${ad.imgUrl}) 50% center no-repeat; opacity: 1;">
				        		<a href="${pageContext.request.contextPath }/${ad.jumpUrl}"></a>
				        	</li>	

				 </c:forEach> 
		    </ul>
		    <!-- 底部索引 -->
		    <div class="smallBtn"></div>
		</div>
<div class="mainCon w1100">
    <!-- 官方推荐 -->
    <div class="comMainPart recommendPart">
        <div class="comBigTit recomTitBg">
            <strong>官方推荐</strong>
            <a href="${pageContext.request.contextPath }/web/shop/categoryApi/toCategoryJsp.htm?cmd=1">查看更多&gt;&gt;</a>
        </div>
        <div class="clearfix">
            <div class="leftRecommend fl">
                <div class="innerLeftRecom fl">
                    <div class="leftRecomImg">
                    	<a href="${pageContext.request.contextPath }/web/shop/categoryApi/toCategoryJsp.htm?cmd=1">
                        	<img src="/${recommend1.recommendImg}" alt="官方推荐"/>
                        </a>
                    </div>
                    <div class="leftRecomPrice">
                        <span class="priceDec">¥</span>
                        <span class="priceSpan">${recommend1.price}</span>
                        <a href="${pageContext.request.contextPath }/web/shop/productDetailApi/toRmbProDetailJsp.htm?pid=${recommend1.id}">去看看</a>
                    </div>
                </div>
                <div class="InnerRightRecom fr">
                    <!-- 跳转至优乐购商城 -->
                    <div class="comRightRecom">
                        <div class="innerComRightRecom">
                            <a class="comGoBtn goYouLe" href="${pageContext.request.contextPath }/web/shop/youLeBuyApi/toYouleBuyJsp.htm?cmd=2"></a>
                            <div class="rightRecomImg">
                            	<%-- <a href="${pageContext.request.contextPath }/web/shop/youLeBuyApi/toYouleBuyJsp.htm?cmd=2"> --%>
                                	<img src="/${recommend4.thumbnailurl}" width="100%"/>
                                <!-- </a> -->
                                <!-- 跳转至商品详情页 -->
                                <a href="${pageContext.request.contextPath }/web/shop/productDetailApi/toRmbProDetailJsp.htm?pid=${recommend4.id}">去看看</a>
                            </div>
                            <p class="ellip">${recommend4.name}</p>
                        </div>
                        <div class="rightRecomPrice">
                            <span class="priceDec">¥</span>
                            <span class="priceSpan">${recommend4.price}</span>
                        </div>
                    </div>
                    <!-- 跳转至积分商城 -->
                    <div class="comRightRecom margTopRecom">
                        <div class="innerComRightRecom">
                            <a class="comGoBtn goJiFen" href="${pageContext.request.contextPath }/web/shop/jiFenBuyApi/toJifenJsp.htm?cmd=3"></a>
                            <div class="rightRecomImg">
                           		<%-- <a href="${pageContext.request.contextPath }/web/shop/jiFenBuyApi/toJifenJsp.htm?cmd=3"> --%>
                               		 <img src="/${recommend3.thumbnailurl}" width="100%"/>
                               	<!-- </a> -->
                                <!-- 跳转至商品详情页 -->
                                <a href="${pageContext.request.contextPath }/web/shop/productDetailApi/toRmbProDetailJsp.htm?pid=${recommend3.id}">去看看</a>
                            </div>
                            <p class="ellip">${recommend3.name}</p>
                        </div>
                        <div class="rightRecomPrice">
                            <span class="priceDec"></span>
                            <span class="priceSpan">${recommend3.price}积分</span>
                        </div>
                    </div>
                </div>
            </div>

            <div class="rightRecommend fr">
                <div class="InnerRightRecom fr">
                    <!-- 跳转至竞拍商城 -->
                    <div class="comRightRecom">
                        <div class="innerComRightRecom">
                            <a class="comGoBtn goJingPai" href="${pageContext.request.contextPath}/web/productInfoWeb/list.htm?cmd=4"></a>
                            <div class="rightRecomImg">
                            	<%-- <a href="${pageContext.request.contextPath }/web/shop/categoryApi/toCategoryJsp.htm?cmd=1"> --%>
                                	<img src="/${recommend4.thumbnailurl}" width="100%"/>
                   				<!-- </a> -->             
                                <!-- 跳转至商品详情页 -->
                                <a href="${pageContext.request.contextPath }/web/shop/productDetailApi/toRmbProDetailJsp.htm?pid=${recommend4.id}">去看看</a>
                            </div>
                            <p class="ellip">${recommend4.name}</p>
                        </div>
                        <div class="rightRecomPrice">
                            <span class="priceDec">¥</span>
                            <span class="priceSpan">${recommend4.price}</span>
                        </div>
                    </div>
                    <!-- 跳转至金币商城 -->
                    <div class="comRightRecom margTopRecom">
                        <div class="innerComRightRecom">
                            <a class="comGoBtn goJinBi" href="${pageContext.request.contextPath }/web/shop/categoryApi/toCategoryJsp.htm?cmd=1"></a>
                            	<div class="rightRecomImg">
                            		<%-- <a href="${pageContext.request.contextPath }/web/shop/categoryApi/toCategoryJsp.htm?cmd=1"> --%>
                                		<img src="/${recommend2.thumbnailurl}" width="100%"/>
                                	<!-- </a> -->
                                <!-- 跳转至商品详情页 -->
                                <a href="${pageContext.request.contextPath }/web/shop/productDetailApi/toRmbProDetailJsp.htm?pid=${recommend2.id}">去看看</a>
                            </div>
                            <p class="ellip">${recommend2.name}</p>
                        </div>
                        <div class="rightRecomPrice">
                            <span class="priceDec"></span>
                            <span class="priceSpan">${recommend2.price}金币</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- 限时秒杀-->
    <div class="comMainPart miaoshaPart" style="display:none">
        <div class="comBigTit miaoshaTitBg">
            <strong>限时秒杀</strong>
            <a href="javascript:void(0)">查看更多&gt;&gt;</a>
        </div>
        <div class="innerMiaosha">
            <div class="topInnerMiaosha">
                <ul>
                    <li><a href="">
                        <img src="images/goodsImg/miaosha01.jpg"/>
                    </a></li>
                    <li class="midLi"><a href="">
                        <img src="images/goodsImg/miaosha01.jpg"/>
                    </a></li>
                    <li><a href="">
                        <img src="images/goodsImg/miaosha01.jpg"/>
                    </a></li>
                </ul>
            </div>
            <div class="botInnerMiaosha">
                <ul class="clearfix">
                    <li class="margRLi"><a href="">
                        <span>精品</span>
                        <div class="midTxtPart">
                            <h4>翡翠文化，千古传承</h4>
                            <b>品味 优雅 生活</b>
                            <em class="lineSpan"></em>
                            <p>全场包邮啦啦啦</p>
                        </div>
                        <img src="images/goodsImg/miaosha02.jpg"/>
                    </a></li>
                    <li><a href="">
                        <span>精品</span>
                        <div class="midTxtPart">
                            <h4>翡翠文化，千古传承</h4>
                            <b>品味 优雅 生活</b>
                            <em class="lineSpan"></em>
                            <p>全场包邮啦啦啦</p>
                        </div>
                        <img src="images/goodsImg/miaosha02.jpg"/>
                    </a></li>
                    <li class="margRLi"><a href="">
                        <span>精品</span>
                        <div class="midTxtPart">
                            <h4>翡翠文化，千古传承</h4>
                            <b>品味 优雅 生活</b>
                            <em class="lineSpan"></em>
                            <p>全场包邮啦啦啦</p>
                        </div>
                        <img src="images/goodsImg/miaosha02.jpg"/>
                    </a></li>
                    <li><a href="">
                        <span>精品</span>
                        <div class="midTxtPart">
                            <h4>翡翠文化，千古传承</h4>
                            <b>品味 优雅 生活</b>
                            <em class="lineSpan"></em>
                            <p>全场包邮啦啦啦</p>
                        </div>
                        <img src="images/goodsImg/miaosha02.jpg"/>
                    </a></li>
                </ul>
            </div>
        </div>
    </div>
    <!-- 新品特卖 -->
    <div class="comMainPart xinpinPart">
        <div class="comBigTit xinpinTitBg">
            <strong>新品特卖</strong>
            <a href="${pageContext.request.contextPath }/web/shop/categoryApi/toCategoryJsp.htm?cmd=1">查看更多&gt;&gt;</a>
        </div>
        <div class="clearfix">
            <div class="xinpinLeftPart fl">
                <div class="innerXinpinL">
                    <ul class="clearfix">
                    
                    <c:forEach  items="${newList}" var="n" begin="0" end="5">
                        <li>
                            <div class="xinPinImg">
                                <img src="/${n.thumbnailurl}" width="250px" height="250px"/>
                            </div>
                            <div class="xinPinInfo">
                                <p class="ellip">${n.name}</p>
                            </div>
                            <div class="leftXinPinPrice">
                            	<c:if test="${n.type==1 || n.type==4}">
	                                <span class="priceDec">¥</span>
	                                <span class="priceSpan">${n.price}</span>
                                </c:if> 
                                <c:if test="${n.type==2}">
                               	 	<span class="priceSpan">${n.price}金币</span>
                                </c:if>
                                <c:if test="${n.type==3}">
                                	<span class="priceSpan">${n.price}积分</span>
                                </c:if>
                                <a href="${pageContext.request.contextPath }/web/shop/productDetailApi/toRmbProDetailJsp.htm?pid=${n.id}">去看看</a>
                            </div>
                        </li>
                	</c:forEach>
                
                    </ul>
                </div>
            </div>
            <div class="xinpinRightPart fr">
                <ul>
                  <c:forEach  items="${newList}" var="n" begin="6" end="7">
                    <li>
                        <div class="xinPinImg">
                            <img src="/${n.thumbnailurl}" width="250px" height="250px"/>
                        </div>
                        <div class="xinPinInfo">
                            <p class="ellip">${n.name}</p>
                        </div>
                        <div class="leftXinPinPrice">
                          	   <c:if test="${n.type==1 || n.type==4}">
	                                <span class="priceDec">¥</span>
	                                <span class="priceSpan">${n.price}</span>
                                </c:if> 
                                <c:if test="${n.type==2}">
                               	 	<span class="priceSpan">${n.price}金币</span>
                                </c:if>
                                <c:if test="${n.type==3}">
                                	<span class="priceSpan">${n.price}积分</span>
                                </c:if>
                            <a href="${pageContext.request.contextPath }/web/shop/productDetailApi/toRmbProDetailJsp.htm?pid=${n.id}">去看看</a>
                        </div>
                    </li>
                    </c:forEach>
                   
                </ul>
            </div>
        </div>
    </div>
    <!-- 限时竞拍 -->
    <div class="comMainPart yugaoPart">
        <div class="comBigTit yugaoTitBg">
            <strong>限时竞拍</strong>
            <a href="${pageContext.request.contextPath}/web/productInfoWeb/list.htm?cmd=4">查看更多&gt;&gt;</a>
        </div>
        <div class="clearfix">
            <div class="yugaoLeftPart fl">
                <div class="innerYuGaoL">
                    <ul class="clearfix">
                    	<c:forEach items="${left }" var="auction">
	                        <li class="firstLi">
	                            <div class="yugaoImg">
	                                <a class="goView" href="${pageContext.request.contextPath}/web/productInfoWeb/detail.htm?id=${auction.id}&type=0&upId=${auction.setUpId}&cmd=4">抢先抢好货&gt;&gt;</a>
	                                <img width="250px" height="185px" src="/${auction.images }"/>
	                            </div>
	                            <p class="ellip">${auction.name }</p>
	                        </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
            <div class="yugaoPartRight fr">
                <div class="innerYuGaoR">
                    <ul>
                    	<c:forEach items="${right }" var="auction">
	                        <li>
	                            <div class="yugaoImg">
	                                <a class="comGoBtn goJingPai" href="javascript:void(0)"></a>
	                                <a class="goView" href="${pageContext.request.contextPath}/web/productInfoWeb/detail.htm?id=${auction.id}&type=0&upId=${auction.setUpId}&cmd=4">抢先抢好货&gt;&gt;</a>
	                                <img width="250px" height="185px" src="/${auction.images }"/>
	                            </div>
	                            <p class="ellip">${auction.name }</p>
	                        </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        </div>
    </div>
     <!-- 热门推荐-->
    <div class="comMainPart xinpinPart">
        <div class="comBigTit xinpinTitBg">
            <strong>热门推荐</strong>
            <a href="${pageContext.request.contextPath }/web/shop/categoryApi/toCategoryJsp.htm?cmd=1">查看更多&gt;&gt;</a>
        </div>
        <div class="clearfix">
            <div class="xinpinLeftPart fl">
                <div class="innerXinpinL">
                    <ul class="clearfix">
                    
                    <c:forEach  items="${clickList}" var="n" begin="0" end="5">
                        <li>
                            <div class="xinPinImg">
                                <img src="/${n.thumbnailurl}" width="250px" height="250px"/>
                            </div>
                            <div class="xinPinInfo">
                                <p class="ellip">${n.name}</p>
                            </div>
                            <div class="leftXinPinPrice">
                            	<c:if test="${n.type==1 || n.type==4}">
	                                <span class="priceDec">¥</span>
	                                <span class="priceSpan">${n.price}</span>
                                </c:if> 
                                <c:if test="${n.type==2}">
                               	 	<span class="priceSpan">${n.price}金币</span>
                                </c:if>
                                <c:if test="${n.type==3}">
                                	<span class="priceSpan">${n.price}积分</span>
                                </c:if>
                                <a href="${pageContext.request.contextPath }/web/shop/productDetailApi/toRmbProDetailJsp.htm?pid=${n.id}">去看看</a>
                            </div>
                        </li>
                	</c:forEach>
                
                    </ul>
                </div>
            </div>
            <div class="xinpinRightPart fr">
                <ul>
                  <c:forEach  items="${clickList}" var="n" begin="6" end="7">
                    <li>
                        <div class="xinPinImg">
                            <img src="/${n.thumbnailurl}" width="250px" height="250px"/>
                        </div>
                        <div class="xinPinInfo">
                            <p class="ellip">${n.name}</p>
                        </div>
                        <div class="leftXinPinPrice">
                          	   <c:if test="${n.type==1 || n.type==4}">
	                                <span class="priceDec">¥</span>
	                                <span class="priceSpan">${n.price}</span>
                                </c:if> 
                                <c:if test="${n.type==2}">
                               	 	<span class="priceSpan">${n.price}金币</span>
                                </c:if>
                                <c:if test="${n.type==3}">
                                	<span class="priceSpan">${n.price}积分</span>
                                </c:if>
                            <a href="${pageContext.request.contextPath }/web/shop/productDetailApi/toRmbProDetailJsp.htm?pid=${n.id}">去看看</a>
                        </div>
                    </li>
                    </c:forEach>
                   
                </ul>
            </div>
        </div>
    </div>
</div>
   
<!-- 左侧侧边固定导航栏 -->
<div class="fixedNav absoPos">
    <div class="navDiv">
        <a class="active" href="javascript:void(0)">
            <span class="margTSpan">官方</span>
            <span>推荐</span>
        </a>
        <a href="javascript:void(0)" style="display:none">
            <span class="margTSpan">限时</span>
            <span>秒杀</span>
        </a>
        <a href="javascript:void(0)">
            <span class="margTSpan">新品</span>
            <span>特卖</span>
        </a>
        <a href="javascript:void(0)">
            <span class="margTSpan">限时</span>
            <span>竞拍</span>
        </a>
    </div>
    <a id="backTop" class="backTop" href="javascript:void(0)">
        <span class="margTSpan triSpan"></span>
        <span class="botSpan">顶部</span>
    </a>
</div>
<!-- 联系客服 -->
<div class="kefuDiv absoPos">
    <div class="kefuDec"></div>
    <div class="kefuCon">
        <a class="qqA" href="">
            <img src="images/qq.jpg"/>
        </a>
        <a class="qqA" href="">
            <img src="images/qq.jpg"/>
        </a>
    </div>
    <div class="kefuCon">
        <a class="weixinA" href="">
            <img src="images/weixin.jpg"/>
        </a>
        <a class="weixinA" href="">
            <img src="images/weixin.jpg"/>
        </a>
    </div>
</div>

<%@ include file="foot.jsp" %>

<script src="${pageContext.request.contextPath}/web/js/index.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
    $(function () {
        initSmBtnNum();
    });
   
    function queryPro(cid, sort) {
        var cid1 = '';
        var cid2 = '';
        if (sort == 1) {
            cid1 = cid;
        }
        if (sort == 2) {
            cid2 = cid;
        }

        window.location.href = "${pageContext.request.contextPath }/web/shop/categoryApi/toCategoryJsp.htm?cid1=" + cid1 + "&cid2=" + cid2 + "&cmd=1";

    }
   


</script>
</body>
