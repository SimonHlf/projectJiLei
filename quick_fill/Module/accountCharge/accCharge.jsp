<!DOCTYPE html>
<%@page pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="v" tagdir="/WEB-INF/tags"%>
<script src="${pageContext.request.contextPath }/admin/assets/js/jquery-2.0.3.min.js"></script>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0" />
<title>账户充值</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/weChat/css/reset.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/weChat/Module/accountCharge/css/accCharge.css" />

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
	<!--账户充值层-->
	<input type="hidden" id="selNowNumInp" />
	<div class="accChargeDiv">
		<strong class="comStrongTit">账户充值</strong>
		<div class="chargeTxt">马上充值</div>
		<ul class="clearfix">
			<li class="thirtyLi"><label for="thirtyInp"> <span></span>
					<input name="chargeNumInp" id="thirtyInp" type="radio" value="0.01" />
			</label></li>
			<li class="fiftyLi"><label for="fiftyInp"> <span></span>
					<input name="chargeNumInp" id="fiftyInp" type="radio" value="50" />
			</label></li>
			<li class="hund_oneLi"><label for="hunredInp_one"> <span></span>
					<input name="chargeNumInp" id="hunredInp_one" type="radio"
					value="100" />
			</label></li>
			<li class="hund_twoLi"><label for="hunredInp_two"> <span></span>
					<input name="chargeNumInp" id="hunredInp_two" type="radio"
					value="200" />
			</label></li>
		</ul>
		<div class="btnDiv">
			<button class="comBtn sureBtn" onclick="pay()">确认支付</button>
		</div>
	</div>
	<div class="activityDiv">
		<strong>充值优惠活动：</strong>
		<c:if test="${isCheckReg == '1' }"><p class="noDatas">暂无绑定小区</p></c:if>
		<c:if test="${isCheckReg == '0' }">
			<c:if test="${cou == '0' }">
				<p class="noDatas">暂无优惠</p>
			</c:if>
			<c:if test="${cou == '1' }">
				<c:forEach items="${coupons}" var="coupon">
					<p class="hasDatas">
						充值<span>${coupon.balance_order }</span>元赠送<span>${coupon.balance_give }</span>元
					</p>
				</c:forEach>
				<p class="hasDatas">${time.createTime }至${time.endTime }</p>
			</c:if>
		</c:if>
		<div class="actBg"></div>
	</div>
	<!-- 提示信息弹层 -->
	<div class="layer"></div>
	<div class="alertDiv_fail">
		<p>此次充值失败</p>
		<p>
			原因：<span>通讯失败</span>
		</p>
		<div class="decImg"></div>
		<button ontouchend="closeAlert($('.alertDiv_fail'))">确定</button>
	</div>
	<!-- footer -->
	<jsp:include page="../../down.jsp">
		<jsp:param value="1" name="cmd"/>
	</jsp:include>
	<div class="toast-wrap">
		<span class="toast-msg"></span>
	</div>
	<script type="text/javascript" src="${pageContext.request.contextPath }/weChat/jsPlugin/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath }/weChat/jsPlugin/tipInfo.js" type="text/javascript"></script>
	<script type="text/javascript">
		$(function() {
			$(".accChargeDiv li").each(function(i) {
				$(".accChargeDiv li").height(Math.ceil($(".accChargeDiv li").width()))
			});
			selectNowNum();
		});
		//选取当前金额
		function selectNowNum() {
			$(".accChargeDiv input").each(function(i) {
				$(this).click(function() {
					$(".accChargeDiv span").hide();
					$(".accChargeDiv span").eq(i).show();
					$("#selNowNumInp").val($(this).val());
				});
			});
		}

		function pay() {
			var selNowNumInp = $("#selNowNumInp").val();
			if (selNowNumInp == null || selNowNumInp == "") {
				toast('请选择要充值的金额');
				return false;
			}
			window.location.href = "${pageContext.request.contextPath}/weChat/pay_.htm?money="
					+ selNowNumInp;
		}
	</script>
</body>
</html>
