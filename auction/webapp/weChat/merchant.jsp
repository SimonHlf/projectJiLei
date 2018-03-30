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
<title>商家帮-商户中心</title>
<link rel="icon" type="image/x-icon" href="favicon.ico">
<link rel="stylesheet" type="text/css" href="css/aui.css" />
<link rel="stylesheet" href="css/aui-flex.css">
<link rel="stylesheet" href="css/aui-slide.css">
<link rel="stylesheet"
	href="//at.alicdn.com/t/font_480287_jajq3pvu7amxi529.css">
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
 a{ color:#333; /*无链接时颜色*/ }  
a:hover{ color:#F00;/*鼠标经过链接时颜色*/}
   a:active{ color:#30F; /*鼠标点击链接时颜色*/}
</style>
<script type="text/javascript">
	window.onload = function() {
		wrapScroll();
		var oHelpEmp = document.querySelector("#helpEmploy").innerHTML;
	}
	function showFixNewWinInfo(infoTxt) {
		if (moveFlag) {
			if (infoTxt == "myCode") {//我的二维码
				var rat=$("#rat").val();
			if(rat == 0.00){
				alert("请在后台设置您的折扣比率");
				return;
			}
				window.location.href = "mycode.jsp";
			}else if (infoTxt == "voucher") {//充值中心
				window.location.href = "voucher.jsp";
			} else if (infoTxt == "myCash") {//现金提现
				window.location.href = "cash.jsp";
			}else if (infoTxt == "couponCash") {//优惠券提现
				window.location.href = "couponCash.jsp";
			}else if(infoTxt == "purHis"){//收入记录查看
                window.location.href = "${pageContext.request.contextPath }/weChat/expenseInfoListMer.htm?consumerId=${sessionScope.consumer.id}";
            }else if (infoTxt == "payNewsNum") {//购买信息发布次数 
				var cash=$("#cash").val();
				var balan=$("#balan").val();
			    if(cash <= 0.00){
			    	/* alert("余额不足，请充值"); */
			    	var res = window.confirm("优惠券余额不足，本次购买将花费现金余额,是否继续?");
			    	/* event.returnValue = confirm("优惠券余额不足，本次购买将花费现金余额,是否继续?"); */
			    	if(res){
			    		if(balan <= 0.00){
			    			alert("现金余额不足,请充值");
			    			return;
			    		}
			    		window.location.href = "findNewsNum.htm";
			    	}
			    	return;
			    }
				window.location.href = "findNewsNum.htm";
			}else if (infoTxt == "sendMsg") {//发信息
				if($("#newsNum").val() <= 0){
					alert("对不起您的可发布次数不足");
					return;
				}
				window.location.href = "${pageContext.request.contextPath }/weChat/sendMsg.htm";
			} /* else if (infoTxt == "helpEmploy") {//帮招工
				var oHelpEmp = document.querySelector("#helpEmploy").innerHTML; 
				$.ajax({
					method:'post',
					url:'find.htm',
					data:{
						title:oHelpEmp
					},
					success:function(data){
						$("#menuBody").html(data);
					}
				}) 
			} */else if(infoTxt == "goExpenInfoMon"){//跳转至消费记录
           	 window.location.href = "expenseInfoList.htm?expenseInfoKind=2&&consumerId=${sessionScope.consumer.id}";
            }
			else if(infoTxt == "goExpenInfo"){//跳转至消费记录
           	 window.location.href = "expenseInfoList.htm?expenseInfoKind=3&&consumerId=${sessionScope.consumer.id}";
            }
		}
	}
</script>
</head>
<body>
	<div id="wrapBox">
		<div id="wrapScroll">
			<section
				class="aui-content user-info aui-text-center aui-margin-b-15">
				<img src="${sessionScope.consumer.pic }"
					class="avatar aui-img-round">
				<h2 class="aui-margin-t-15">${sessionScope.consumer.name }<small><i
						class="aui-iconfont aui-icon-cert aui-text-danger"></i></small>
				</h2>
			</section>

			<section class="aui-content aui-grid aui-margin-b-15">
				<div class="aui-row">
					<div class="aui-col-xs-4 aui-border-r" tapmode onclick="showFixNewWinInfo('goExpenInfoMon')">
						<big class="aui-text-warning">${sessionScope.consumer.balance }<small>
								元</small></big>
									<input type="hidden" id="balan" value="${sessionScope.consumer.balance}">
										<input type="hidden" id="rat" value="${sessionScope.consumer.rate}">
						<div class="aui-gird-lable aui-font-size-12">现金余额</div>
					</div>
					<div class="aui-col-xs-4 aui-border-r" tapmode onclick="showFixNewWinInfo('goExpenInfo')">
						<big class="aui-text-danger">${sessionScope.consumer.cash }<small>
								元</small></big>
								<input type="hidden" id="cash" value="${sessionScope.consumer.cash}">
						<div class="aui-gird-lable aui-font-size-12">优惠券余额</div>
					</div>
					<div class="aui-col-xs-4 aui-border-r">
						<big class="aui-text-danger">${sessionScope.consumer.insurance }<small>
								元</small></big>
						<div class="aui-gird-lable aui-font-size-12">保险金</div>
						<input type="hidden" id="newsNum" name="newsNum" value="${sessionScope.consumer.newsNum}">
					</div>
				</div>
			</section>
			<section class="aui-content" id="menuBody">
				<ul class="aui-list aui-list-in aui-margin-b-15">
					<li class="aui-list-item">
						<div class="aui-list-item-label-icon">
							<i class="iconfont icon-erweima aui-text-success"></i>
						</div>
						<div class="aui-list-item-inner aui-list-item-arrow" tapmode
							onclick="showFixNewWinInfo('myCode')">
							<div class="aui-list-item-title">我的二维码</div>
						</div>
					</li>
					<li class="aui-list-item">
						<div class="aui-list-item-label-icon">
							<i class="iconfont icon-chongzhi aui-text-danger"></i>
						</div>
						<div class="aui-list-item-inner aui-list-item-arrow" tapmode
							onclick="showFixNewWinInfo('voucher')">
							<div class="aui-list-item-title">充值中心</div>
						</div>
					</li>
					<li class="aui-list-item">
						<div class="aui-list-item-label-icon">
							<i class="iconfont icon-tixian aui-text-info"></i>
						</div>
						<div class="aui-list-item-inner aui-list-item-arrow" tapmode
							onclick="showFixNewWinInfo('myCash')">
							<div class="aui-list-item-title">现金提现</div>
						</div>
					</li>
					<li class="aui-list-item">
						<div class="aui-list-item-label-icon">
							<i class="iconfont icon-tixian aui-text-info"></i>
						</div>
						<div class="aui-list-item-inner aui-list-item-arrow" tapmode
							onclick="showFixNewWinInfo('couponCash')">
							<div class="aui-list-item-title">优惠券提现</div>
						</div>
					</li>
					 <li class="aui-list-item">
                        <div class="aui-list-item-label-icon">
                            <i class="iconfont icon-xiaofeijilu aui-text-info"></i>
                        </div>
                        <div class="aui-list-item-inner aui-list-item-arrow" tapmode onclick="showFixNewWinInfo('purHis')">
                            <div class="aui-list-item-title">收入记录查看</div>
                        </div>
                    </li>
						<li class="aui-list-item">
						<div class="aui-list-item-label-icon">
							<i class="iconfont icon-buynow aui-text-success"></i>
						</div>
						<div class="aui-list-item-inner aui-list-item-arrow" tapmode
							onclick="showFixNewWinInfo('payNewsNum')">
							<div class="aui-list-item-title">购买信息发布次数</div>
						</div>
					</li>
					<li class="aui-list-item">
						<div class="aui-list-item-label-icon">
							<i class="iconfont icon-xinxifabu aui-text-danger"></i>
						</div>
						<div class="aui-list-item-inner aui-list-item-arrow" tapmode
							onclick="showFixNewWinInfo('sendMsg')">
							<div class="aui-list-item-title">发信息</div>
						</div>
					</li>
					<c:forEach items="${danNews }" var="dan">
						<li class="aui-list-item">
						<div class="aui-list-item-label-icon">
							<i class="iconfont icon-zhaopin1 aui-text-success"></i>
						</div>
						<div class="aui-list-item-inner aui-list-item-arrow" tapmode
						   >
							<div class="aui-list-item-title" id="helpEmploy"><a style="display: block;" href="find.htm?id=${dan.id }">${dan.title }</a></div>
						</div>
					</li>
					</c:forEach>
				<!-- 	<li class="aui-list-item">
						<div class="aui-list-item-label-icon">
							<i class="iconfont icon-cuxiaoguanli aui-text-info"></i>
						</div>
						<div class="aui-list-item-inner aui-list-item-arrow" tapmode
							onclick="showFixNewWinInfo('helpSale')">
							<div class="aui-list-item-title" id="helpSale">帮临促</div>
						</div>
					</li> -->
				</ul>
			</section>
		</div>
	</div>
	<jsp:include page="nav.jsp" />
</body>
<script>
function find(cmd){
/* 	$.ajax({
		method:'post',
		url:'find.htm?id=' + cmd,
		success:function(data){
			$("#menuBody").html(data);
		}
	}) */
	alert("F");
	window.location.href="find.htm?id=cmd";
}
</script>
</html>