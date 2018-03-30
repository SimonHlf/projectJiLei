<%@ page contentType="text/html;charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script
	src="${pageContext.request.contextPath }/admin/assets/js/jquery-2.0.3.min.js"></script>

<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0" />
<title>商家帮-订单</title>
<link rel="icon" type="image/x-icon" href="favicon.ico">
<link rel="stylesheet" type="text/css" href="css/aui.css" />
<link rel="stylesheet" href="css/aui-flex.css">
<link rel="stylesheet" href="css/aui-slide.css">
<script src="js/iscroll.js"></script>
<script src="js/comScroll.js"></script>

<style type="text/css">
.user-info {
	background-color: #ffffff;
	padding: 10px 0;
}

img.avatar {
	display: block;
	margin: 0 auto;
	width: 20%;
}

.aui-list .aui-list-header {
	background-color: #ffffff;
	line-height: 1.2rem;
}

.aui-list {
	background-image: none !important;
}

.aui-list-item {
	border-bottom: 1px solid #eee !important;
	background-image: none !important;
}

.aui-list-item-input input::-webkit-input-placeholder {
	color: #ccc;
	font-size: 0.7rem;
}

.smIcon {
	color: #666;
	font-size: 1.2rem;
}

#wrapBox {
	width: 100%;
	position: relative;
	overflow: hidden;
}

#wrapScroll {
	width: 100%;
	position: absolute;
	left: 0;
	top: 0px;
	-webkit-tap-highlight-color: rgba(0, 0, 0, 0);
}
</style>
<script type="text/javascript">
	window.onload = function() {
		wrapScroll();
	}
	function cancelSave() {
		window.location.href = "personal.htm";
	}
</script>
</head>
<body>
	<div id="wrapBox">
		<div id="wrapScroll">
			<section class="aui-content">
				<form class="am-form" method="post" id="save"
					action="savePersonal.htm">
					<ul class="aui-list aui-form-list">
						<input type="hidden" value="${sessionScope.consumer.id }"
							name="id" id="consumerId">
							<input type="hidden" value="${sessionScope.merchantId }"
							id="merchantId">
						<li class="aui-list-item">
							<div class="aui-list-item-inner">
								<div class="aui-list-item-label">
			                        	订单金额
			                    </div>
								<div class="aui-list-item-input">
									<input type="number" name="ammount" id="ammount"
										placeholder="订单金额">
								</div>
							</div>
						</li>
						<li class="aui-list-item">
							<div class="aui-list-item-inner">
								<div class="aui-list-item-label">
			                        	优惠券
			                    </div>
								<div class="aui-list-item-input">
									<input type="number" id="couponMoney" name="couponMoney" disabled placeholder="请在此处输入使用的额度">
								</div>
								<div class="aui-list-item-right">
			                        <input id="selCouponInp" tapmode onclick="checkSelCoupon()" type="checkbox" class="aui-checkbox">
			                    </div>
							</div>
						</li>
						<li class="aui-list-item">
							<div style="width:100%;font-size:0.6rem;height:1.5rem;" id="allCopMoney">
								<span style="float:left;">优惠券总额度</span>
								<p id="totalMoneyP" style="float:left;width:150px;color:red;">${sessionScope.consumer.cash}</p>
								<input type="hidden" id="cou" value="${cou }">
							</div>
						</li>
							<li class="aui-list-item">
							<div style="width:100%;font-size:0.6rem;height:1.5rem;" id="">
								<span style="float:left;">账户余额</span>
								<p id="bal" style="float:left;width:150px;color:red;">${sessionScope.consumer.balance}</p>
							</div>
						</li>
						<li class="aui-list-item">
							<div class="aui-list-item-inner">
								<div class="aui-list-item-label">
			                        	应付金额
			                    </div>
								<div class="aui-list-item-input">
									<input id="payNumInp" type="number">
								</div>
							</div>
						</li>
						<li class="aui-list-item">
							<div
								class="aui-list-item-inner aui-list-item-center aui-list-item-btn">
								<div class="aui-btn aui-btn-info aui-margin-r-5" tapmode onclick="goPay();">确认支付</div>
							</div>
						</li>
					</ul>
				</form>
			</section>
		</div>
	</div>
	<jsp:include page="nav.jsp" />
</body>
<script>

$(function(){
	checkInpCash();
	$("#couponMoney").blur(function(){
		if($("#couponMoney").val() != ""){
			$("#payNumInp").val($("#ammount").val() - $("#couponMoney").val());
		}
	});
	$("#couponMoney").bind("input propertychange",function(){
		$("#payNumInp").val($("#ammount").val() - $("#couponMoney").val());
	});
})

	function checkInpCash(){
		$("#ammount").blur(function(){
			if($("#ammount").val() == ""){
				alert("请输入订单金额");
			}else{
				$("#payNumInp").val($("#ammount").val());
				
			}
		});
		$("#ammount").bind("input propertychange",function(){
			$("#payNumInp").val($("#ammount").val());
		});
	}
	var selFlag = true;
	function checkSelCoupon(){
		if($("#ammount").val() == ""){
			alert("请先输入订单金额");
			$("#selCouponInp").attr("checked",false);
			return;
		}else{
			if($("#selCouponInp").is(':checked')) {//选中状态 
			    // do something
			    $("#couponMoney").attr("disabled",false);
			    $("#payNumInp").val($("#ammount").val() - $("#couponMoney").val());
			}else{//未选中状态
				$("#couponMoney").attr("disabled",true);
				if($("#payNumInp").val() != ""){
					$("#couponMoney").val("");
				}
				$("#payNumInp").val($("#ammount").val());
			}
		}
	}
	
	function goPay(){		
		if($("#ammount").val() == ""){
			alert("请输入订单金额");
			return;
		}else if(couponMoney>totalMoneyP){
			alert("所输优惠券金额不能大于已有的优惠券额度");
			return;
		}else if($("#consumerId").val() == $("#merchantId").val()){
			alert("对不起，消费者和商户不能为同一人");
			return;
		}else if($("#ammount").val()<=0 || $("#payNumInp").val() < 0){
			alert("请认真填写订单金额");
			return;
		}
		else{
			var payNumInp=$("#payNumInp").val();
			var ammount=$("#ammount").val();
			var couponMoney=$("#couponMoney").val();
			var bal=$("#bal").html();
			if(couponMoney == ""){
				couponMoney=0.00;
			}
			
			var v=ammount-couponMoney;
			if(v-bal<=0){
				var attr0=1;
				 $.ajax({
					method:'post',
					url:'balPay.htm?ammount='+ammount+"&couponMoney="+couponMoney+"&bal="+bal+"&attr0="+attr0,
					processData : false,
					contentType : false,
					success:function(){
					    alert('支付成功。将前往个人中心页面。');
		              /*   setTimeout(function(){
		                	window.location.href="personal2.htm";
		                }, 2000);  */
					    window.location.href="personal2.htm";
		                
					},
					error : function() {
						alert("支付失败");
					}
				}) 
			}else{
				payNumInp=payNumInp-bal;
				var attr0=1;
				window.location='pay_.htm?money='+payNumInp+"&couponMoney="+couponMoney+"&allMoney="+ammount+"&attr0="+attr0;
			}
			
		}
	}
	
	
	
</script>
</html>