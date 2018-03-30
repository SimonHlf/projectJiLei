<!DOCTYPE html>
<%@page pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>充电中</title>
<meta name="viewport"
	content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/weChat/css/reset.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/weChat/Module/charging/css/charging.css" />
</head>
<body class="bodyPadBot">
	<!-- 个人用户信息 -->

	<div class="perInfos">
		<div class="perImg fl">
			<img src="${sessionScope.fontUser.weImage }"
				class="avatar aui-img-round">
		</div>
		<div class="perInfoTxt fl">
			<strong>${sessionScope.regionName}小区</strong>
			<p>用户编号：${sessionScope.fontUser.account }</p>
			<p>赠送余额：${sessionScope.fontUser.dummyBalance }元</p>
			<p>账户余额：${sessionScope.fontUser.balance }元</p>
		</div>
		<div class="batteryDiv"></div>
	</div>
	<!-- 用户充电 -->
	<div class="chargingList">
		<!-- 一个充电 -->
		<div class="singleCharging">
			<div class="detailCon_sing">
				<strong class="comStrongTit">正在充电</strong>
				<div class="innerCharge_sing locSingPar clearfix">
					<span class="locSpan fl">位<em></em>置：
					</span>
					<p class="loacP fl">${chargeDetails.address}</p>
				</div>
				<div class="innerCharge_sing comSingPar clearfix">
					<span class="fl">电桩编号：</span>
					<p class="fl">${chargeDetails.code}</p>
				</div>
				<div class="innerCharge_sing comSingPar clearfix">
					<span class="fl">收费标准：</span>
					<p class="fl">
						<c:choose>
							<c:when test="${chargeDetails.charge_type == 0}">
								包月
							</c:when>
							<c:when test="${chargeDetails.charge_type == 1}">
								<c:choose>
									<c:when test="${empty chargeDetails.rate}">
										一分钟后显示费率
									</c:when>
									<c:otherwise>
										${chargeDetails.rate}元/小时
									</c:otherwise>
								</c:choose>
							</c:when>
							<c:when test="${chargeDetails.charge_type == 2}">
								${chargeDetails.rate}元/度
							</c:when>
							<c:otherwise>
								<c:choose>
									<c:when test="${empty chargeDetails.rate}">
										一分钟后显示
									</c:when>
									<c:otherwise>
										${chargeDetails.rate}元/次
									</c:otherwise>
								</c:choose>
							</c:otherwise>
						</c:choose>
						<%--0.35元/小时/包月/计次/KWh--%>
					</p>
				</div>
				<div class="innerCharge_sing comSingPar clearfix">
					<span class="fl">起始时间：</span>
					<p class="fl">${chargeDetails.start_time}</p>
				</div>
			</div>
			<div class="stopChargDiv">
				<button onclick="stopCharge()">停止充电</button>
			</div>
		</div>
	</div>
	<div class="layer"></div>
	<!-- alertFail -->
	<div class="alertDiv_fail">
		<p style="margin-top: 50px;">手动停止充电操作失败</p>
		<div class="decImg"></div>
		<button ontouchend="closeAlert($('.alertDiv_fail'))">确定</button>
	</div>
	<!-- confirm -->
	<div class="confirmDiv">
		<p style="margin-top: 50px;">请确认要停止充电？</p>
		<div class="confirmImg"></div>
		<button class="comTwoBtn twoBtn_cancel"
			onclick="closeAlert($('.confirmDiv'))">取消</button>
		<button class="comTwoBtn twoBtn_sure">确定</button>
	</div>
	<!-- footer -->
	<jsp:include page="../../down.jsp">
		<jsp:param value="2" name="cmd"/>
	</jsp:include>

	<script src="${pageContext.request.contextPath}/weChat/jsPlugin/jquery.min.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/weChat/jsPlugin/tipInfo.js" type="text/javascript"></script>
	<script type="text/javascript">
		$(function() {
			calWidSing();
		});
		//计算单个充电下的位置宽度
		function calWidSing() {
			$(".loacP").each(
					function() {
						$(".loacP").width(
								$(".innerCharge_sing").width()
										- $(".locSpan").width() - 5);
					});
		}

		// 停止充电
		function stopCharge(){
		    var result = window.confirm("确定要结束充电吗?");
		    if(result){
		        $.ajax({
					type:'post',
					url:'${pageContext.request.contextPath}/weChat/Charge/stopCharge.htm',
					data:{
					    recordId : '${param.recordId}'
					},
					success:function(data){
						var json = eval("("+data+")");
						if(json == "true"){
						    window.location = "${pageContext.request.contextPath}/weChat/Charge/chargeTableList.htm";
                        } else {
						    alert("手动停止充电失败。");
                        }
                    },
					error:function(){
					    alert("网络错误，请稍后再试");
                    }
				})
			}
		}
	</script>
</body>
</html>
