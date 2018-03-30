<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8">
		<title>个人中心</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/web/Module/personalCen/css/personalInfo.css"/>
	</head>
	<body>
		<div id="content">
		<%@ include file="../../head.jsp"%>  
		<%@ include file="sock.jsp"%>
		<!-- 个人中心内容 -->
		<div class="personalCenCon w1100 clearfix">
			<%@ include file="personalHead.jsp"%>  
			
			<div class="rightPersonal fr">
				<strong class="rightTit"><span></span>个人资料</strong>
				<div class="rightCon">
					<div class="personInfoWrap">
						<div class="innerInfo">
							<div class="topInfo">
								<div class="leftTopInfo clearfix fl">
									<!-- <div class="headImg fl"></div> -->
									<div class="perInfoLeft fl">
										<p class="phoneP"><strong>${user.useraccount}</strong></p>	
										<div class="clearfix">
											<!-- <span class="fl">资料完整度：</span>
											<p class="fl infoComp">
												<span class="nowPerBg"></span>
												<em>0%</em>
											</p> -->
											<a class="completeInfo" href="${pageContext.request.contextPath }/web/shop/userCenterApi/toEditUserInfo.htm">立即完善</a>
										</div>
									</div>
								</div>
								<div class="rightTopInfo fr">
									<div class="topRightInfo">
										<strong>我的消息</strong>
										<p>没有新消息！</p>
									</div>
									<div class="botRightInfo">
										<strong>系统消息</strong>
										<p>您有一条新的系统消息！</p>
									</div>
								</div>
							</div>
							<div class="botInfo">
								<ul class="clearfix">
									<li>
										<span class="lineSpan"></span>
										<p>我的积分：${user.totalintegral}积分</p>
										<p>我的待收益积分：${user.incomeintegral}积分</p>
										<p>我的拍卖：XXX件</p>
									</li>
									<li>
										<span class="lineSpan"></span>
										<p>共计消费：XXX元</p>
										<p>本月消费：XXX元</p>
										<p>拍卖产品件数：XXX件：XXX元</p>
									</li>
								</ul>
							</div>
						</div>
					</div>
					<!-- 订单记录 -->
					<!-- <div class="orderLists">
						<div class="orderListsNav">
							<ul class="clearfix fl">
								<li class="active">全部订单</li>
								<li>待支付</li>
								<li>已支付</li>
							</ul>
							<a class="viewMore" href="myOrderList.html">查看更多&gt;&gt;</a>
						</div>
						<table class="orderListTab" style="margin-bottom: 10px;" cellpadding="0" cellspacing="0">
							<tr>
								<th class="oneWidTd noBorRight">商品名称</th>
								<th class="twoWidTd noBorLeft noBorRight">商品单价</th>
								<th class="twoWidTd noBorLeft noBorRight">购买数量</th>
								<th class="twoWidTd noBorLeft noBorRight">商品操作</th>
								<th class="threedWidTd noBorLeft noBorRight">实付款</th>
								<th class="threedWidTd noBorLeft noBorRight">交易状态</th>
								<th class="threedWidTd noBorLeft">交易操作</th>
							</tr>
						</table>
						<div class="listTable">
							<table class="orderListTab" cellpadding="0" cellspacing="0">
								<tr>
									<th class="listTh" colspan="8">
										<span class="orderTime">2018-03-07</span>
										<span class="orderNum">订单编号：135113718971609916</span>
										<a href="">西藏锦绣</a>
									</th>
								</tr>
								<tr>
									<td class="paddTd noBorRight">
										<div class="orderProImg">
											<a href=""><img src="images/0.jpg"/></a>
										</div>
										<p class="proTitA">
											<a href="">SkinAT iPhone SE贴纸手机外壳背贴苹果5s保护贴膜苹果5创意配件 [交易快照]</a>
										</p>
									</td>
									<td class="twoWidTd txtCen noBorLeft noBorRight">
										<div class="comPosTd">
											<p class="oldPriceSp">￥29.00</p>
											<p class="nowPriceSp">￥20.00</p>
										</div>
									</td>
									<td class="twoWidTd txtCen noBorLeft noBorRight">
										<div class="comPosTd">
											<p>1</p>
										</div>
									</td>
									<td class="twoWidTd txtCen noBorLeft noBorRight">
										<div class="comPosTd">
											
												01：违规举报
												02：申请售后
												03:退款/退货
												04:投诉卖家
											
											<p><a href="">申请售后</a></p>
											<p><a href="">退款/退货</a></p>
										</div>
									</td>
									<td class="threedWidTd txtCen">
										<div class="comPosTd">
											<p><strong>￥1.98</strong></p>
											<p>(含运费：￥0.00)</p>
										</div>
									</td>
									<td class="threedWidTd txtCen">
										
											01：等待买家付款
											02：卖家已发货
											03：交易成功
										
										<div class="comPosTd">
											<p>等待买家付款</p>
											<p><a href="">订单详情</a></p>
										</div>
									</td>
									<td class="threedWidTd txtCen">
										
											01：立即付款
											02：确认收货
											03：立即评价
											04:取消订单
										
										<div class="comPosTd">
											<a class="comBlockA goPayBtn" href="">立即付款</a>
											<p><a href="">取消订单</a></p>
										</div>
									</td>
								</tr>
							</table>
						</div>
						
						<div class="sameRecommend" style="margin-top: 20px;">
							<strong class="recomTit">猜你喜欢</strong>
							<div class="sameRecomCon">
								<div class="comTri leftTri"></div>
								<div class="comTri rightTri"></div>
								<ul class="clearfix">
									<li>
										<div class="recomImgDiv">
											<img src="images/recommend.jpg"/>
											<p class="proTit">
												<a href="">金玉满堂金玉满堂</a>
											</p>
										</div>
										<p class="nowPrice1">当前价：<span>¥2500</span></p>
									</li>
									<li>
										<div class="recomImgDiv">
											<img src="images/recommend.jpg"/>
											<p class="proTit">
												<a href="">金玉满堂金玉满堂</a>
											</p>
										</div>
										<p class="nowPrice1">当前价：<span>¥2500</span></p>
									</li>
									<li>
										<div class="recomImgDiv">
											<img src="images/recommend.jpg"/>
											<p class="proTit">
												<a href="">金玉满堂金玉满堂</a>
											</p>
										</div>
										<p class="nowPrice1">当前价：<span>¥2500</span></p>
									</li>
								</ul>
							</div>
						</div>
					</div> -->
				</div>
			</div>
		</div>
		</div>
	<%@ include file="../../foot.jsp"%>  
	
	<script type="text/javascript" src="${pageContext.request.contextPath }/web/js/jquery-1.7.2.min.js"></script>	
	<script type="text/javascript">
		function message(username){
			mymsg(username);
		}
		
		function mymsg(str){
			$.ajax({
				type:'post',
				data:"username="+str,
				url:'${pageContext.request.contextPath}/web/tuimsgController/getPersonTuimsg.htm',
				success:function(data){
					$("#content").html(data);	
				},
				error:function(data){
				}
			});			
		}
	</script>
	</body>
</html>
