<%@ page contentType="text/html;charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0" />
<title>商家帮-${title }</title>
<link rel="icon" type="image/x-icon" href="favicon.ico">
<link rel="stylesheet" type="text/css" href="css/aui.css" />
	<script src="${pageContext.request.contextPath }/admin/assets/js/jquery-2.0.3.min.js"></script>
	<script src="js/iscroll.js"></script>
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
		.listHead{
			margin-top:10px;
		}
		.listHead,
		.listCon li{
			width:100%;
			height:2rem;
			background:#fff;
			border-bottom:1px solid #ddd;
		}
		.listHead li{
			color:#666;
		}
		.listCon li p{
			color:#999;
		}
		.listHead li,
		.listCon li p{
			height: 100%;
			line-height:2rem;
			text-align: center;
			font-size: 0.7rem;
			float: left;
		}
		/*.listHead li:nth-of-type(1),
		.listCon li p:nth-of-type(1){
			width:18%;
		}
		.listHead li:nth-of-type(2),
		.listCon li p:nth-of-type(2){
			width:18%;
		}
		.listHead li:nth-of-type(3),
		.listCon li p:nth-of-type(3){
			width:18%;
		}
		.listHead li:nth-of-type(4),
		.listCon li p:nth-of-type(4){
			width:28%;
		}
		.listHead li:nth-of-type(5),
		.listCon li p:nth-of-type(5){
			width:18%;
		}*/
		.listHead li:nth-of-type(1),
		.listCon li p:nth-of-type(1),
		.listHead li:nth-of-type(3),
		.listCon li p:nth-of-type(3){
			width:28%;
		}
		.listHead li:nth-of-type(2),
		.listCon li p:nth-of-type(2){
			width:44%;
		}
		.listCon{
			position:relative;
		}
		.oddBgColor{
			background:#f5f5f5 !important;
		}
		.aui-tab-item{
			color:#666 !important;
		}
		.aui-tab-item.aui-active{
			color:#039be5 !important;
		}
	</style>
	<script>
		window.onload = function(){
            wrapScroll();
            $("#wrapScroll li:odd").addClass("oddBgColor");
		}
        var moveFlag = true;
        function wrapScroll(){
            var footHei = parseFloat(document.querySelector("#footer").style.height);
            var headerHei = $("#header").innerHeight();
            var listHeadHei = $("#listHead").height();
            var tabHei = $("#tabBox").height();
            var cliHei = document.documentElement.clientHeight;
            var calHei = cliHei - 12-(footHei*20) - headerHei - tabHei - listHeadHei;
            document.querySelector("#wrapBox").style.height = calHei + 'px';
            myScroll = new iScroll("wrapBox", {
                checkDOMChanges: true,
                vScrollbar:false,
                hScrollbar : false
            });
        }
        document.addEventListener('touchmove', function (e) { e.preventDefault(); }, {passive:false});
        function viewConsuHis(cmd){
			//执行查看当前消费时间在消费记录详情
			$.ajax({
				method:'post',
				url:'expenseInfoOwn.htm?id='+cmd,
				success:function(data){
					window.location.href="expenseInfoOwn.jsp";
				}
			})
		}
		//现金消费记录 优惠券消费记录
		function showCashOffHis(obj,options){
			$(".aui-tab-item").removeClass("aui-active");
            $(obj).addClass("aui-active");
			if(options == "cashHis"){
			    //现金消费记录
				 window.location.href = "${pageContext.request.contextPath }/weChat/expenseInfoList.htm?consumerId=${sessionScope.consumer.id}&&kind=2";

			}else if(options == "offHis"){
			    //优惠券消费记录
				 window.location.href = "${pageContext.request.contextPath }/weChat/expenseInfoList.htm?consumerId=${sessionScope.consumer.id}&&kind=3";
			}
		}
	</script>
</head>
<body>
	<header id="header" class="aui-bar aui-bar-nav aui-bar-light">
		<a class="aui-pull-left aui-btn" href="personal2.htm">
			<span class="aui-iconfont aui-icon-left" style="color:#666;"></span>
		</a>
		<div class="aui-title" style="color:#666;">${title }</div>
	</header>

	<div id="tabBox" class="aui-tab">
		<!-- <div class="aui-tab-item aui-active" tapmode onclick="showCashOffHis(this,'cashHis')">现金消费记录</div>
		<div class="aui-tab-item" tapmode onclick="showCashOffHis(this,'offHis')">优惠券消费记录</div> -->
	</div>
	<%-- 列表头部 --%>
	<section id="listHead" class="listHead">
		<ul>
			<!-- <li>编号</li> -->
			<li>订单金额</li>
			<li>时间</li>
			<li>详情</li>
		</ul>
	</section>
	<%-- 列表数据 --%>
	<section class="listCon">
		<div id="wrapBox">
			<ul id="wrapScroll">    <%-- onclick="viewConsuHis(${expenseInfo.id})" --%>
				<c:forEach items="${list}" var="orderInfo">
					<li>
						<%-- <p>${orderInfo.id}</p> --%>
						<p>${orderInfo.expenseMoney}</p>
						<p class="aui-ellipsis-1">${orderInfo.addTime}</p>
					<c:if test="${merchantEx == '0' }">
						<p tapmode><a href="expenseInfoOwn.htm?id=${orderInfo.id}"><i class="aui-iconfont aui-icon-search aui-font-size-14" style="color: #039be5;"></i></a></p>
					
					</c:if>
					<c:if test="${merchantEx == '1' }">
						<p tapmode><a href="expenseInfoOwnMer.htm?id=${orderInfo.id}"><i class="aui-iconfont aui-icon-search aui-font-size-14" style="color: #039be5;"></i></a></p>
					</c:if>
					</li>
				</c:forEach>
			</ul>
		</div>
	</section>
	<jsp:include page="nav.jsp" />
</body>
</html>