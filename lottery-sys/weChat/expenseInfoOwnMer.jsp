<%@ page contentType="text/html;charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0" />
<title>彩票-消费详情</title>
<link rel="icon" type="image/x-icon" href="favicon.ico">
<link rel="stylesheet" type="text/css" href="css/aui.css" />
<link rel="stylesheet" href="//at.alicdn.com/t/font_480287_wwebeut8g7722o6r.css">
<script src="js/iscroll.js"></script>
<script src="js/comScroll.js"></script>
<style type="text/css">
    .aui-list{background-image:none !important;}
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
</script>
</head>
<body>
	<div id="wrapBox">
		<div id="wrapScroll">
			<header class="aui-bar aui-bar-nav aui-bar-light">
				<a class="aui-pull-left aui-btn" tapmode="" onclick="history.go(-1)">
					<span class="aui-iconfont aui-icon-left"  style="color:#666;"></span>
				</a>
		        <div class="aui-title" style="color:#272727;">消费详情</div>
			</header>
			<section class="aui-content">
		        <ul class="aui-list aui-list-in">
		         <li class="aui-list-item">
		                <div class="aui-list-item-label-icon">
		                    <i class="iconfont icon-xiaofeijine aui-text-primary" style="font-size: 0.9rem;"></i>
		                </div>
		                <div class="aui-list-item-inner aui-font-size-14">
		                    订单金额：${orderInfo.ammount }
		                </div>
		            </li>
		               <li class="aui-list-item">
		                <div class="aui-list-item-label-icon">
		                    <i class="iconfont icon-xiaofeijine aui-text-success" style="font-size: 0.9rem;"></i>
		                </div>
		                <div class="aui-list-item-inner aui-font-size-14">
		                    优惠券金额：${orderInfo.couponMoney }<c:if test="${orderInfo.couponMoney == null }">0.00</c:if>
		                </div>
		            </li>
		            <li class="aui-list-item">
		                <div class="aui-list-item-label-icon">
		                    <i class="iconfont icon-xiaofeijine aui-text-primary" style="font-size: 0.9rem;"></i>
		                </div>
		                <div class="aui-list-item-inner aui-font-size-14">
		                    交易金额：${orderInfo.expenseMoney }
		                </div>
		            </li>
		            <li class="aui-list-item">
		                <div class="aui-list-item-label-icon">
		                    <i class="iconfont icon-time aui-text-success"></i>
		                </div>
		                <div class="aui-list-item-inner aui-font-size-14">
		                    创建时间：${orderInfo.addTime }
		                </div>
		            </li>
		              <li class="aui-list-item">
		                <div class="aui-list-item-label-icon">
		                    <i class="iconfont icon-zhifuzhuangtai aui-text-primary"></i>
		                </div>
		                <c:if test="${orderInfo.flag == 1 }">
		                    <div class="aui-list-item-inner aui-font-size-14">
		                    支付状态:成功
		                </div>
		                </c:if>
		                <c:if test="${orderInfo.flag == 0 }">
		                    <div class="aui-list-item-inner aui-font-size-14">
		                    支付状态:失败
		                </div>
		                </c:if>
		            </li>
		            <li class="aui-list-item">
		                <div class="aui-list-item-label-icon">
		                    <i class="iconfont icon-dingdanbianhao aui-text-danger"></i>
		                </div>
		                <div class="aui-list-item-inner aui-font-size-14">
		                    订单号：${orderInfo.orderNo}
		                </div>
		            </li>
		            <c:if test="${empty isConsumerId }">
		             <li class="aui-list-item">
		                <div class="aui-list-item-label-icon">
		                    <i class="iconfont icon-shanghu aui-text-warning"></i>
		                </div>
		                <div class="aui-list-item-inner aui-font-size-14">
		                    消费者：${consumerName }
		                </div>
		            </li>            
		            </c:if>
		        </ul>
		       </section>
		       <header class="aui-bar aui-bar-nav aui-bar-light">
		        	<div class="aui-title" style="color:#272727;">本次收入</div>
				</header>
				<section class="aui-content">
			        <ul class="aui-list aui-list-in">
			         <li class="aui-list-item">
			                <div class="aui-list-item-label-icon">
			                    <i class="iconfont icon-xiaofeijine aui-text-primary" style="font-size: 0.9rem;"></i>
			                </div>
			                <div class="aui-list-item-inner aui-font-size-14">
			                    现金金额：${nowMoney }
			                </div>
			            </li>
			               <li class="aui-list-item">
			                <div class="aui-list-item-label-icon">
			                    <i class="iconfont icon-xiaofeijine aui-text-success" style="font-size: 0.9rem;"></i>
			                </div>
			                <div class="aui-list-item-inner aui-font-size-14">
			                    优惠券金额：${nowCoupon }
			                </div>
			            </li>
			        </ul>
			       </section>
		      </div>
		     </div>

	<jsp:include page="nav.jsp" />
</body>
</html>