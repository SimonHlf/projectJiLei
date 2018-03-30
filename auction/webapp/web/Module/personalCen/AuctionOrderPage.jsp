<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		<div class="comInnerCart twoCartWid">
			<p class="totalPrice">${list.money }</p>
		</div>
		<div class="comInnerCart twoCartWid">
			<c:if test="${list.status==5 }">
				<p class="statusP">交易中...</p>
			</c:if>
			<c:if test="${list.status==4 }">
				<p class="statusP">交易完成</p>
			</c:if>
			<c:if test="${list.status==6 }">
				<p class="statusP">已转拍</p>
			</c:if>
			<c:if test="${list.status==7 }">
				<p class="statusP">已提货</p>
			</c:if>
		</div>
		<div class="comInnerCart twoCartWid">
			<c:if test="${list.status==5 }">
				<a class="auctionBtn" href="javascript:void()" onclick="payment(${list.orderId},${list.id })">付款</a>
			</c:if>
			<c:if test="${list.status==4 }">
				<a class="auctionBtn" href="javascript:void(0)" onclick="beat(${list.orderId})">转拍</a>
		<%-- 											<a class="auctionBtn" href="${pageContext.request.contextPath }/web/Module/personalCen/turnAuction.jsp">转拍</a> --%>
				<a class="getGoods" href="javascript:void(0)" onclick="goods(${list.orderId},${list.status })">我要提货</a>
			</c:if>
			<c:if test="${list.status==6 }">
				已转拍
				<a class="getGoods" href="javascript:void(0)" onclick="goods(${list.orderId},${list.status })">我要提货</a>
			</c:if>
			<c:if test="${list.status==7 }">
				<a class="getGoods" href="" >物流信息</a>
			</c:if>
			<c:if test="${list.status==8 }">
				<a class="getGoods" href="" >违规</a>
			</c:if>
			</div>
	</li>
</c:forEach>
