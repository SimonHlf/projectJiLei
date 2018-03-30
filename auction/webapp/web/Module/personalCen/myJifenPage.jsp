<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${list.size()==0}">

</c:if>
<c:if test="${list.size()>0}">
	<c:forEach items="${list}" var="n">
		<li class="clearfix">
			<div class="comInnerJifen jifenWid3">
				<div class="jifenImg">
					<img src="/${n.productimg}" />
				</div>
				<div class="titJifen">
					<p>${n.productname}</p>
					<p class="bianhao">订单编号：${n.ordernum}</p>
				</div>
			</div>
			<div class="comInnerJifen jifenWid2">
				<strong class="jifenChange">+${n.integral}</strong>
			</div>
			<div class="comInnerJifen jifenWid2">
				<p class="timeP">${n.createtime}</p>
			</div>
			<div class="comInnerJifen jifenWid2">
				<p class="noteP">交易获得</p>
			</div>
		</li>
	</c:forEach>
</c:if>