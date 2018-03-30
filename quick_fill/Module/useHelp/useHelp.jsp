<!DOCTYPE html>
<%@page pageEncoding="utf-8" %>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0"/>
		<title>使用帮助</title>
		<link rel="stylesheet" type="text/css" href="../../css/reset.css"/>
		<link rel="stylesheet" type="text/css" href="css/useHelp.css"/>
	</head>
	<body class="bodyPadBot">
		<!-- 使用帮助 -->
		<div class="comList helpList">
			<strong class="comStrongTit">使用帮助</strong>
			<ul id="ulList" class="clearfix">
				<li>
					<div class="innerPar clearfix">
						<span class="radiusSpan"></span>
						<p>充电流程</p>
						<p><span class="triBg"></span></p>
						<div class="detailDiv helpDiv">
							<span><em></em>第一步：打开微信，点击扫一扫后，点击“好快充物联网智能充电”并关注公众号；</span>
							<span><em></em>第二步：在微信消息列表里，点击“好快充物联网智能充电”，点击“我的”进入充电界面；</span>
							<span><em></em>第三步：根据界面内容选择充值后即可扫码或绑定电卡充电；</span>
						</div>
					</div>
				</li>
				<li>
					<div class="innerPar clearfix">
						<span class="radiusSpan"></span>
						<p>电卡问题</p>
						<p><span class="triBg"></span></p>
						<div class="detailDiv helpDiv">
							<span><em></em>电卡定义：为方便社区没有智能手机的人士快捷方便使用好快充物联网智能充电系统进行充电，系统可通过亲属微信账户绑定一张经过授权的IC卡，通过刷绑定的电卡进行充电消费（注：消费将扣除绑定的微信账户内的账户余额）如丢失电卡或不再使用电卡，在微信账户内操作删除电卡即可，本电卡及时失效</span>
							<span><em></em>绑定电卡：请在微信公众号界面点击“我的”进入“我的电卡”界面，按提示操作即可。</span>
						</div>
					</div>
				</li>
				<li>
					<div class="innerPar clearfix">
						<span class="radiusSpan"></span>
						<p>常见问题</p>
						<p><span class="triBg"></span></p>
						<div class="detailDiv helpDiv">
							<span><em></em>我是常见问题</span>
							<span><em></em>我是常见问题</span>
						</div>
					</div>
				</li>
			</ul>
		</div>
		<!-- footer -->
		<div class="footer">
			<ul class="clearfix">
				<li class="fourWid active">
					<a class="homeA" href="../../index.jsp">
						<span></span>
						<p>首页</p>
					</a>
				</li>
				<li class="fourWid"><a class="chargeA" href="../charging/charging.jsp">
					<span></span>
					<p>充电中</p>
				</a></li>
				<li class="fourWid"><a class="scanA" href="../scan/scan.jsp">
					<span></span>
					<p>扫一扫</p>
				</a></li>
				<li class="fourWid"><a class="setA" href="../setting/settting.jsp">
					<span></span>
					<p>设置</p>
				</a></li>
			</ul>
		</div>
		<script src="../../jsPlugin/jquery.min.js" type="text/javascript"></script>
		<script src="../reChargeRecord/js/showDetailCon.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript">
			$(function(){
				showDetailCon();
			});
		</script>
	</body>
</html>
