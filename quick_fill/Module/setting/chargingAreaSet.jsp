<!DOCTYPE html>
<%@page pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="v" tagdir="/WEB-INF/tags"%>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0"/>
		<title>充电区设置</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/weChat/css/reset.css"/>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/weChat/Module/setting/css/chargingAreaSet.css"/>
	</head>
	<body>
		<div class="chargingSet">
			<strong class="comStrongTit">运营设备-充电区域</strong>
			<p class="areaName">${region.name }</p>
			<input id="regId" value="${region.id }" type="hidden">
			<ul class="listChargingArea">
			<c:forEach items="${regionAreaList }" var="regionArea">
				<li>
					<p>${regionArea.name}</p>
					<span class="editSpan" ontouchend="showAlert(this,'editConfirm','fixChargeAreaInp','regionAreaInp',true)"></span>
					<input type="hidden" value="${regionArea.id }">
					<a href="${pageContext.request.contextPath }/weChat/rateSetting.htm?reArId=${regionArea.id }">费率设置</a>
				</li>
			</c:forEach>
			</ul>
			<div class="addAreaBtn">
				<button ontouchend="comEditShowAlert('addConfirm')">添加充电区</button>
			</div>
		</div>
		<div class="layer"></div>
		<div class="toast-wrap">
	        <span class="toast-msg"></span>
	    </div> 
		<div class="confirmDiv addConfirm">
	    	<p style="font-size: 0.14rem;margin-top:20px;margin-bottom: 10px;">提示：未为了防止误删导致的灾难性事故，充电区域一旦添加就不能删除</p>
	    	<p><input class="addInp" id="areaName" type="text" placeholder="请输入充电区域名称"/></p>
	    	<button class="comTwoBtn twoBtn_cancel" ontouchend="closeAlert($('.addConfirm'))">取消</button>
			<button class="comTwoBtn twoBtn_sure" ontouchend="addRegionArea()">确定</button>
	    </div>
	    <div class="confirmDiv editConfirm">
	    	<p style="font-size: 0.14rem;margin-top:20px;margin-bottom: 10px;">修改充电区域名称</p>
	    	<p><input id="regionAreaInp" class="addInp" type="text" placeholder="请输入充电区域名称"/></p>
	    	<input id="fixChargeAreaInp" type="hidden">
	    	<button class="comTwoBtn twoBtn_cancel" ontouchend="closeAlert($('.editConfirm'))">取消</button>
			<button class="comTwoBtn twoBtn_sure" ontouchend="editRegionAreaName()">确定</button>
	    </div>
		<!-- footer -->
		<jsp:include page="../../down.jsp">
			<jsp:param value="4" name="cmd"/>
		</jsp:include>
		<script src="${pageContext.request.contextPath }/weChat/jsPlugin/jquery.min.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath }/weChat/jsPlugin/tipInfo.js" type="text/javascript"></script>
		<script>
		function editRegionAreaName(){
			var fixChargeAreaInp=$("#fixChargeAreaInp").val();
			var regionAreaName=$("#regionAreaInp").val();
			//console.log(regionAreaName + "=====")
			var regId=$("#regId").val();
			if(regionAreaName == ""){
				toast("请输入充电区域名称");
				return;
			}
			$.ajax({
				method:'post',
				url:'${pageContext.request.contextPath}/weChat/editName.htm',
				data:{
					id:fixChargeAreaInp,
					name:regionAreaName,
					regId:regId
				},
				success:function(data){
					toast("充电区名称修改成功");
					$(".listChargingArea").html(data);
					closeAlert($('.editConfirm'));
				}
			})
		}
		function addRegionArea(){
			var regId=$("#regId").val();
			var name=$("#areaName").val();
			if(name == ""){
				toast("请输入充电区域名称");
				return;
			}
			$.ajax({
				method:'post',
				url:'${pageContext.request.contextPath}/weChat/addRegionArea.htm',
				data:{
					regId:regId,
					name:name
				},
				success:function(data){
					toast("添加充电区成功");
					$(".chargingSet").html(data);
					closeAlert($('.addConfirm'))
				}
			}) 
		}
		</script>
	</body>
</html>
