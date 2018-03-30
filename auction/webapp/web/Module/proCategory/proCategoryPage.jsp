<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${list.size()==0}">
</c:if>
<c:if test="${list.size()>0}">
	<c:forEach items="${list}" var="n">
		<li>
			<div class="proImg" onclick="proDetail(${n.id})">
				<img src="/${n.thumbnailurl}" />
			</div>
			<div class="proPrice">
				<c:if test="${n.type==1 || n.type==4}">
					<span class="priceDec">¥</span>
					<span class="nowPriceSp">${n.price}</span>
					<span class="oldPriceSp">¥${n.marketprice}</span>
				</c:if>
				<c:if test="${n.type==2}">
					<span class="priceDec"></span>
					<span class="nowPriceSp">${n.price}金币</span>
					<span class="oldPriceSp">${n.marketprice}金币</span>
				</c:if>
				<c:if test="${n.type==3}">
					<span class="priceDec"></span>
					<span class="nowPriceSp">${n.price}积分</span>
					<span class="oldPriceSp">${n.marketprice}积分</span>
				</c:if>
			</div>
			<div class="proInfoTxt">
				<a
					href="${pageContext.request.contextPath }/web/shop/productDetailApi/toRmbProDetailJsp.htm?pid=${n.id}">
					<p>${n.name}</p>
				</a>
			</div>
		</li>
	</c:forEach>
</c:if>