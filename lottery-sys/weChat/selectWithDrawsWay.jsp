<%@ page contentType="text/html;charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0" />
<title>选择提现方式</title>
	<link rel="stylesheet" href="../weChat/reception/css/aui.css"/>
	<link rel="stylesheet" href="../weChat/reception/css/selectChargeWay.css"/>
	<link rel="stylesheet" href="http://at.alicdn.com/t/font_535570_6u90gnv3u6hzd7vi.css"/>
</head>
<body>
	<header class="aui-bar aui-bar-nav headerNav">
        <a class="aui-pull-left aui-btn" tapmode onclick="history.go(-1)" href="javascript:void(0)">
            <span class="aui-iconfont aui-icon-left"></span>
        </a>
        <input type="hidden" id="userId" value="${frontUser.userId }">
        <div class="aui-title">选择提现方式</div>
    </header>
	<div class="aui-content">
		<div class="conHead">
			<p>您好：${frontUser.nickName }</p>
			<p>您的账户余额：${frontUser.balance }元</p>
		</div>
		<ul class="aui-list aui-media-list">
			<li class="aui-list-item aui-list-item-middle">
                <div class="aui-media-list-item-inner">
                    <div class="aui-list-item-media" style="width: 3rem;">
                        <img src="../weChat/images/aliPay.png" class="aui-list-img-sm">
                    </div>
                    <div class="aui-list-item-inner aui-list-item-arrow">
                    	<input type="radio" name="selPayRadio" value="1">
                        <div class="aui-list-item-text">
                            <div class="aui-list-item-title aui-font-size-14">支付宝快捷提现</div>
                        </div>
                        <div class="aui-list-item-text">
                            安全快捷，无手续费
                        </div>
                    </div>
                </div>
            </li>
            <li class="aui-list-item aui-list-item-middle">
                <div class="aui-media-list-item-inner">
                    <div class="aui-list-item-media" style="width: 3rem;">
                        <img src="../weChat/images/weixinPay.png" class="aui-list-img-sm">
                    </div>
                    <div class="aui-list-item-inner aui-list-item-arrow">
                    	<input type="radio" name="selPayRadio" value="2">
                        <div class="aui-list-item-text">
                            <div class="aui-list-item-title aui-font-size-14">微信快捷提现</div>
                        </div>
                        <div class="aui-list-item-text">
                            安全快捷，无手续费
                        </div>
                    </div>
                </div>
            </li>
             <li class="aui-list-item aui-list-item-middle">
                <div class="aui-media-list-item-inner">
                    <div class="aui-list-item-media" style="width: 3rem;">
                        <img src="../weChat/images/yinlianPay.png" class="aui-list-img-sm">
                    </div>
                    <div class="aui-list-item-inner aui-list-item-arrow">
                    	<input type="radio" name="selPayRadio" value="3">
                        <div class="aui-list-item-text">
                            <div class="aui-list-item-title aui-font-size-14">银行卡在线提现</div>
                        </div>
                        <div class="aui-list-item-text">
                            安全快捷，无手续费
                        </div>
                    </div>
                </div>
            </li> 
		</ul>
	</div>
	<!-- 温馨提示 -->
	<div class="tipInfoBox">
		<strong>友情提示：</strong>
		<p>1、确保每一个客户的基本利益，确保每一个客户的基本利益确保每一个客户的基本利益确保每一个客户的基本利益确保每一个客户的基本利益确保每一个客户的基本利益确保每一个客户的基本利益</p>
		<p>2、确保每一个客户的基本利益确保每一个客户的基本利益确保每一个客户的基本利益</p>
	</div>
	<script type="text/javascript" src="../weChat/reception/jsPlugin/jquery.min.js"></script>
	<script type="text/javascript">
		$(function(){
			
		});
		$(".aui-list-item-inner input").each(function(){
			$(this).click(function(){
				var chargeType = $.trim($(this).val());
				//window.location.href = "chargeDetail.html?pay="+$(this).val();
				window.location.href = "withdrawsCashDetail.htm?id="+$.trim($("#userId").val())+"&chargeType="+chargeType;
			});
		});
	</script>
</body>
</html>