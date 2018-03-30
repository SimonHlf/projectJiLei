<!DOCTYPE html>
<%@page pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title>运营统计</title>
		<meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0"/>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/weChat/css/reset.css"/>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/weChat/Module/setting/css/operationStatis.css"/>
		<link href="${pageContext.request.contextPath}/weChat/css/mobiscroll.core-2.5.2.css" rel="stylesheet" type="text/css" />
		<link href="${pageContext.request.contextPath}/weChat/css/mobiscroll.animation-2.5.2.css" rel="stylesheet" type="text/css" />
		<link href="${pageContext.request.contextPath}/weChat/css/mobiscroll.android-ics-2.5.2.css" rel="stylesheet" type="text/css" />
	</head>
	<body class="bodyPadBot">
		<div class="operStatis">
			<strong class="comStrongTit">运营统计</strong>
			<p class="statAreaName">
				<c:if test="${area.state=='1'}"><span>已审核</span></c:if>
				<c:if test="${area.state=='0'}"><span>未审核</span></c:if>
				<em id ="areaName">${area.name}</em>
				<a href="javascript:void(0)" ontouchend="comEditShowAlert('areaInfo')">查看详情</a>
			</p>
			<div class="timePart">
				<div class="startDiv">
					<span>起：</span>
					 <input id="startTimeInp" name="startTime" type="text" placeholder="请选择起始时间">
				</div>
				<div class="endDiv">
					<span>至：</span>
					<input id="endTimeInp" name="endTime" type="text" placeholder="请选择截止时间">
				</div>
				<div style="margin-top: 10px;">
					<input id="queryId" type="hidden" value="2"/>
					<button id="select" onclick="select()" class="comBtn sear">查询</button>
					<button class="comBtn" style="display:none;">下载</button>
				</div>
			</div>
			<div class="tabBtnDiv">
				<a href="javascript:void(0)" class="active" onclick="showRectory(this,'chargeRec')">充值记录<span></span></a>
				<a href="javascript:void(0)" onclick="showRectory(this,'eleRec')">充电记录<span></span></a>
				<a href="javascript:void(0)" onclick="showRectory(this,'kq')">跨区收益<span></span></a>
			</div>
			<div class="listRecDiv">
				<span style="display: none" id="countId">${list.get(0).id}</span>
				<!-- 充值记录 -->
				<div class="comList chargeRecList" style="display: block;">
					<ul id="ulList_chargRec" class="clearfix"></ul>
				</div>
				<!-- 充电记录 -->
				<div class="comList chargeEleList">
					<ul id="ulList_eleRec" class="clearfix"></ul>
				</div>
				<!-- 跨区收益 -->
				<div class="comList kqList">
					<ul id="ulList_kq" class="clearfix"></ul>
				</div>
			</div>
		</div>
		<div class="layer"></div>
		<div class="areaInfo">
			<p class="innerInfo">保证金金额账户：${list.get(0).balance}元</p>
			<p>小区累积充值：${list.get(0).sumMoney}元</p>
			<p>小区累积用电度数： ${list.get(0).sumKWH}度</p>
			<p>基本账户累积消费：${list.get(0).jbMoney}元</p>
			<p>赠送账户累积消费：${list.get(0).amount}元</p>
			<p>跨区收入：${list.get(0).crossSy}元</p>
			<p>跨区支出： ${list.get(0).crossZc}元</p>
			<p>小区累积用户：${list.get(0).coumtPerson}户</p>
			<p>小区当前用户：${list.get(0).countUser}户</p>
			<button ontouchend="closeAlert($('.areaInfo'))">确定</button>
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
		<!-- footer -->
		<jsp:include page="../../down.jsp">
			<jsp:param value="4" name="cmd" />
		</jsp:include>
		<script src="${pageContext.request.contextPath}/weChat/jsPlugin/jquery.min.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/weChat/jsPlugin/mobiscroll.core-2.5.2.js"></script>
		<script src="${pageContext.request.contextPath}/weChat/jsPlugin/mobiscroll.core-2.5.2-zh.js"></script>
	
		<script src="${pageContext.request.contextPath}/weChat/jsPlugin/mobiscroll.datetime-2.5.1.js"></script>
		<script src="${pageContext.request.contextPath}/weChat/jsPlugin/mobiscroll.datetime-2.5.1-zh.js"></script>
		<!-- 可根据自己喜好引入样式风格文件 -->
		<script src="${pageContext.request.contextPath}/weChat/jsPlugin/mobiscroll.android-ics-2.5.2.js"></script>
		<script src="${pageContext.request.contextPath}/weChat/jsPlugin/initCalender.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath }/weChat/jsPlugin/tipInfo.js" type="text/javascript"></script>
		<script type="text/javascript">
			$(function(){
				initDate("startTimeInp");
				initDate("endTimeInp");
				chargeAccRecList();
			});
			//document.addEventListener('touchmove', function (e) { e.preventDefault(); }, {passive:false});
			function showRectory(obj,options){
				$(".tabBtnDiv a").removeClass('active');
				$(".comList").hide();
				$(obj).addClass('active');
				$(".loadingDiv").show();
				if(options == 'chargeRec'){//充值记录
					$(".chargeRecList").show();
					chargeAccRecList();
				}else if(options == 'eleRec'){//充电记录
					$(".chargeEleList").show();
					chargeEleRecList();
				}else{//跨区收益
					$(".kqList").show();
					crossArea();
				}
			}
			function showDetailCon(parObj,options){
				var oList=document.getElementById(parObj);
				var aLi=oList.getElementsByTagName("li");
				for(var i=0;i<aLi.length;i++){
					aLi[i].index=i;
					aLi[i].onclick=function(){
						for(var i=0;i<aLi.length;i++){
							if(i!=this.index){
								if(options == "chargeAcc"){//充值记录
									$(".detailDiv_acc").eq(i).slideUp();
									$(".triBg_acc").eq(i).removeClass("botTriBg_acc");
								}else if(options == "chargeEle"){//充电记录
									$(".detailDiv").eq(i).slideUp();
									$(".triBg").eq(i).removeClass("botTriBg");
								}else if(options == "kqIncome"){//跨区收益
									$(".detailDiv_kq").eq(i).slideUp();
									$(".triBg_kq").eq(i).removeClass("botTriBg_kq");
								}
								aLi[i].className='';
							}else{
								if(options == "chargeAcc"){
									$(".triBg_acc").eq(i).addClass("botTriBg_acc");
								}else if(options == "chargeEle"){
									$(".triBg").eq(i).addClass("botTriBg");
								}else if(options == "kqIncome"){//跨区收益
									$(".triBg_kq").eq(i).addClass("botTriBg_kq")
								}
							}
						}
						if( this.className == '' ){
							if(options == "chargeAcc"){//充值记录
								$(".detailDiv_acc").eq(this.index).slideDown();
								$(".triBg_acc").eq(this.index).addClass("botTriBg_acc");
							}else if(options == "chargeEle"){//充电记录
								$(".detailDiv").eq(this.index).slideDown();
								$(".triBg").eq(this.index).addClass("botTriBg");
							}else if(options == "kqIncome"){//跨区收益
								$(".detailDiv_kq").eq(this.index).slideDown();
								$(".triBg_kq").eq(this.index).addClass("botTriBg_kq");
							}
							this.className = 'active';
						} else {
							if(options == "chargeAcc"){//充值记录
								$(".detailDiv_acc").eq(this.index).slideUp();
								$(".triBg_acc").eq(this.index).removeClass("botTriBg_acc");
							}else if(options == "chargeEle"){//充电记录
								$(".detailDiv").eq(this.index).slideUp();
								$(".triBg").eq(this.index).removeClass("botTriBg");
							}else if(options == "kqIncome"){//跨区收益
								$(".detailDiv_kq").eq(this.index).slideUp();
								$(".triBg_kq").eq(this.index).removeClass("botTriBg_kq");
							}
							this.className = '';
						}
					}
				}
			}
			function select(){
				var id = $("#queryId").val();
				var start = $("#startTimeInp").val();
				var end = $("#endTimeInp").val();
				if(start == ""){
					toast("请选择起始时间")
					return false;
				}else if(end == ""){
					toast("请选择结束时间");
					return false;
				}else{
					if(end < start){
						toast("结束时间不能小于开始时间!");
						return false;
					}else{
						if(id==1){//充电记录
							chargeEleRecList();
						}
						if(id==2){//充值记录
							chargeAccRecList();
						}
						if(id==3){//跨区收益
							crossArea()
						}
					}
				}
			}
			//充电记录
			function chargeEleRecList(){
				var id = $("#countId").text();
				var start = $("#startTimeInp").val();
				var end = $("#endTimeInp").val();
				$("#queryId").val(1);
				$.ajax({
					url:"/quick_fill/weChat/querByAreaElectric.htm",
					type:"post",
					data:{"areaId":id,"start":start,"end":end},
					dataType:"json",
					success:function(result){
						if(result.data.length > 0){
							$(".loadingDiv").hide();
							var html = "";
							for(var i=0;i<result.data.length;i++){
								html += '<li><div class="innerPar clearfix">';
								html += '<span class="radiusSpan"></span>';
								html += '<p>用户编号：'+result.data[i].account+'</p>';
								html += '<p>充电<em>'+result.data[i].jbMoney+'</em>元</p>';
								html += '<p><span class="triBg"></span></p>';
								html += '<div class="detailDiv">';
								html += '<span>充电时长：<b>'+result.data[i].time+'</b>分钟</span>';
								html += '<span>充电收益：<b>'+result.data[i].jbMoney+'</b>元</span>';
								html += '<span>充电消耗：'+result.data[i].charge_kwh+'KW/h</span>';
								html += '<span>充电端口：'+result.data[i].port+'</span>';
								html += '<span>订单号:'+result.data[i].order_num+'</span>'
								html += '<span>交易完成：'+result.data[i].add_time+'</span>';
								html += '</div></div>';
								html += '</li>'
							}
							document.getElementById('ulList_eleRec').innerHTML = html;
							showDetailCon('ulList_eleRec','chargeEle');
						}else{
							$("#ulList_eleRec").html("<div class='noDataDiv'><span></span><p>暂无充电记录</p></div>");
						}
					}
				})
			}
			//充值记录
			function chargeAccRecList(){
				var id = $("#countId").text();
				var start = $("#startTimeInp").val();
				var end = $("#endTimeInp").val();
				$("#queryId").val(2)
				if(id.length<=0){
					toast("参数错误");
					return false;
				}
				$.ajax({
					url:"/quick_fill/weChat/queryByChargeList.htm",
					type:"post",
					data:{"areaId":id,"start":start,"end":end},
					dataType:"json",
					success:function(result){
						$(".loadingDiv").hide();
						if(result.data.length > 0){
							var html = "";
							for(var i =0;i<result.data.length;i++){
								html += '<li><div class="innerPar clearfix">';
								html += '<span class="radiusSpan"></span><p>用户编号：'+result.data[i].account+'</p>';
								html += '<p>充值<em>'+result.data[i].balance+'</em>元</p>';
								html += '<p><span class="triBg_acc"></span></p>';
								html += '<div class="detailDiv_acc">';
								html += '<span>实际到账：<b>'+result.data[i].balance+'</b>元</span>';
								html += '<span>赠送金额：<b>'+result.data[i].give_money+'</b>元</span>';
								html += '<span>交易完成：'+result.data[i].add_time+'</span>';
								html += '<span>订单ID：'+result.data[i].order_no+'</span>';
								html += '</div></div></li>';
							}
							document.getElementById('ulList_chargRec').innerHTML = html;
							showDetailCon('ulList_chargRec','chargeAcc');
						}else{
							$("#ulList_chargRec").html("<div class='noDataDiv'><span></span><p>暂无充值记录</p></div>");
						}
					}
				});
			}
			//跨区收益
			function crossArea(){
				var start = $("#startTimeInp").val();
				var end = $("#endTimeInp").val();
				var id = $("#countId").text();
				$("#queryId").val(3);
				if(id.length<=0){
					toast("参数错误");
					return false;
				}
				$.ajax({
					url:"crossArea.htm",
					type:"post",
					data:{"id":id,"start":start,"end":end},
					dataType:"json",
					success:function(result){
						$(".loadingDiv").hide();
						if(result.data.length > 0){
							var html = "";
							for(var i =0;i<result.data.length;i++){
								html += '<li><div class="innerPar clearfix">';
								html += '<span class="radiusSpan"></span><p>用户编号：'+result.data[i].account+'</p>';
								html += '<p>跨区<em>'+result.data[i].amount+'</em>元</p>';
								html += '<p><span class="triBg"></span></p>';
								html += '<div class="detailDiv">';
								html += '<span>交易完成：'+result.data[i].add_time+'</span>';
								html += '<span>订单ID：'+result.data[i].order_num+'</span>';
								html += '</div></li>';
							}
							document.getElementById('ulList_kq').innerHTML = html;
							showDetailCon('ulList_kq','kqIncome');
						}else{
							$("#ulList_kq").html("<div class='noDataDiv'><span></span><p>暂无跨区收益</p></div>");;
						}
					}
				})
			}
		</script>
	</body>
</html>
