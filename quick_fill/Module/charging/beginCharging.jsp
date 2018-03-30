<%@ page import="cn.windy.util.DateUtil" %>
<!DOCTYPE html>
<%@page pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>开始充电</title>
<meta name="viewport"
	content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/weChat/css/reset.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/weChat/Module/charging/css/beginChaging.css" />
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
	<!-- 开始充电 -->
	<div class="beginCharginDiv">
		<strong class="comStrongTit">开始充电</strong>
		<div class="innerCharge_sing locSingPar clearfix">
			<span class="locSpan fl">位<em></em>置：
			</span>
			<p class="loacP fl">${map.address}<%--广州市上威工业园 电动自行车充电区--%></p>
		</div>
		<div class="innerCharge_sing comSingPar clearfix">
			<span class="fl">电桩编号：</span>
			<p class="fl">${map.code}<%--000000016--%></p>
		</div>
		<div class="innerCharge_sing locSingPar clearfix">
			<span class="fl">收费标准：</span>
			<p class="loacP fl">
			<c:choose>
				<c:when test="${empty map.areaRate}">
					开始充电1分钟后显示
				</c:when>
				<c:when test="${map.areaRate.typeCharge == 1}">
					开始充电1分钟后显示<b>(计时模式)</b>
				</c:when>
				<c:when test="${map.areaRate.typeCharge == 2}">
					${map.areaRate.standard }元/度<b>(计量模式)</b>
				</c:when>
				<c:otherwise>
					开始充电1分钟后显示<b>(计次模式)</b>
				</c:otherwise>
			</c:choose>

			</p>
		</div>
		<div class="innerCharge_sing comSingPar clearfix">
			<span class="fl">起始时间：</span>
			<p class="fl"><%=DateUtil.getDate()%></p>
		</div>
	</div>
	<!-- 选择充电时长 -->
	<div class="selChargeTime">
		<c:choose>
			<c:when test="${not empty NotMoney}">
				<p align="center">余额不足，请先充值</p>
			</c:when>
			<c:when test="${not empty map.NotEquipment}">
				<p align="center">暂无设备</p>
			</c:when>
			<c:when test="${not empty map.NotOnline}">
				<p align="center">设备未上线</p>
			</c:when>
			<c:when test="${not empty map.fault}">
				<p align="center">设备故障</p>
			</c:when>
			<c:when test="${not empty map.InUse}">
				<p align="center">设备使用中</p>
			</c:when>
			<c:when test="${not empty map.DocError}">
				<p align="center">系统错误</p>
			</c:when>
			<c:otherwise>
				<input id="selChargTimeInp" type="hidden" />
				<ul class="clearfix">
					<li><label for="fullStopInp"> <span>充满停止</span> <input
							id="fullStopInp" class="selTimeInp" type="radio" name="selTimeRad"
							value="0" />
					</label></li>
					<li class="marglR"><label for="twoHoursInp"> <span>2小时</span>
						<input id="twoHoursInp" class="selTimeInp" type="radio"
							   name="selTimeRad" value="2" />
					</label></li>
					<li><label for="fourHoursInp"> <span>4小时</span> <input
							id="fourHoursInp" class="selTimeInp" type="radio" name="selTimeRad"
							value="4" />
					</label></li>
					<li><label for="eightHoursInp"> <span>8小时</span> <input
							id="eightHoursInp" class="selTimeInp" type="radio"
							name="selTimeRad" value="8" />
					</label></li>
					<li class="marglR"><label for="tenHoursInp"> <span>10小时</span>
						<input id="tenHoursInp" class="selTimeInp" type="radio"
							   name="selTimeRad" value="10" />
					</label></li>
					<li><label for="twelveHoursInp"> <span>12小时</span> <input
							id="twelveHoursInp" class="selTimeInp" type="radio"
							name="selTimeRad" value="12" />
					</label></li>
				</ul>

				<c:if test="${empty map.Monthly.HasCharge }">
					<div class="beginChargeBtn">
						<button onclick="beginCharging()">开始充电</button>
					</div>
				</c:if>

			</c:otherwise>
		</c:choose>

	</div>
	<div class="layer"></div>

	<!-- 包月用户alert -->
	<c:if test="${not empty map.Monthly.NotUserMonthly }">
		<div class="<%--alertDiv_succ--%> confirmDiv_month">
			<p style="margin-top: 21px; padding: 0 6px; font-size: .14rem;">提示：本小区已启用包月充电计费，您尚未购买包月业务，点击“购买月卡”扣费成功后即可启用包月业务，如不需要包月业务，请直接点击开始充电</p>
			<button class="comTwoBtn twoBtn_sure" onclick="buyMothCharge(${map.Monthly.MonthlyId})">购买包月</button>
			<button class="comTwoBtn twoBtn_other" onclick="beginChargeBtn()">开始充电</button>
		</div>
	</c:if>

	<!-- failAlert -->
	<div class="alertDiv_fail setFailDiv">
		<p style="margin-top: 50px;">操作失败</p>
		<div class="decImg"></div>
		<button ontouchend="closeAlert($('.setFailDiv'))">确定</button>
	</div>

	<!-- 包月用户充电提示 alertDiv_fail -->
	<c:if test="${not empty map.Monthly.HasCharge }">
		<div class=" mouthPayTip">
			<p style="margin-top: 30px;">包月用户在同一时间内只能充一部电动车</p>
			<button <%--ontouchend="closeAlert($('.mouthPayTip'))"--%> onclick="jumpIndex()">确定</button>
		</div>
	</c:if>

	<!-- 跨区使用提示 -->
	<c:if test="${not empty map.NotUserRegion}">
		<div class="<%--alertDiv_fail--%> crossArea">
			<p style="margin-top: 30px;">您现在是跨区使用，将按照本小区的费率收费，费用将从您的基本账户中扣除</p>
			<button ontouchend="closeAlert($('.crossArea'))">确定</button>
		</div>
	</c:if>

	<!-- confirm 开始充电 -->
	<div class="confirmDiv confirmDiv_sure">
		<p>请确认插头已正确插入插座</p>
		<p style="margin-top: 15px;">
			充电计划：<span>充满为止</span>
		</p>
		<button class="comTwoBtn twoBtn_cancel"
			onclick="closeAlert($('.confirmDiv_sure'))">取消</button>
		<button class="comTwoBtn twoBtn_sure">确定</button>
	</div>

	<!-- confirm 包月用户次数用完提示 confirmDiv -->
	<c:if test="${not empty map.Monthly.MonthlyNumRunOut }">
		<div class=" useOver">
			<p>您的包月次数已用完，如需继续使用，将按照单次模式计费，费用将从您的账户中扣除！</p>
			<button class="comTwoBtn twoBtn_cancel"
					onclick="closeAlert($('.useOver'))">取消</button>
			<button class="comTwoBtn twoBtn_sure" onclick="closeAlert($('.useOver'))">确定</button>
		</div>
	</c:if>


	<!-- footer -->
	<jsp:include page="../../down.jsp">
		<jsp:param value="2" name="cmd"/>
	</jsp:include>

	<script src="${pageContext.request.contextPath}/weChat/jsPlugin/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/weChat/jsPlugin/tipInfo.js"></script>
	<script type="text/javascript">
		$(function() {
			calWidSing();
			getChargeTime();
		});
		//计算单个充电下的位置宽度
		function calWidSing() {
			$(".loacP").each(
					function(i) {
						$(".loacP").width(
								$(".innerCharge_sing").width()
										- $(".locSpan").width() - 5);
					});
		}
		//获取充电时长
		function getChargeTime() {
			$(".selTimeInp").each(function(i) {
				$(this).click(function() {
					$(".selChargeTime li").removeClass("active");
					$(this).parent().parent().addClass("active");
					$("#selChargTimeInp").val($(this).val());
				});
			});
		}

		// 隐藏购买包月弹出框
		function beginChargeBtn(){
		    $(".confirmDiv_month").addClass("alertDiv_succ");
		}

		// 跳转购买包月页面
		function buyMothCharge(MonthlyId) {
			 window.location.href = "${pageContext.request.contextPath}/weChat/Charge/jumpbuyMonthly.htm?MonthlyId="+MonthlyId;
		}

		function jumpIndex(){
		    window.location = "${pageContext.request.contextPath}/weChat/index.jsp";
		}

		// 开始充电
		function beginCharging(){
			// 用户包月表 ID
		    var userMonthlyId = '${map.Monthly.UserMonthlyId}';

			// 扣费类型
			var typeCharge = '${map.areaRate.typeCharge}';

			// 选中的充电时长
		    var time = $("input[name='selTimeRad']:checked").val();
		    if(!time){
		        alert("请选择充电时长");
		        return;
			}
            $(".beginChargeBtn button").attr("disabled",true);
			// 设备ID
			var equId = '${map.id}';
			$.ajax({
				type:'post',
				url:'${pageContext.request.contextPath}/weChat/Charge/beginCharge.htm',
				data:{
				    equId : equId,
					time : time,
                    userMonthlyId : userMonthlyId,
					typeCharge : typeCharge
				},
				success:function(data){
                    $(".beginChargeBtn button").attr("disabled",false);
				    var json = eval("("+data+")");
				    if(json == "DocError"){
				        alert("系统错误");
                    } else if(json == "OverTime"){
				        // 登陆超时
				        window.location = "${pageContext.request.contextPath}/weChat/404.jsp";
                    } else {
                        window.location = "${pageContext.request.contextPath}/weChat/Charge/chargeTableList.htm";
                    }
                },
				error:function(){
                    $(".beginChargeBtn button").attr("disabled",false);
				    alert("网络错误，请稍后再试");
                }
			})
		}
	</script>
</body>
</html>
