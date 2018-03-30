<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${list.size()==0}">

</c:if>
<c:if test="${list.size()>0}">

	<c:forEach items="${list}" var="order">
		<table class="orderListTab" cellpadding="0" cellspacing="0">
			<tr>
				<th class="listTh" colspan="8"><span class="orderTime">${order.creattime}</span>
					<span class="orderNum">订单编号：${order.ordernum}</span> <!-- 西藏锦绣 -->

					<c:if test="${order.status ==3}">
						<a class="delOrder" href=""></a>
					</c:if></th>
			</tr>
			<tr>
				<td class="paddTd noBorRight">
					<div class="orderProImg">
						<a
							href="${pageContext.request.contextPath }/web/shop/productDetailApi/toRmbProDetailJsp.htm?pid=${order.productId}"><img
							src="/${order.thumbnailUrl}" /></a>
					</div>
					<p class="proTitA">
						<a href="">${order.productName}</a>
					</p>
				</td>
				<td class="twoWidTd txtCen noBorLeft noBorRight">
					<div class="comPosTd">
						<p class="oldPriceSp">￥${order.price}</p>
						<p class="nowPriceSp">￥${order.buyPrice}</p>
					</div>
				</td>
				<td class="twoWidTd txtCen noBorLeft noBorRight">
					<div class="comPosTd">
						<p>${order.number}</p>
					</div>
				</td>
				<td class="twoWidTd txtCen noBorLeft noBorRight">
					<div class="comPosTd">
						<!--01：违规举报
													02：申请售后
													03:退款/退货
													04:投诉卖家-->
						<c:if test="${order.paystate ==0 && order.status ==2}">


						</c:if>
						<c:if
							test="${order.paystate ==1 && order.status ==2 && order.setState ==0}">
							<!-- 确认发货 -->
							<c:if test="${order.type==2}">
								<a class="comBlockA goPayBtn"
									href="javascript:orderExchange('${order.id}',2)">确认发货</a>
								<a class="comBlockA goPayBtn" href="javascript:void(0);"
									onclick="bidders(${order.id });">转为竞拍商品</a>
							</c:if>
							<c:if test="${order.type==3}">
								<a class="comBlockA goPayBtn"
									href="javascript:orderExchange('${order.id}',2)">确认发货</a>
								<a class="comBlockA goPayBtn"
									href="javascript:orderExchange('${order.id}',3)">兑换金币</a>
							</c:if>
						</c:if>

					</div>
				</td>
				<td class="threedWidTd txtCen">
					<div class="comPosTd">
						<p>
							<strong>￥${order.totalamount}</strong>
						</p>
						<p>(含运费：￥${order.trans})</p>
					</div>
				</td>
				<td class="threedWidTd txtCen">
					<!--01：等待买家付款
												02：卖家已发货
												03：交易成功-->
					<div class="comPosTd">

						<c:if test="${order.paystate ==0 && order.status ==2}">
							<p>等待买家付款</p>
						</c:if>
						<c:if
							test="${order.paystate ==1 && order.status ==2 && order.setState ==0}">
							<p>买家已付款</p>
						</c:if>
						<c:if
							test="${order.paystate ==1 && order.status ==2 && order.setState ==2}">
							<p>等待卖家发货</p>
						</c:if>
						<c:if
							test="${order.paystate ==1 && order.status ==2 && order.setState ==1}">
							<p>卖家已发货</p>
							<p>
								<a
									href="javascript:queryWuliu('${order.id}','${order.tracknum}','${order.expressnum}')">查看物流</a>
							</p>
						</c:if>
						<c:if
							test="${order.paystate ==1 && order.status ==2 && order.setState ==3 && order.isConment ==0}">
							<p>待评价</p>
							<p>
								<a
									href="javascript:queryWuliu('${order.id}','${order.tracknum}','${order.expressnum}')">查看物流</a>
							</p>
						</c:if>
						<c:if test="${order.status ==1}">
							<p>交易成功</p>
							<p>
								<a
									href="javascript:queryWuliu('${order.id}','${order.tracknum}','${order.expressnum}')">查看物流</a>
							</p>
						</c:if>
						<c:if test="${order.status ==3}">
							<p>交易关闭</p>
						</c:if>
						<p>
							<a
								href="${pageContext.request.contextPath }/web/shop/orderApi/orderDetail.htm?id=${order.id}">订单详情</a>
						</p>
					</div>
				</td>
				<td class="threedWidTd txtCen">
					<!--01：立即付款
												02：确认收货
												03：立即评价
												04:取消订单-->
					<div class="comPosTd">
						<c:if test="${order.paystate ==0 && order.status ==2}">
							<a class="comBlockA goPayBtn" href="">立即付款</a>
							<p>
								<a href="javascript:cancelOrder('${order.id}')">取消订单</a>
							</p>
						</c:if>

						<c:if
							test="${order.paystate ==1 && order.status ==2 && order.setState ==2}">
							<!-- 待发货 -->

						</c:if>
						<c:if
							test="${order.paystate ==1 && order.status ==2 && order.setState ==1}">
							<!-- <p>待收货</p> -->
							<a class="comBlockA getProBtn"
								href="javascript:receivePro('${order.ordernum}','${order.id}')">确认收货</a>
						</c:if>
						<c:if
							test="${order.paystate ==1 && order.status ==2 && order.setState ==3 && order.isConment ==0}">
							<!-- <p>待评价</p> -->
							<a class="comBlockA commentA"
								href="javascript:toComment('${order.id}','${order.ordernum}','${order.productId}')">立即评价</a>
						</c:if>
						<c:if test="${order.status ==1}">
							<!-- <p>交易成功</p> -->

						</c:if>
						<c:if test="${order.status ==3}">
							<!-- <p>订单已取消</p> -->

						</c:if>
					</div>
				</td>
			</tr>
		</table>
	</c:forEach>
</c:if>
<%-- <script type="text/javascript" src="${pageContext.request.contextPath }/web/js/jquery-1.7.2.min.js"></script>					
		<script type="text/javascript">
				</script> --%>