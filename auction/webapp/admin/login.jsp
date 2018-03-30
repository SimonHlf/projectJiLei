<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>后台登录</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/web/Module/account/css/adminLogin.css"/>
	</head>
	<body>
			<div class="fullDiv">
			<div class="headWrap">
				<div class="innerHeadWrap w1100">
					<img src="${pageContext.request.contextPath}/web/images/logo1.png"/>
					<p>玉商通后台管理系统</p>
				</div>
			</div>
			<!--轮播图--> 
			<div id="flashBox" class="bigFlashBox">
				<ul class="banner">
					<li style="background:#f5f6f1 url(${pageContext.request.contextPath}/web/Module/account/images/01.png) center no-repeat; opacity: 1;"></li>
					<li style="background:#f5f6f1 url(${pageContext.request.contextPath}/web/Module/account/images/02.png) center no-repeat; opacity: 0;"></li>
				</ul>  
				<div class="innnerLogin w1100">
					<div class="loginDiv">
						<strong class="titStrong">用户登录</strong>
						<form action="login.htm" method="post">
							<div class="comInpDiv">
								<span class="titSpan userIcon"></span>
								<input type="text" placeholder="请输入用户名" name="name"/>
							</div>
							<div class="comInpDiv">
								<span class="titSpan lockIcon"></span>
								<input type="password" placeholder="请输入密码" name="password"/>
							</div>
							<input class="goLoginBtn" type="submit" class="btn btn-primary btn-block" value="立即登录">
						</form>
					</div>
				</div>
			</div>
		</div>
		<script src="${pageContext.request.contextPath}/web/js/jquery-1.7.2.min.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript">
			$(function(){
				init();
			});
			function init(){
				var cliWid = document.documentElement.clientWidth;
				var cliHei = document.documentElement.clientHeight;
				$(".fullDiv").css({
					"width":cliWid,
					"height":cliHei
				});
				autoFalsh();
			}
			//轮播图
			function autoFalsh(){
				var iNow = 0;
				var page = $("#flashBox li").length;
				var iTime = null;
				
				$('.smallBtn span').each(function(i){
					$(this).click(function(){
						  banner(i);
					});
				});
				function banner(index){
				    iNow = index;
					$('.smallBtn span').eq(index).addClass('active').siblings('span').removeClass('active');
					  $('#flashBox .banner li').eq(index).stop().animate({
						'opacity':1 
					  },1000).siblings('li').stop().animate({
						  'opacity':0
					  },1000);
				}
				
				autoRun();
				
				function autoRun(){
					iTime = setInterval(function(){
						iNow++;
						if(iNow>page-1){
						  iNow = 0;	
						}
						banner(iNow);
					},4000);
				}
			}
		</script>
	</body>
</html>
