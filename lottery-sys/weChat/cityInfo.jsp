<%@ page contentType="text/html;charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="mallList" id="merchantInfoList">
	<div class="aui-content">
		<ul class="aui-list aui-media-list">
			<c:forEach items="${merchantInfoKmList }" var="mer">
				<c:forEach items="${merchantList}" var="merchant">
					<c:if test="${mer.id == merchant.id }">
						<li class="aui-list-item"><a
							href="detail_.htm?shopid=${merchant.id}"
							style="width: 100%; height: 100%; display: block;">
								<div class="aui-media-list-item-inner">
									<div class="aui-list-item-media">
										<img src="/${merchant.attr1}">
									</div>
									<div class="aui-list-item-inner">
										<div class="aui-list-item-title mallName">
											${merchant.merchantName}</div>
										<div class="aui-list-item-text">${merchant.attr0}</div>
										<div class="aui-list-item-text">${mer.km}km</div>
										<div class="aui-list-item-text">
											<div class="aui-ellipsis-2">${merchant.address}</div>
										</div>
									</div>
								</div>
						</a></li>
					</c:if>
				</c:forEach>
			</c:forEach>
		</ul>
	</div>
</div>