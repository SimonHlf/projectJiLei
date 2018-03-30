<%@page pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="v" tagdir="/WEB-INF/tags"%>
			<ul class="listChargingArea">
			<c:forEach items="${regionAreaList }" var="regionArea">
				<li>
					<p>${regionArea.name}</p>
					<span class="editSpan" onclick="showAlert(this,'editConfirm','fixChargeAreaInp','regionAreaInp',true)"></span>
					<input type="hidden" value="${regionArea.id }">
					<a href="rateSetting.jsp">费率设置</a>
				</li>
			</c:forEach>
			</ul>
		