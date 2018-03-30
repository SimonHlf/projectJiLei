<!DOCTYPE html>
<%@page pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="v" tagdir="/WEB-INF/tags"%>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0"/>
		<title>费率查看</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/weChat/css/reset.css"/>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/weChat/Module/setting/css/checkRate.css"/>
		<link href="${pageContext.request.contextPath }/weChat/css/mobiscroll.core-2.5.2.css" rel="stylesheet" type="text/css" />
		<link href="${pageContext.request.contextPath }/weChat/css/mobiscroll.animation-2.5.2.css" rel="stylesheet" type="text/css" />
		<link href="${pageContext.request.contextPath }/weChat/css/mobiscroll.android-ics-2.5.2.css" rel="stylesheet" type="text/css" />
	</head>
	<body class="bodyPadBot">
		<div class="checkRate">
			<strong class="comStrongTit">费率查看</strong>
			<p class="areaName">${region.name }</p>
			
			<p class="comSetP">
				<span class="comSetTit">充值优惠</span>
				<label>
					<input type="checkbox" />
					<span class="checkSpan checkSpan_act"><em></em></span>
				</label>
			</p>
			<div class="timePart">
				<div class="startDiv">
					<span>起：</span>
					 <input style="color:#000;" id="startTimeInp" disabled name="startTime" type="text" value="${createState }"/>
				</div>
				<div class="endDiv">
					<span>至：</span>
					<input style="color:#000;" id="endTimeInp" disabled name="endTime" type="text" value="${endState }"/>
				</div>
			</div>
			<div class="comSetP">
				<span class="comSetTit">和固定充值金额关联</span>
				<ul>
				<c:forEach items="${roList }" var="ro">
					<li>
						充值<input style="color:#000;" class="numInp" type="number" disabled value="${ro.balance_order }"/>元<span></span>赠送<input style="color:#000;" class="numInp" type="number" disabled value="${ro.balance_give }"/>元
					</li>
				</c:forEach>
				</ul>
			</div>
			<div class="listRateCheck">
				<ul class="listChargingArea">
				<c:forEach items="${regionAreaList }" var="regionArea">
				<li>
						<p>${regionArea.name}</p>
						<a href="${pageContext.request.contextPath }/weChat/checkRateDetail.htm?reArId=${regionArea.id }">费率查看</a>
					</li>
				</c:forEach>
				</ul>
			</div>
			<div class="backDiv">
				<button onclick="goBack()">返回</button>
			</div>
		</div>
		<!-- footer -->
		<jsp:include page="../../down.jsp">
		<jsp:param value="4" name="cmd"/>
	</jsp:include>
		<script src="${pageContext.request.contextPath }/weChat/jsPlugin/jquery.min.js"></script>
		<script src="${pageContext.request.contextPath }/weChat/jsPlugin/mobiscroll.core-2.5.2.js"></script>
		<script src="${pageContext.request.contextPath }/weChat/jsPlugin/mobiscroll.core-2.5.2-zh.js"></script>
	
		<script src="${pageContext.request.contextPath }/weChat/jsPlugin/mobiscroll.datetime-2.5.1.js"></script>
		<script src="${pageContext.request.contextPath }/weChat/jsPlugin/mobiscroll.datetime-2.5.1-zh.js"></script>
		<!-- 可根据自己喜好引入样式风格文件 -->
		<script src="${pageContext.request.contextPath }/weChat/jsPlugin/mobiscroll.android-ics-2.5.2.js"></script>
		<script type="text/javascript">
			$(function(){
			});
			function initDate(obj,startYear){
				var opt = {
			        preset: 'date', //日期
			        theme: 'android-ics light', //皮肤样式
			        display: 'modal', //显示方式 
			        mode: 'scroller', //日期选择模式
			        dateFormat: 'yy-mm-dd', // 日期格式
			        setText: '确定', //确认按钮名称
			        cancelText: '取消',//取消按钮名籍我
			        dateOrder: 'yymmdd', //面板中日期排列格式
			        dayText: '日', monthText: '月', yearText: '年', //面板中年月日文字
			        //endYear:endYear //结束年份
			    };
			    $("#"+obj).mobiscroll(opt).date(opt);
			}
			
			function goBack(){
				window.location.href="${pageContext.request.contextPath}/weChat/mySmallArea.htm";
			}
		</script>
	</body>
</html>
