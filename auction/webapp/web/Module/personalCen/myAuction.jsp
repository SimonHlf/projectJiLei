<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8">
		<title>竞拍记录</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/web/Module/personalCen/css/myShopCart.css"/>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/web/css/pagination.css"/>
	</head>
	<body>
		<div id="content">
		<%@ include file="../../head.jsp"%>  
		<!-- 个人中心内容 -->
		<div class="personalCenCon clearfix w1100">
			<%@ include file="personalHead.jsp" %>
			<div class="rightPersonal fr">
				<strong class="rightTit"><span></span>竞拍记录</strong>
				<div class="rightCon">
				
					<div class="cartConNav">
						<ul>
							<li class="oneAutiontWid">
								<span>商品信息</span>
							</li>
							<li class="twoAuctionWid">
								<span>拍卖时间</span>
							</li>
							<li class="threeAuctionWid">
								<span>拍卖金额(积分)</span>
							</li>
							<li class="threeAuctionWid">
								<span>是否成交</span>
							</li>
						</ul>
					</div>
					<div class="innerCartCon">
						<%-- <ul>
							<c:forEach items="${list }" var="list">
								<li class="clearfix">
									<div class="comInnerCart oneAutiontWid1">
										<div class="cartThumb">
											<img width="80px" height="80px" src="/${list.images }"/>
										</div>
										<div class="cartProTit1">
											<a href="${pageContext.request.contextPath}/web/productInfoWeb/detail.htm?id=${list.id}&upId=${list.setId}&cmd=7">${list.name }</a>
										</div>
									</div>
									<div class="comInnerCart twoAuctionWid">
										<p class="timeP">${list.createTime }</p>
									</div>
									<div class="comInnerCart threeAuctionWid">
										<p class="totalPrice">¥${list.money }</p>
									</div>
									<div class="comInnerCart threeAuctionWid">
										<p class="timeP">
											<c:if test="${list.status==1 }">成交</c:if>
											<c:if test="${list.status==0 }">未成交</c:if>
											<c:if test="${list.status==2 }">撤销</c:if>
										</p>
									</div>
								</li>
							</c:forEach>
							</ul> --%>
							<ul class="clearfix" id="listProUl">	
							</ul>
							<div id="Pagination" class="pagination"></div>
					</div>
				
					<%-- <div class="cartConNav">
						<ul>
							<li class="oneCartWid">
								<span>商品信息</span>
							</li>
							<li class="twoCartWid">
								<span>单价</span>
							</li>
							<li class="twoCartWid">
								<span>数量</span>
							</li>
							<li class="twoCartWid">
								<span>拍卖金额</span>
							</li>
							<li class="twoCartWid">
								<span>操作</span>
							</li>
						</ul>
					</div>
					<div class="innerCartCon">
						<ul>
							<c:forEach items="${list }" var="list">
								<li class="clearfix">
								<div class="comInnerCart oneCartWid1">
									<div class="cartThumb">
										<img src="images/cartPro.jpg"/>
									</div>
									<div class="cartProTit">
										<a href="">${list.name }</a>
									</div>
									<div class="shopImg">
										<a href="">
											<img src="images/shopThumb.jpg"/>
											<span>西藏锦绣</span>
										</a>
									</div>
									<div class="cartCateg"><p>颜色分类：5/5S/SE闪粉【白色】前后</p></div>
								</div>
								<div class="comInnerCart twoCartWid">
									<p class="oldPrice">¥2600</p>
									<p>¥${list.money }</p>
								</div>
								<div class="comInnerCart twoCartWid">
									<div class="buyNum fl">
										<span class="leftSp reduce">-</span>
										<p><input type="text" value="1"></p>
										<span class="rightSp plus">+</span>
									</div>
								</div>
								<div class="comInnerCart twoCartWid">
									<p class="totalPrice">¥2600</p>
								</div>
								<div class="comInnerCart twoCartWid">
									<a class="auctionBtn" href="turnAuction.html">转拍</a>
									<a class="getGoods" href="">我要提货</a>
									<span class="tradeTime">交易时间：2018-03-06</span>
								</div>
							</li>
							</c:forEach>
							
						</ul>
					</div> 
					<div class="sameRecommend">
						<strong class="recomTit" style="margin-left: 10px;">同场推荐</strong>
						<div class="sameRecomCon" style="margin:0 auto;">
							<div class="comTri leftTri"></div>
							<div class="comTri rightTri"></div>
							<ul class="clearfix">
								<li>
									<div class="recomImgDiv">
										<img src="images/recommend.jpg"/>
										<p class="proTit">
											<a href="">金玉满堂金玉满堂</a>
										</p>
									</div>
									<p class="nowPrice1">当前价：<span>¥2500</span></p>
								</li>
								<li>
									<div class="recomImgDiv">
										<img src="images/recommend.jpg"/>
										<p class="proTit">
											<a href="">金玉满堂金玉满堂</a>
										</p>
									</div>
									<p class="nowPrice1">当前价：<span>¥2500</span></p>
								</li>
								<li>
									<div class="recomImgDiv">
										<img src="images/recommend.jpg"/>
										<p class="proTit">
											<a href="">金玉满堂金玉满堂</a>
										</p>
									</div>
									<p class="nowPrice1">当前价：<span>¥2500</span></p>
								</li>
							</ul>
						</div>
					</div>--%>
				</div>
			</div>
		</div>
		</div>
		<%@ include file="../../foot.jsp"%>  
		
		<script type="text/javascript" src="${pageContext.request.contextPath }/web/js/jquery-1.7.2.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/web/js/jquery.pagination.js"></script>	
		<script type="text/javascript">
			var pageSize = '${page.pageSize}';
			var totalListNum = '${page.total}';
			
			$(function(){
				showPageMBInfo('');
			});
			//分页用
			function showPageMBInfo(){
				var allCount = '${page.total}';
			    $("#Pagination").pagination(allCount, {
			        callback: pageselectCallback,  //PageCallback() 为翻页调用次函数。
			        prev_text: "上一页",
			        next_text: "下一页 ",
			        items_per_page:pageSize,
			        ellipse_text:"...",
			        num_edge_entries: 1,       //两侧首尾分页条目数
			        num_display_entries: 3   //连续分页主体部分分页条目数
			    });
			}
			//显示出列表数据
			function pageselectCallback(page_index,jq){
				getMBList(page_index+1,pageSize);
			}
			function getMBList(page,pageSize){
				$.ajax({
					type : "post",
					data:{page:page,pageSize:pageSize},
					url : "${pageContext.request.contextPath }/web/auctionOrder/toMyAcutionPage.htm",
					success : function(html) {
						$("#listProUl").html(html);
					}
				});
			}	
			function message(username){
				mymsg(username);
			}
			
			function mymsg(str){
				$.ajax({
					type:'post',
					data:"username="+str,
					url:'${pageContext.request.contextPath}/web/tuimsgController/getPersonTuimsg.htm',
					success:function(data){
						$("#content").html(data);	
					},
					error:function(data){
					}
				});			
			}
		</script>
	</body>
</html>
