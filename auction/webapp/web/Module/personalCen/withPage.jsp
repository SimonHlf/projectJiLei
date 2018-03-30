<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:forEach items="${list }" var="list">
	<li>
		<div class="floatDiv clearfix">
			<p class="hisWid1">
				<c:if test="${list.type==1 }">
					余额提现
				</c:if>
				<c:if test="${list.type==2 }">
					积分提现
				</c:if>
			</p>
			<p class="hisWid1">${list.money }</p>
			<p class="hisWid2">${list.createTime }</p>
			<p class="hisWid1"><span>
				<c:if test="${list.status==1 }"><span style="color: green;">提现成功</span></c:if>
				<c:if test="${list.status==2 }"><span style="color: gray;">提现审核中</span></c:if>
				<c:if test="${list.status==3 }"><span style="color: red;">提现失败</span></c:if>
			</span></p>
			<p class="hisWid1"><a href="javascript:void(0)">查看详情</a></p>
		</div>
		<div class="innerDetailConTwo">
			<span class="triTop"></span>
			<p>提现账户：${list.cardNo }</p>
			<p>提现银行：${list.cardName }</p>
			<p>申请时间：${list.createTime }</p>
			<p>提现状态：
				<c:if test="${list.status==1 }"><span style="color: green;">提现成功</span></c:if>
				<c:if test="${list.status==2 }"><span style="color: gray;">提现审核中</span></c:if>
				<c:if test="${list.status==3 }"><span style="color: red;">提现失败</span></c:if>
			</p>
			<c:if test="${list.status==2 }">
				<c:if test="${list.type==2 }">
					<p>兑换金额：${list.cash }</p>
				</c:if>
			</c:if>
			<c:if test="${list.status==3 }">
				<p>兑换金额：${list.cash }</p>
				<p>
					拒绝原因：${list.refuse }
				</p>
			</c:if>
		</div>
	</li>
</c:forEach>