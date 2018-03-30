<!DOCTYPE html>
<%@page pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>购买包月</title>
<meta name="viewport"
	content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/weChat/css/reset.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/weChat/Module/charging/css/mouthPay.css" />
</head>
<body>
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
	<div class="buyMouth">
		<strong class="comStrongTit">购买包月</strong>
		<div class="buyCon">
			<span>需要购买</span> <input type="number" id="month"/> <span>个月</span>
		</div>
	</div>
	<div class="buyInfoTxt">
		<p class="infoTxtP">
			包月价格为<span>${monthly.money}</span>元/月，按照自然月计算，如未满一个月按照天数计算。
		</p>
		<p class="infoTxtP">计算公式：包月费用30到本月底的天数 如购买2个月则有效期到下月底</p>
		<p class="noteTxtP">
			提示：为防止滥用，每月限制使用<span>${monthly.num}</span>次
		</p>
	</div>
	<div class="buyBtnDiv">
		<button onclick="buyMonthlyPay()">确认</button>
	</div>

	<!-- footer -->
	<jsp:include page="../../down.jsp">
		<jsp:param value="2" name="cmd"/>
	</jsp:include>

	<div class="layer" style="display: block; opacity: 1;"></div>
	<div class="alertDiv_succ">
		<p style="margin-top: 54px;">购买成功</p>
		<p>
			消费金额<span>xx.00</span>元
		</p>
		<p>有效期：2018-03-26</p>
		<div class="succBg"></div>
		<button ontouchend="closeAlert($('.alertDiv_succ'))">确定</button>
	</div>
	<!-- 余额不足toast -->
	<div class="toast-wrap">
		<span class="toast-msg"></span>
	</div>
	<script src="${pageContext.request.contextPath}/weChat/jsPlugin/jquery.min.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/weChat/jsPlugin/tipInfo.js" type="text/javascript"></script>
	<script type="text/javascript">
		$(function() {
			var rich = '${Rich}';
			if(rich == 0){
                toast("余额不足，请充值后再试")
            }
			$(".layer").attr("style","");
		});

		// 购买包月
		function buyMonthlyPay(){
            var rich = '${Rich}';
            if(rich == 0){
                alert("余额不足，请先充值");
                return;
            }
		    var month = $("#month").val();
            if(!/^\d+$/.test(month) || month == 0){
                alert("请输入正整数");
                return;
			}
			var monthlyId = '${monthly.id}';
			var result = window.confirm("你确定要购买" +month+ "个月包月吗?");
            if(result){
                $.ajax({
					type:'post',
					url:'${pageContext.request.contextPath}/weChat/Charge/buyMonthlyPay.htm',
					data:{
					    month:month,
						monthlyId:monthlyId
					},
					success:function(data){
					    var json = eval('('+data+')');
					    if(json == "less"){
					        alert("余额不足，请充值后再购买");
                        } else if(json == "OverTime"){
					        window.location = "${pageContext.request.contextPath}/weChat/404.jsp";
                        } else if(json == "true"){
                            alert("购买成功。");
                            window.location = "${pageContext.request.contextPath}/weChat/index.jsp";
                        } else if(json == "DocError"){
                            alert("系统错误，请于管理员联系。");
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
