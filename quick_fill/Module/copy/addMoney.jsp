<!DOCTYPE html>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page pageEncoding="utf-8"%>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/weChat/css/reset.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/weChat/Module/copy/css/addMoney.css" />
<title>账户充值</title>
</head>
<body class="bodyPadBot">
	<% List<Map<String,Object>> i = (List<Map<String,Object>>)session.getAttribute("getByUser"); %>
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
			<button class="comBtn sureBtn">充值</button>
		</div>
	</div>
	<div class="activityDiv" id="yhContent">
		<!-- 充值优惠层 -->
	</div>
	<div class="toast-wrap">
		<span class="toast-msg"></span>
	</div>
	<!-- footer -->
	<jsp:include page="../../down.jsp">
		<jsp:param value="4" name="cmd" />
	</jsp:include>
	<!-- div id="yhContent"></div -->
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/weChat/jsPlugin/jquery.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/weChat/Module/copy/copyJs.js"></script>
	<script type="text/javascript">
		$(function() {
			$(".accChargeDiv li").each(function(i) {
				$(".accChargeDiv li").height(Math.ceil($(".accChargeDiv li").width()))
			});
			selectNowNum();
			getDiscortInfo();
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
		//查询当前虚拟下小区的优惠券
		function getDiscortInfo(){
			$.ajax({
				url:"/quick_fill/weChat/opeFindUserRecharge.htm",
				type:"post",
				dataType:"json",
				success:function(result){
					if(result.state==true){
						var html = "";
						html += '<strong>充值优惠活动:</strong>';
						for(var i=0;i<result.data.length;i++){
							html += '<p class="hasDatas">充值<span>'+result.data[0].balance_order+'</span>元赠送<span>'+result.data[0].balance_give+'</span>元</p>';
						}
						html += '<p class="hasDatas">'+result.data[0].createTime+'至'+result.data[0].endTime+'</p>';
						html += '<div class="actBg"></div>';
						$("#yhContent").append(html);
					}else{
						var html = "";
						html += '<strong>暂无活动</strong>';
						html += '<div class="actBg"></div>';
						$("#yhContent").append(html);
					}

				}
			})
		}
	</script>
</body>
</html>