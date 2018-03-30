<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8">
		<title>订单详情</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/web/Module/personalCen/css/orderDetail.css"/>
	</head>
	<body>
		<!-- 顶部副导航 -->
		<%@ include file="../../head.jsp"%>  
		
		<div class="orderDetail clearfix">
			<div class="leftDetail">
				<div class="topLeftDetail">
					<strong>订单详情</strong>
				</div>
				<div class="botLeftDetail">
					<div class="innerBotLeft">
						<span>收货地址：</span>
						<p>（${orderVo.receivername}）  ${orderVo.receivertel}  ${orderVo.receiveraddress}</p>
					</div>
					<!-- <div class="innerBotLeft">
						<span>买家留言：</span>
						<p></p>
					</div>
					<div class="innerBotLeft">
						<span>商家名称：</span>
						<p><a href="">西藏锦绣</a></p>
					</div> -->
				</div>
			</div>
			<div class="rightDetail">
				<strong class="titStrong">订单状态：
					<c:if test="${orderVo.paystate ==0 && orderVo.status ==2}">
						等待买家付款
					</c:if>
					<c:if test="${orderVo.paystate ==1 && orderVo.status ==2 && orderVo.setState ==0}">
						买家已付款
						<!-- 确认发货 -->
						<c:if test="${orderVo.type==2}">	
							<p>您可以<a  href="javascript:orderExchange('${orderVo.id}',2)">确认发货</a></p>
							<p>您可以<a  href="javascript:void(0);" onclick="bidders(${orderVo.id });">转为竞拍商品</a></p>
						</c:if>
						<c:if test="${orderVo.type==3}">
							<p>您可以<a  href="javascript:orderExchange('${orderVo.id}',2)">确认发货</a></p>
							<p>您可以<a  href="javascript:orderExchange('${orderVo.id}',3)">兑换金币</a></p>
						</c:if>
					</c:if>
					<c:if test="${orderVo.paystate ==1 && orderVo.status ==2 && orderVo.setState ==2}">
						等待卖家发货
					</c:if>
					<c:if test="${orderVo.paystate ==1 && orderVo.status ==2 && orderVo.setState ==1}">
						卖家已发货
						<p>物流：运单号 : ${orderVo.tracknum} <a href="javascript:queryWuliu('${orderVo.id}','${orderVo.tracknum}','${orderVo.expressnum}')">查看物流</a></p>
						<p>您可以<span class="shouhuoBtn" onclick="receivePro('${orderVo.ordernum}','${orderVo.id}')">确认收货</span></p>
					</c:if>
					<c:if test="${orderVo.paystate ==1 && orderVo.status ==2 && orderVo.setState ==3 && orderVo.isConment ==0}">
						待评价
					<p>物流：运单号 : ${orderVo.tracknum} <a href="javascript:queryWuliu('${orderVo.id}','${orderVo.tracknum}','${orderVo.expressnum}')">查看物流</a></p>
						<p><a href="">去评价</a></p>
					</c:if>
					<c:if test="${orderVo.status ==1}">
						交易成功
						<p>物流：运单号 : ${orderVo.tracknum} <a href="javascript:queryWuliu('${orderVo.id}','${orderVo.tracknum}','${orderVo.expressnum}')">查看物流</a></p>
					</c:if>
					<c:if test="${orderVo.status ==3}">
						交易关闭
					</c:if>
				
				
				</strong>

				<!-- <p>您还有<strong>9天1小时45分55秒</strong>来确认收货,超时订单自动确认收货</p> -->
				<!-- <p>物流：中通快递运单号 : 483028470546 <a href="">查看更多</a></p> -->
				<!-- <p>您可以<span class="shouhuoBtn">确认收货</span></p> -->
			</div>
		</div>
		<!-- 确认订单 -->
		<div class="confirmOrderDiv w1100">
			<ul class="confirmNav" style="border:1px solid #dedede;border-bottom: none;">
				<li class="confirWid1">商品</li>
				<li class="confirWid2">商品属性</li>
				<li class="confirWid2">单价</li>
				<li class="confirWid2">数量</li>
				<!-- <li class="confirWid5">状态</li> -->
			</ul>
			<div class="confirmDetail">
				<ul>
					<c:forEach items="${list}" var="order">
						<li class="clearfix">
							<div class="comInnerCon confirWid3 detailCon">
								<div class="topProDetail">
									<div class="thumbnailImg">
										<img src="/${order.thumbnailUrl}" />
									</div>
									<a href="">${order.productName}</a>
									<%-- <p>
										<a href="">
											<img src="${pageContext.request.contextPath }/web/Module/personalCen/confirmOrder/images/shopThumb.jpg"/>
											<span>西藏锦绣</span>
										</a>
									</p> --%>
								</div>
							</div>
							<div class="comInnerCon confirWid4">${order.specComment}</div>
							<c:if test="${order.type == 1 || order.type==4}">
								<div class="comInnerCon confirWid4">单价：￥${order.buyPrice}</div>
							</c:if>
							<c:if test="${order.type == 2}">
								<div class="comInnerCon confirWid4">单价：${order.buyPrice}积分</div>
							</c:if>
							<c:if test="${order.type == 3}">
								<div class="comInnerCon confirWid4">单价：${order.buyPrice}金币</div>
							</c:if>
							<div class="comInnerCon confirWid4 clearfix">${order.number}</div>
							
						<%-- 	<div class="comInnerCon confirWid4">
								<c:if test="${orderVo.paystate ==0 && orderVo.status ==2}">
									<strong class="totalPrice">等待买家付款</strong>
								</c:if>
								<c:if test="${orderVo.paystate ==1 && orderVo.status ==2 && orderVo.setState ==0}">
									<strong class="totalPrice">买家已付款</strong>
								</c:if>
								<c:if test="${orderVo.paystate ==1 && orderVo.status ==2 && orderVo.setState ==2}">
									<strong class="totalPrice">等待卖家发货</strong>
								</c:if>
								<c:if test="${orderVo.paystate ==1 && orderVo.status ==2 && orderVo.setState ==1}">
									<strong class="totalPrice">卖家已发货</strong>
									
								</c:if>
								<c:if test="${orderVo.paystate ==1 && orderVo.status ==2 && orderVo.setState ==3 && orderVo.isConment ==0}">
									<strong class="totalPrice">待评价</strong>
									
								</c:if>
								<c:if test="${orderVo.status ==1}">
									<strong class="totalPrice">交易成功</strong>
									
								</c:if>
								<c:if test="${orderVo.status ==3}">
									<strong class="totalPrice">交易关闭</strong>
								</c:if>
							
							</div> --%>
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>
		<div class="botDetails w1100">
			<!-- <p class="leftP">返还：2200积分</p> -->
			<!-- <p class="rightP">商品总价：<span>¥2200.00</span></p>
			<p class="rightP">运费（快递）：<span>¥0.00</span></p> -->
			
			<c:if test="${orderVo.type == 1 || orderVo.type==4}">
				<p class="rightP specP">订单总价：<span>¥${orderVo.totalamount}</span></p>
				<p class="rightP specP">实付款：<span class="specSpan">¥${orderVo.totalamount}</span></p>
			</c:if>
			<c:if test="${orderVo.type == 2}">
				<p class="rightP specP">订单总价：<span>${orderVo.totalamount}积分</span></p>
				<p class="rightP specP">实付款：<span class="specSpan">${orderVo.totalamount}积分</span></p>
			</c:if>
			<c:if test="${orderVo.type == 3}">
				<p class="rightP specP">订单总价：<span>${orderVo.totalamount}金币</span></p>
				<p class="rightP specP">实付款：<span class="specSpan">${orderVo.totalamount}金币</span></p>
			</c:if>
		</div>
		
		
		<%@ include file="../../foot.jsp"%>  
	
	<script type="text/javascript" src="${pageContext.request.contextPath }/web/js/jquery-1.7.2.min.js"></script>	
	<script type="text/javascript">
	function bidders(id){
		location.href='${pageContext.request.contextPath }/web/auctionOrder/beat2.htm?id='+id;
	}

	function orderExchange(orderId,receive){
		$.ajax({
			type : "post",
			data:{id:orderId,receive:receive},
			url : "${pageContext.request.contextPath }/web/shop/orderApi/orderExchange.htm",
			success : function(data) {
				// data=eval("("+data+")");
				if(data.result=="ok"){
					alert(data.msg);
					//setTimeout('window.location.href = "${pageContext.request.contextPath }/web/shop/orderApi/myOrderListPage.htm"',1500);
					window.location.href="${pageContext.request.contextPath }/web/shop/orderApi/myOrderList.htm";
				}
				if(data.result=="fail"){
					alert(data.msg);
				}
				
			}
		});
	}
	
	//确认收货
	function receivePro(orderNum,id){
		alert(orderNum,id)
		$.ajax({
			type : "post",
			data:{orderNum:orderNum,id:id},
			url : "${pageContext.request.contextPath }/web/shop/orderApi/receivePro.htm",
			success : function(data) {
				// data=eval("("+data+")");
				if(data.result=="ok"){
					alert(data.msg);
					//setTimeout('window.location.href = "${pageContext.request.contextPath }/web/shop/orderApi/myOrderListPage.htm"',1500);
					window.location.href="${pageContext.request.contextPath }/web/shop/orderApi/orderDetail.htm?id="+id;
				}
				if(data.result=="fail"){
					alert(data.msg);
				}
				
			}
		});
	}
	//查询物流
	//&expressnum=ems&tracknum=1197081775996'
	function queryWuliu(id,tracknum,expressnum){
		window.location.href="${pageContext.request.contextPath }/web/shop/orderApi/queryLogistics.htm?orderId="+id+"&expressnum=ems&tracknum=1197081775996";
		//window.location.href="${pageContext.request.contextPath }/web/shop/orderApi/queryLogistics.htm?orderId="+id+"&expressnum="+expressnum+"&tracknum="+tracknum;
	}
	</script>
	</body>
</html>
