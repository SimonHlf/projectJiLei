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
				<a href="${pageContext.request.contextPath}/web/productInfoWeb/detail.htm?id=${list.pid}&upId=${list.sid}&cmd=7">${list.name }</a>
			</div>
		</div>
		<div class="comInnerCart twoAuctionWid">
			<p class="timeP">${list.startTime }</p>
		</div>
		<div class="comInnerCart threeAuctionWid">
			<p class="totalPrice">${list.price }</p>
		</div>
		<div class="comInnerCart threeAuctionWid">
			<p class="timeP">
				<c:choose>
					<c:when test="${list.status==8 }">
						拍卖未开始
					</c:when>
					<c:when test="${list.status==9 }">
						<a class="auctionBtn" href="javascript:void(0)" onclick="beat(${list.pid})">设置</a>
					</c:when>
					<c:when test="${list.status==4 || list.status==6}">
						已成交
					</c:when>
					<c:when test="${list.status==5 }">
						请等待付款
					</c:when>
					<c:when test="${list.status==7 }">
						已提货
					</c:when>
					<c:when test="${list.status==0 }">
						交易中
					</c:when>
					<c:otherwise>
						交易中
					</c:otherwise>
				</c:choose>
			</p>
		</div>
	</li>
</c:forEach>
