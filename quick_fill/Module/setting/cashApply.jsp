<%@page pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="v" tagdir="/WEB-INF/tags"%>
<html>
<head>
<meta charset="UTF-8">
<title>我的提现</title>
<meta name="viewport"
	content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/weChat/css/reset.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/weChat/Module/setting/css/cashApply.css" />
</head>
<body>
	<div class="getCashWrap">
		<input type="hidden" id="userId" value="${sessionScope.fontUser.id }">
		<strong class="comStrongTit">我的提现</strong>
		<div class="comAddDiv firstMargT">
			<p>选择小区：</p>
			<p>
				<input id="districtInp" type="hidden">
				<input id="balanceInp" type="hidden">
				<span id="selXiaoquSp" class="spNoSelColor" ontouchend="selXiaoQu()">请选择小区</span>
			</p>
		</div>
		<div class="comAddDiv">
			<p>提现金额： <em>每天只可提现一次</em></p>
			<p>
				<input type="number" id="tixianInp" name="tixianInp" placeholder="请输入提现金额"/>
			</p>
			<b id="balanceMax"></b>
		</div>
		<div class="comAddDiv">
			<button ontouchend="getCash()">提现</button>
		</div>
	</div>
	<div class="toast-wrap">
        <span class="toast-msg"></span>
    </div> 
    <div class="loadingDiv">
		<div class="loadEffect">
	        <span></span>
	        <span></span>
	        <span></span>
	        <span></span>
	        <span></span>
	        <span></span>
	        <span></span>
	        <span></span>
		</div>
		<p>正在加载...</p>
	</div>
	<div id="xiaoquData" class="comSelDisData">
		<div id="xiaoquDataDiv" class="comListDiv">
			<ul id="xiaoquDataUl" class="scrollerWrap"></ul>
		</div>
		<p class="backP" onclick="goBack()"><span></span>返回</p>
	</div>
	<!-- footer -->
	<jsp:include page="../../down.jsp">
		<jsp:param value="4" name="cmd"/>
	</jsp:include>
	<script src="${pageContext.request.contextPath }/weChat/jsPlugin/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath }/weChat/jsPlugin/iscroll.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath }/weChat/jsPlugin/tipInfo.js" type="text/javascript"></script>
</body>
</html>
	<script type="text/javascript">
		$(function(){
			$(".comSelDisData").height($(window).height());
			$(".comListDiv").height($(window).height() - 36);
		});
		document.addEventListener('touchmove', function (e) { e.preventDefault(); }, {passive:false});
		function selXiaoQu(){
			$(".loadingDiv").show();
			$.ajax({
				method:'post',
				url : "${pageContext.request.contextPath}/weChat/QueryOperatorArea.htm",
				success : function(data) {/* 子类的数据 */
					$(".loadingDiv").hide();
					var data = eval("(" + data + ")");
					var strCity = "";
					for (var i = 0; i < data.data.length; i++) {
						strCity += "<li attrId='" + data.data[i].id + "' attrBalance='"+ data.data[i].balance +"' class='ellip' onclick='selThisArea(this)'>" + data.data[i].name + "</li>";
					}
					$("#xiaoquDataUl").html(strCity);
					$("#xiaoquData").css({
						"-webkit-transform":"translateX(0px)",
						"transform":"translateX(0px)"
					});
					wrapScroll('xiaoquDataDiv');
				}
			});
		}
		function goBack(){
			$("#xiaoquData").css({
				"-webkit-transform":"translateX("+ $(window).width() +"px)",
				"transform":"translateX("+ $(window).width() +"px)"
			});
		}
		function selThisArea(obj){
			$("#districtInp").val($(obj).attr("attrid"));
			$("#balanceInp").val($(obj).attr("attrbalance"));
			$("#balanceMax").html("可提现金额" + $(obj).attr("attrbalance") + "元");
			$("#selXiaoquSp").html($(obj).html()).removeClass("spNoSelColor");
			$("#xiaoquData").css({
				"-webkit-transform":"translateX("+ $(window).width() +"px)",
				"transform":"translateX("+ $(window).width() +"px)"
			});
		}
		function getCash(){
			var districtName = $("#selXiaoquSp").html();
			var tixianInp=$("#tixianInp").val();
			var districtId = $("#districtInp").val();
			var userId=$("#userId").val();
			var balance = $("#balanceInp").val();
			if(districtName == "请选择小区"){
				toast("请先选择您要提现的小区名字");
			}else{
				if(balance <= 0){
					toast("您当前的可提现金额为0元，暂不能提现");
				}else{
					if( tixianInp== ""){
						toast("请输入提现金额");
					}else{
						if(tixianInp == 0){
							toast("提现金额最小应大于0元");
						}else{
							if(tixianInp > balance){
								toast("提现金额不能大于可提现金额");
							}else{
								$.ajax({
									method:'post',
									//url:'${pageContext.request.contextPath}/weChat/checkIsOne.htm?id='+userId,
									url:'${pageContext.request.contextPath}/weChat/carryMoney.htm?id=' + userId,
									data:{
										area : districtId,
										money : balance
									},
									success:function(data){
										var data=eval('(' + data + ')');
										console.log(data)
										if(data.state == '400'){
											toast(data.msg);
											return;
										}else if(data.state == '200'){
											$.ajax({
												method:'post',
												url:'${pageContext.request.contextPath}/weChat/deposit.htm?balance='+tixianInp,
												success:function(data){
													 setTimeout(function(){
														 alert("提现申请发送成功,请耐心等待审核");
												        },1000);
													window.location.href="${pageContext.request.contextPath}/weChat/settingCount.htm";
												}		
											})
										}
									}
								})
							}
						}
					}
				}
			}
		}
		</script>