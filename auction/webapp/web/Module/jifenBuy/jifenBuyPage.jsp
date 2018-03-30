<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${list.size()==0}">

</c:if>
<c:if test="${list.size()>0}">
	<c:forEach var="n" items="${list}">
		<li><strong class="ellip">${n.name}</strong>
			<div class="jifenProImg" onclick="proDetail(${n.id})">
				<img src="/${n.thumbnailurl}" width="270px" height="190" />
			</div>
			<div class="botJifenList">
				<p class="useJifen">可使用积分：${n.price}</p>
				<p class="priceP">相当于省￥${n.price*ratio1}元</p>
				<a
					href="${pageContext.request.contextPath }/web/shop/productDetailApi/toRmbProDetailJsp.htm?pid=${n.id}">点击购买</a>
			</div></li>
	</c:forEach>
</c:if>