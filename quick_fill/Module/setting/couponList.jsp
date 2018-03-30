<%@page pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="v" tagdir="/WEB-INF/tags"%>
	<div class="comSetP">
				<span class="comSetTit">和固定充值金额关联</span>
				<button class="addDisLi" id="btn2" onclick="comEditShowAlert('addLevelDiv')">增加档位</button>
				<ul id="addli">
				    <c:forEach items="${roList }" var="coupon">
				    <li>
						充值<input class="numInp" type="number" value="${coupon.balance_order }"/>元<span></span>赠送<input class="numInp" value="${coupon.balance_give }" type="number" />元
						<button onclick="delCou('${coupon.id}','${coupon.region_id }')"><em class="delIcon"></em></button>
					</li>
				    </c:forEach>
				</ul>
			</div>