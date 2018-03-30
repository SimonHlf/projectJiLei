<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:forEach items="${list }" var="list">
	<li>
		<div class="floatDiv clearfix">
			<p class="hisWid1 txtLeft ellip">
				<c:if test="${list.scanStatus==1 }">
					<span style="color: red">[未读]</span>
				</c:if>
				<c:if test="${list.scanStatus==0 }">
					<span>[已读]</span>
				</c:if>
			${list.msgTitle }</p>
			<p class="hisWid2">${list.createTime }</p>
			<p class="hisWid3">
				<a href="javascript:void(0)" onclick="message(${list.sid},${list.username },${list.scanStatus });">查看详情</a>
				<c:if test="${list.scanStatus==1 }">
					<span class="status noReadSt"></span>
				</c:if>
			</p>
		</div>
	</li>
</c:forEach>