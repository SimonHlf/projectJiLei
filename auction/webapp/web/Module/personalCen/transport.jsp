<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8">
		<title>查看物流</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/web/Module/personalCen/css/transport.css"/>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/web/css/pagination.css"/>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/web/css/layer.css"/>
	</head>
	<body>
		
		<!-- 导航部分 -->
		<%@ include file="../../head.jsp"%>  
		
		<div class="transportDiv w1100">
			<strong class="titSt">当前物流状态：
						<c:if test="${maps.State==4}">
                    		问题件
                    	</c:if>
                    	<c:if test="${maps.State==3}">
                    		已签收
                    	</c:if>
                    	<c:if test="${maps.State==2}">
                    		在途中
                    	</c:if> 
                    	<c:if test="${maps.State==0}">
                    	暂无轨迹信息
                    	</c:if>

			</strong>
			<div class="detailTransport">
				 <c:forEach items="${traces}" var="t">
					<div class="innerTrans">
						<span class="titTrans">${t.monthDay}</span>
						<div class="detailsTrans">
							<p>${t.AcceptTime}</p>
							<p>${t.AcceptStation}</p>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
		<div class="orderDetail">
			<div class="topDetail">
				<strong>订单详情</strong>
			</div>
			<div class="botDetail">
				<!-- <p>发货地址：（姓名收）  12541541541河南省 郑州市 上街区 某路某小区某号楼</p> -->
				<p>收货地址：（${order.receivername}收） ${order.receivertel}${order.receiveraddress}</p>
				<!-- <p>物<span class="oneBlank"></span>流： 中通快递</p> -->
				<p>运<span class="twoBlank"></span>单<span class="twoBlank"></span>号：${maps.LogisticCode}</p>
				<p>订单编号：${order.ordernum}</p>
				<p>商<span class="oneBlank"></span>家：西藏锦绣</p>
			</div>
		</div>
		
		<%@ include file="../../foot.jsp"%>  
		
	</body>
</html>
