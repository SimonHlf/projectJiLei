<%@page pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
	<meta charset="UTF-8">
	<title>推广二维码</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/web/Module/personalCen/css/yongjinManager.css">
</head>
<body>
	<div id="content">
		<!-- 顶部副导航 -->
		<%@ include file="../../head.jsp"%>  
		<!-- 个人中心内容 -->
		<div class="personalCenCon clearfix w1100">
			<%@ include file="personalHead.jsp" %>
			<div class="rightPersonal fr">
				<strong class="rightTit"><span></span>佣金管理</strong>
				<div class="rightCon">
					<div class="yongjinListNav">
						<ul class="clearfix">
							<li><a href="${pageContext.request.contextPath}/web/commission/commiss.htm?cmd=7">佣金收益</a></li>
							<li><a href="${pageContext.request.contextPath}/web/commission/development.htm?cmd=7">佣主发展</a></li>
							<li><a href="${pageContext.request.contextPath}/web/commission/record.htm?cmd=7">佣金记录</a></li>
							<li class="active"><a href="javascript:void(0)">推广二维码</a></li>
						</ul>
					</div>
					<div class="yongjinWrap">
						<div class="imgWrap">
							<div class="erweiCode">
								<img id="erweiCodeImg" src="${pageContext.request.contextPath}/web/commission/validateCode.htm" />
								<a href="javascript:void(0)" onclick="jsCopy()">复制链接</a>
								<input type="text" id="fenxiang" readonly="readonly" value="${qrurl }">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		</div>
		<%@ include file="../../foot.jsp"%>  
		<script src="${pageContext.request.contextPath}/web/js/jquery-1.7.2.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="${pageContext.request.contextPath}/web/js/clipboard.min.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript">
			function jsCopy(){
				var e=document.getElementById("fenxiang");//对象是copy-num1  
	            e.select(); //选择对象  
	            document.execCommand("Copy"); //执行浏览器复制命令  
	            alert("复制成功");
			}
			
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
