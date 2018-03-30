<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:forEach items="${list}" var="list">
	<li>
		<div class="floatDiv clearfix">
			<p class="queryWid1 ellip">${list.userAccount }</p>
			<p class="queryWid1 ellip">${list.nickName }</p>
			<p class="queryWid1 ellip">${list.superior }</p>
			<p class="queryWid2">
				<c:if test="${list.level==1 }">
					一级
				</c:if>
				<c:if test="${list.level==2 }">
					二级
				</c:if>
				<c:if test="${list.level==3 }">
					三级
				</c:if>
			</p>
			<p class="queryWid1 ellip">
				<c:if test="${list.type==1 }">
					现金返利
				</c:if>
				<c:if test="${list.type==2 }">
					金币返利
				</c:if>
				<c:if test="${list.type==3 }">
					积分返利
				</c:if>
			</p>
			<p class="queryWid3">${list.createTime }</p>
		</div>
	</li>
</c:forEach>