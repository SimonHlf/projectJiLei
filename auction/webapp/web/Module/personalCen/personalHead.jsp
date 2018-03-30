<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/web/css/layer.css"/>
<div class="leftPersonal fl">
		<div class="leftTopPart">
			<strong>会员中心<!--<span></span>--></strong>
			<ul id="DH">
				<li><a href="${pageContext.request.contextPath }/web/shop/userCenterApi/toUserCenterJsp.htm?sort=0">个人资料</a></li>
				<li><a href="${pageContext.request.contextPath }/web/shop/userCenterApi/toSetPasswordJsp.htm?sort=1">修改密码</a></li>
				<li><a href="${pageContext.request.contextPath }/web/shop/orderApi/myOrderList.htm?sort=2">我的订单</a></li>
				<li><a href="${pageContext.request.contextPath }/web/shop/myCartApi/toMyCartJsp.htm?type=1&sort=3">我的购物车</a></li>
				<li><a href="${pageContext.request.contextPath}/web/auctionOrder/list.htm?sort=4">竞拍记录</a></li>
				<li><a href="${pageContext.request.contextPath}/web/auctionOrder/order.htm?sort=5">竞拍订单</a></li>
				<li><a href="${pageContext.request.contextPath}/web/auctionOrder/myAuction.htm?sort=6">我的拍卖</a></li>
				<li><a href="${pageContext.request.contextPath}/web/remind/myRemind.htm?sort=7">我的竞拍提醒</a></li>
				<li><a href="${pageContext.request.contextPath}/web/shop/myJiFenApi/list.htm?sort=8">我的积分</a></li>
				<li><a href="${pageContext.request.contextPath}/web/withdrawCashController/toWith.htm?sort=9">申请提现</a></li>
				<li><a href="${pageContext.request.contextPath}/web/shop/consigneeApi/toConsigneeJsp.htm?sort=10">收货地址</a></li>
				<li><a href="javascript:checkIdent()">商家入驻</a></li>
				<li><a href="${pageContext.request.contextPath}/web/commission/commiss.htm?sort=12">佣金管理</a></li>
				<li><a href="${pageContext.request.contextPath}/web/shop/myJinBiApi/list.htm?sort=13">我的金币</a></li>
				<li id="my"><a href="javascript:mymsg(0)" onclick="message(${userInfo.useraccount});">我的消息</a></li>
			</ul>
		</div>
		<!-- 推荐好货 -->
		<!-- <div class="leftRecommed" style="display:none">
			<div class="smMod">
				<strong>推荐好货</strong>
			</div>
			<div class="goodProList">
				<ul>
					<li>
						<div class="proImg">
							<img src="images/recommendImg.jpg">
							<p class="proTit">
								<a class="ellip" href="">金玉满堂金玉满堂</a>
							</p>
						</div>
						<p class="nowPrice">当前价：<span>¥2500</span></p>
					</li>
					<li>
						<div class="proImg">
							<img src="images/recommendImg.jpg">
							<p class="proTit">
								<a class="ellip" href="">金玉满堂金玉满堂</a>
							</p>
						</div>
						<p class="nowPrice">当前价：<span>¥2500</span></p>
					</li>
				</ul>
			</div>
		</div> -->
	</div>
			
	<script type="text/javascript" src="${pageContext.request.contextPath }/web/js/layer.js"></script>		
	<script type="text/javascript">
	var sort = '${param.sort}';
	if(sort=='') sort = '20';
	$($("#DH li")[parseInt(sort)]).addClass("active");
	function checkIdent(){
		$.ajax({
		    type: 'post',  
		    url: "${pageContext.request.contextPath }/web/shop/userIdentApi/checkIdent.htm",
		    success: function (data) {	        	
		    	 if(data.result=="ok"){
		    		 window.location.href="${pageContext.request.contextPath}/web/shop/userIdentApi/toIdentJsp.htm?sort=9";
		    	 }else{
		    		 layer.msg(data.msg);
		    		 
		    	 }  
		    }
		    });
		
	}
	
	</script>