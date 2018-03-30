<!DOCTYPE html>
<%@page pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title>提现记录</title>
		<meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0"/>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/weChat/css/reset.css"/>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/weChat/Module/setting/css/withDrawRec.css"/>
	</head>
	<body>
		<div class="recDecBg">
			<img src="${pageContext.request.contextPath }/weChat/Module/setting/images/packet.png" />
		</div>
		<div class="withDrawDiv chargeRecList comList">
			<strong class="comStrongTit">提现记录</strong>
			<ul id="ulList" class="clearfix">
				<c:forEach items="${list}" var="list">
					<li>
						<div class="innerPar clearfix">
							<span class="radiusSpan"></span>
							<p>用户编号:${list.account}&nbsp;&nbsp;${list.add_time}</p>
							<p>
								充值<em>${list.balance}</em>元
							</p>
							<p>
								<span class="triBg"></span>
							</p>
							<div class="detailDiv">
								<span>转账订单号：${list.order_no}</span> <span>用户编号：${sessionScope.fontUser.account }</span>
							</div>
						</div>
					</li>
				</c:forEach>
			</ul>
		</div>
		<!-- footer -->
		<jsp:include page="../../down.jsp">
		<jsp:param value="4" name="cmd"/>
	</jsp:include>
		<script src="${pageContext.request.contextPath }/weChat/jsPlugin/jquery.min.js"></script>
		<script src="${pageContext.request.contextPath }/weChat/Module/reChargeRecord/js/showDetailCon.js" type="text/javascript"></script>
		<script type="text/javascript">
			$(function(){
				showDetailCon();
				checkData();
			});
			function checkData(){
				if($("#ulList li").length == 0){
					$("#ulList").html("<div class='noDataDiv'><span></span><p>暂无提现记录</p></div>");;;
				}
			}
		</script>
	</body>
</html>
