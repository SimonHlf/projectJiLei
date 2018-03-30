<%@ page contentType="text/html;charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0"/>
    <title>商家帮-充值</title>
    <link rel="icon" type="image/x-icon" href="favicon.ico">
    <link rel="stylesheet" type="text/css" href="css/aui.css" />
    <link rel="stylesheet" href="//at.alicdn.com/t/font_478795_gxp2yoiw056irudi.css" />
    <link rel="stylesheet" href="css/aui-flex.css">
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
        #wrapBox{
			width: 100%;
			position:relative;
			overflow: hidden;
		}
		#wrapScroll{
			width:100%;
			position:absolute;
			left:0;
			top:0px;
			-webkit-tap-highlight-color:rgba(0,0,0,0);
		}
		
		.priceNum{
				border:1px solid #68c7ec;
				padding:10px 0px;
				color:#68c7ec;
				font-size:0.8rem !important;
				border-radius:3px;
			}
			.aui-grid [class*=aui-col-xs-]:active{
				background:#fff !important;
			}
			.priceNum.selected{
				background:#68c7ec;
				color:#fff;
			}
			.payBox,
			.selPayWay{
				background:#fff;
			}
			.payBox p{
				font-size:0.8rem !important;
				color:#333;
			}
			.aui-list{
				background-image:none !important;
			}
			.aui-list-item-input input::-webkit-input-placeholder{
			 	color:#ccc;
			 	font-size:0.8rem;
		 	}
			.weixinIcon{
			 	color:#41B035;
			 	margin-right:15px;
			}
			.aliPay{
				color:#00a7ff;
				margin-right:10px;
			}
			.aui-list-item-inner{
				position:relative;
			}
			.aui-radio{
				position:absolute;
				right:10px;
				top:10px;
			}
			.comNumRadio{opacity:0;display:none;}
    </style>
    <script type="text/javascript">
        window.onload = function(){
            wrapScroll();
            selChargeNum();
        }
        function selChargeNum(){
        	$(".priceNum").each(function(i){
            	$(this).click(function(){
            		$(".priceNum").removeClass("selected");
            		$(this).addClass("selected");
            		$("#nowSeMoney").val($(".comNumRadio").eq(i).val());
            	});
            });
        }
        function goCharge(){
        	var chargeNum = $("#nowSeMoney").val();
        	var couponMoney=0.00;
        	var attr0=2;
        	window.location='pay_.htm?money='+chargeNum+"&couponMoney="+couponMoney+"&allMoney="+chargeNum+"&attr0="+attr0;
        }
    </script>
</head>
<body>
    <div id="wrapBox">
        <div id="wrapScroll">
            <section class="aui-content user-info aui-text-center aui-margin-b-15">
                <img src="${sessionScope.consumer.pic }" class="avatar aui-img-round">
                <h2 class="aui-margin-t-15">${sessionScope.consumer.name }<small><i class="aui-iconfont aui-icon-cert aui-text-danger"></i></small></h2>
            </section>

            <section class="aui-content aui-grid aui-margin-b-15">
                <div class="aui-row">
                    <div class="aui-col-xs-4 aui-border-r">
                        <big class="aui-text-warning">${sessionScope.consumer.balance }<small> 元</small></big>
                        <div class="aui-gird-lable aui-font-size-12">现金余额</div>
                    </div>
                    <div class="aui-col-xs-4 aui-border-r">
                        <big class="aui-text-danger">${sessionScope.consumer.cash }<small> 元</small></big>
                        <div class="aui-gird-lable aui-font-size-12">优惠券余额</div>
                    </div>
                    <div class="aui-col-xs-4 aui-border-r">
                        <big class="aui-text-danger">${sessionScope.consumer.insurance }<small> 元</small></big>
                        <div class="aui-gird-lable aui-font-size-12">保险金</div>
                    </div>
                </div>
            </section>
			<!-- 面值金额 -->
			<section class="aui-grid aui-margin-b-10">
				<div class="aui-row">
					<div class="aui-col-xs-4 aui-padded-10">
			            <div class="aui-grid-label priceNum selected">10元</div>
			            <input type="radio" class="comNumRadio" name="moneyNum" value="10" checked/>
			        </div>
			        <div class="aui-col-xs-4 aui-padded-10">
			            <div class="aui-grid-label priceNum">20元</div>
			            <input type="radio" class="comNumRadio" name="moneyNum" value="20"/>
			        </div>
			         <div class="aui-col-xs-4 aui-padded-10">
			            <div class="aui-grid-label priceNum">50元</div>
			            <input type="radio" class="comNumRadio" name="moneyNum" value="50"/>
			        </div>
				</div>
			</section>
			<section class="aui-grid aui-margin-b-10">
				<div class="aui-row">
					<div class="aui-col-xs-4 aui-padded-10">
			            <div class="aui-grid-label priceNum">100元</div>
			            <input type="radio" class="comNumRadio" name="moneyNum" value="100"/>
			        </div>
			        <div class="aui-col-xs-4 aui-padded-10">
			            <div class="aui-grid-label priceNum">200元</div>
			            <input type="radio" class="comNumRadio" name="moneyNum" value="200"/>
			        </div>
			         <div class="aui-col-xs-4 aui-padded-10">
			            <div class="aui-grid-label priceNum">500元</div>
			            <input type="radio" class="comNumRadio" name="moneyNum" value="500"/>
			        </div>
				</div>
			</section>
			<!-- 选择付款方式 -->
			<div class="aui-content aui-margin-b-10 aui-padded-10 selPayWay">
				<div class="aui-list aui-select-list">
					<div class="aui-list-item">
		                <div class="aui-list-item-inner">
		 					<i class="iconfont icon-weixinzhifu weixinIcon"></i>微信支付
		                    <input class="aui-radio" type="radio" name="payRadio" checked>
		                </div>
		            </div>
				</div>
			</div>
			<input id="nowSeMoney" type="hidden" value="10"/>
			<!-- 确认充值按钮 --> 
			<div class="aui-btn aui-btn-primary aui-btn-block aui-btn-sm" tapmode onclick="goCharge();"  style="width:95%;margin:0 auto;">确认充值</div>
        </div>
    </div>
    <jsp:include page="nav.jsp"/>
</body>
</html>