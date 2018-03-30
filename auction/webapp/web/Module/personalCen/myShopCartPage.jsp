<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${maplist.size()==0}">

</c:if>
<c:if test="${maplist.size()>0}">
	<c:forEach items="${maplist}" var="c">
		<li class="clearfix">
			<div class="comInnerCart oneCartWid1">
				<label> 
					<input type="checkbox" id="proInp_money_${c.cart.id}" class="comSelCartInp" onclick="selListPro(this,'${c.cart.id}')" value="${c.cart.id}" name="listProInp_money" />
				</label>
				<div class="cartThumb">
					<img src="/${c.cart.thumbnailUrl}" />
				</div>
				<div class="cartProTit">
					<a href="">${c.cart.productName}</a>
				</div>
				<div class="shopImg">
					<a href=""> <img
						src="${pageContext.request.contextPath }/web/Module/personalCen/images/shopThumb.jpg" />
						<span>西藏锦绣</span>
					</a>
				</div>
				<c:if test="${c.cart.attrIds != '0'}">
					<div class="cartCateg">
						<p>${c.cart.specname}</p>
					</div>
				</c:if>
			</div>
			<div class="comInnerCart twoCartWid">
				<!-- <p class="oldPrice">¥2600</p> -->
				<c:if test="${c.cart.pavid==null}">
					<c:if test="${c.cart.proType == 1 || c.cart.proType == 1 }">
						<p>¥<span id="singPri_${c.cart.id}">${c.cart.pprice}</span></p>
					</c:if>
					<c:if test="${c.cart.proType == 2}">
						<p><span id="singPri_${c.cart.id}">${c.cart.pprice}</span>金币</p>
					</c:if>
					<c:if test="${c.cart.proType == 3}">
						<p><span id="singPri_${c.cart.id}">${c.cart.pprice}</span>积分</p>
					</c:if>
				</c:if>
				<c:if test="${c.cart.pavid!=null}">
					<c:if test="${c.cart.proType == 1 || c.cart.proType == 1 }">
						<p>¥<span id="singPri_${c.cart.id}">${c.cart.parentPrice}</span></p>
					</c:if>
					<c:if test="${c.cart.proType == 2}">
						<p><span id="singPri_${c.cart.id}">${c.cart.parentPrice}</span>金币</p>
					</c:if>
					<c:if test="${c.cart.proType == 3}">
						<p><span id="singPri_${c.cart.id}">${c.cart.parentPrice}</span>积分</p>
					</c:if>
				</c:if>


			</div>
			<div class="comInnerCart twoCartWid">
				<div class="buyNum fl">
					<span class="leftSp reduce" onclick="reduceProNum(this,'${c.cart.id}','reduce')" checkAttr='false'>-</span>
					<p>
						<input id="proNum_${c.cart.id}" attrCheck="false" class="selProNumInp" readonly name="listProNum_money" type="text" value="1"/>
					</p>
					<span class="rightSp plus" onclick="plusProNum(this,'${c.cart.id}','plus')" checkAttr='false'>+</span>
				</div>
			</div>
			<div class="comInnerCart twoCartWid">
				<c:if test="${c.cart.proType == 1 || c.cart.proType == 1 }">
					<p class="totalPrice">¥<span id="totalPriSp_${c.cart.id}" class="totalPriSp">${c.total}</span></p>
				</c:if>
				<c:if test="${c.cart.proType == 2}">
					<p class="totalPrice"><span id="totalPriSp_${c.cart.id}" class="totalPriSp">${c.total}</span>金币</p>
				</c:if>
				<c:if test="${c.cart.proType == 3}">
					<p class="totalPrice"><span id="totalPriSp_${c.cart.id}" class="totalPriSp">${c.total}</span>积分</p>
				</c:if>
			</div>
			<div class="comInnerCart twoCartWid">
				<a class="delOrder" href="javascript:delCart(0,'${c.cart.id}')"></a>
			</div>
		</li>
	</c:forEach>
</c:if>