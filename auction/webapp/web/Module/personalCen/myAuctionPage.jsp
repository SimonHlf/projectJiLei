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
		<div class="comInnerCart threeAuctionWid">
			<p class="totalPrice">${list.money }</p>
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