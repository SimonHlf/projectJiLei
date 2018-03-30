<%@page pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
	<meta charset="UTF-8">
	<title>竞拍专区</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/web/Module/auctionArea/css/auctionArea.css"> 
</head>
<body>
		<%@ include file="../../head.jsp"%>  
		<!-- 竞拍列表 -->
		<div class="auctionArea w1100">
			<div class="auctionWay_newPro">
				<div class="auctionMod">
					<p>
						<strong class="jingPaiTit">限时竞拍</strong>
						<strong class="newPro">最新商品</strong>
					</p>
				</div>
				<div class="clearfix">
					<div class="listAuction fl">
						<ul>
							<c:set var="nowDate" value="<%=System.currentTimeMillis()%>"></c:set>
							<c:forEach items="${list }" var="product">
								<li>
									<div class="leftAuctionImg fl">
										<a href="${pageContext.request.contextPath}/web/productInfoWeb/detail.htm?id=${product.id}&type=0&upId=${product.setUpId}&cmd=4">
											<img class="leftAuctionImg fl" src="/${product.images}"  />
										</a>
									</div>
									<div class="rightActionInfo fl">
										<strong>${product.name }</strong>
										<p class="auctionComp"><span><%-- 送拍机构：</span>${product.beat } --%></p>
										<p class="countDown">
											<span>距<span class="oneBlank"></span>结<span class="oneBlank"></span>束：</span>
											<%-- <input type="text" value="${nowDate - product.startTime.getTime() > 0 }"> --%>
											<span class="endtime showtime" value="${product.downTime }"></span>
										</p>
									</div>
									<p class="jingpaiP bgColor">
										<span class="auctionTimes">${product.count }次</span>
										<span>竞拍</span>
									</p>
								</li>
							</c:forEach>
							<c:forEach items="${jrList }" var="product">
								<li>
									<div class="leftAuctionImg fl">
										<a href="${pageContext.request.contextPath}/web/productInfoWeb/detail.htm?id=${product.id}&type=0&upId=${product.setUpId}&cmd=4">
											<img class="leftAuctionImg fl" src="/${product.images}"  />
										</a>
									</div>
									<div class="rightActionInfo fl">
										<strong>${product.name }</strong>
										<p class="auctionComp"><span><%-- 送拍机构：</span>${product.beat } --%></p>
										<p class="countDown">
											<span>开拍时间：</span>
											<span>${product.startTime }</span>
										</p>
									</div>
									<p class="jingpaiP bgColor">
										<span class="auctionTimes">${product.count }次</span>
										<span>竞拍</span>
									</p>
								</li>
							</c:forEach>
						</ul>
					</div>
					<div class="sideAuction fr">
						<div class="innerSide">
							<!-- 顶部公告 帮助 规则 -->
							<div class="useHelpTxt">
								<ul class="helpNav clearfix">
									<li class="active">公告</li>
									<li>规则</li>
									<li>帮助</li>
								</ul>
								<div class="comHelpCon" style="display: block;">
									<p><a href="">我是公告信息我是公告信息</a></p>
									<p><a href="">我是公告信息我是公告信息</a></p>
									<p><a href="">我是公告信息我是公告信息</a></p>
								</div>
								<div class="comHelpCon">
									<p><a href="">我是规则信息我是规则信息</a></p>
									<p><a href="">我是规则信息我是规则信息</a></p>
									<p><a href="">我是规则信息我是规则信息</a></p>
									<p><a href="">我是规则信息我是规则信息</a></p>
								</div>
								<div class="comHelpCon">
									<p><a href="">我是帮助信息我是帮助信息</a></p>
									<p><a href="">我是帮助信息我是帮助信息</a></p>
								</div>
							</div>
							<div class="smMod">
								<strong>推荐好货</strong>
							</div>
							<div class="goodProList">
								<ul>
									<c:forEach items="${tjList }" var="list">
										<li>
											<div class="proImg">
												<img width="220px;" height="220px;" src="/${list.images}&cmd=4"  />
												<%-- <img src="${pageContext.request.contextPath}/web/Module/auctionArea/images/haohuo.jpg"/> --%>
												<p class="proTit">
													<a href="${pageContext.request.contextPath}/web/productInfoWeb/detail.htm?id=${list.id}&upId=${list.setUpId}">${list.name }</a>
												</p>
											</div>
											<p class="nowPrice">当前价：<span>¥${list.moneyNow }</span></p>
										</li>
									</c:forEach>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="auctionWay_tomPro">
				<div class="auctionMod">
					<p>
						<strong class="jingPaiTit">限时竞拍</strong>
						<strong class="newPro">明日商品</strong>
					</p>
				</div>
				<div class="clearfix">
					<div class="listAuction fl">
						<ul>
							<c:forEach items="${tomorrowList }" var="list">
								<li>
									<div class="leftAuctionImg fl">
										<a href="${pageContext.request.contextPath}/web/productInfoWeb/detail.htm?id=${list.id}&type=1&upId=${list.setUpId}&cmd=4">
											<%-- <img src="${pageContext.request.contextPath}/web/Module/auctionArea/images/auction.jpg"/> --%>
											<img class="leftAuctionImg fl" src="/${list.images}"  />
										</a>
									</div>
									<div class="rightActionInfo fl">
										<strong>${list.name }</strong>
										<p class="auctionComp"><span><%-- 送拍机构：</span>${list.beat } --%></p>
										<p class="countDown">
											<span>开拍时间：</span>
											${list.startTime }
										</p>
									</div>
									<p class="jingpaiP bgColor1">
										<span class="auctionTimes">	${list.pageView }人</span>
										<span>看过</span>
									</p>
								</li>
							</c:forEach>
						</ul>
					</div>
					<div class="sideAuction fr">
						<div class="innerSide">
							<div class="smMod">
								<strong>推荐好货</strong>
							</div>
							<div class="goodProList">
								<ul>
									<c:forEach items="${mrList }" var="list">
										<li>
											<div class="proImg">
												<img width="220px;" height="220px;" src="/${list.images}"  />
												<%-- <img src="${pageContext.request.contextPath}/web/Module/auctionArea/images/haohuo.jpg"/> --%>
												<p class="proTit">
													<a href="${pageContext.request.contextPath}/web/productInfoWeb/detail.htm?id=${list.id}&upId=${list.setUpId}&cmd=4">${list.name }</a>
												</p>
											</div>
											<p class="nowPrice">当前价：<span>¥${list.moneyNow }</span></p>
										</li>
									</c:forEach>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 待拍展品 -->
			<div class="waitAuction w1100">
				<p class="waitTit">待拍展品</p>
				<div class="waitProList">
					<div class="comTri leftTri"></div>
					<div class="comTri rightTri"></div>
					<div class="listWaitAuc">
						<ul class="clearfix">
							<c:forEach items="${hList }" var="list">
								<li>
									<div class="waitAucImg">
										<img width="220px;" height="220px;" src="/${list.images}"  />
										<p class="aucTit"><a href="${pageContext.request.contextPath}/web/productInfoWeb/detail.htm?id=${list.id}&type=1&upId=${list.setUpId}&cmd=4">${list.name }</a></p>
									</div>
									<p class="nowPrice1">当前价：<span>¥${list.moneyNow }</span></p>
								</li>
							</c:forEach>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<%@ include file="../../foot.jsp"%> 
		<script src="${pageContext.request.contextPath}/web/js/jquery-1.7.2.min.js" type="text/javascript" charset="utf-8"></script>
		<!-- Jquery countdown倒计时插件 -->
		<script src="https://cdn.bootcss.com/jquery.countdown/2.1.0/jquery.countdown.js"></script>
		<script type="text/javascript">
			var serverTime = '${time}'; //服务器时间，毫秒数 
			$(function(){
				switchNav();
				 var dateTime = new Date(); 
				 var difference = dateTime.getTime() - serverTime; //客户端与服务器时间偏移量 
				 setInterval(function(){ 
				   $(".endtime").each(function(){ 
				    var obj = $(this); 
				    var endTime = new Date(parseInt(obj.attr('value'))); 
				    var nowTime = new Date(); 
				    var nMS=endTime.getTime() - nowTime.getTime() + difference; 
				    var myD=Math.floor(nMS/(1000 * 60 * 60 * 24)); //天 
				    var myH=Math.floor(nMS/(1000*60*60)) % 24; //小时 
				    var myM=Math.floor(nMS/(1000*60)) % 60; //分钟 
				    var myS=Math.floor(nMS/1000) % 60; //秒 
				    var myMS=Math.floor(nMS/100) % 10; //拆分秒 
				    if(myD>= 0){ 
				      var str = "<em>"+myD+"</em>天<em>"+myH+"</em>小时<em>"+myM+"</em>分<em>"+myS+"</em>.<em>"+myMS+"</em>秒"; 
				    }else{ 
				      var str = "已结束！";  
				    } 
				    obj.html(str); 
				   }); 
				  }, 100); //每个0.1秒执行一次 
			});
			function switchNav(){
				$(".helpNav li").each(function(i){
					$(this).click(function(){
						$(".comHelpCon").hide();
						$(this).addClass("active").siblings().removeClass("active");
						$(".comHelpCon").eq(i).show();
					});
				});
			}
		</script>
	</body>
