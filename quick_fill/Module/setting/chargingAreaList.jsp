<%@page pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="v" tagdir="/WEB-INF/tags"%>
	<div class="chargingSet">
			<strong class="comStrongTit">运营设备-充电区域</strong>
			<p class="areaName">${region.name }</p>
			<input id="regId" value="${region.id }" type="hidden">
			<ul class="listChargingArea">
			<c:forEach items="${regionAreaList }" var="regionArea">
				<li>
					<p>${regionArea.name}</p>
					<span class="editSpan" onclick="showAlert(this,'editConfirm','fixChargeAreaInp','regionAreaInp',true)"></span>
					<input type="hidden" value="${regionArea.id }">
					<a href="${pageContext.request.contextPath }/weChat/rateSetting.htm?reArId=${regionArea.id }">费率设置</a>
				</li>
			</c:forEach>
			</ul>
			<div class="addAreaBtn">
				<button onclick="comEditShowAlert('addConfirm')">添加充电区</button>
			</div>
		</div>
