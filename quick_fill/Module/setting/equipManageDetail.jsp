<!DOCTYPE html>
<%@page pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0"/>
		<title>设备管理</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/weChat/css/reset.css"/>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/weChat/Module/setting/css/equipManage.css"/>
	</head>
	<body>
		<div class="equipment">
			<strong class="comStrongTit">设备管理</strong>
			<p class="areaName">${region.name }-${regionArea.name }</p>
			<input type="hidden" id="regId" value="${region.id }">
			<input type="hidden" id="reArId" value="${regionArea.id }">
			<div class="equipNote clearfix">
				<span class="fl">注：</span>
				<ul class="noteUl fl">
					<li class="connectNet">
						<span></span>
						<p>充电桩已联网</p>
					</li>
					<li class="loseNet">
						<span></span>
						<p>充电桩已断网</p>
					</li>
					<li class="portFree">
						<span></span>
						<p>端口空闲</p>
					</li>
					<li class="usePort">
						<span></span>
						<p>端口占用</p>
					</li>
					<li class="badPort">
						<span></span>
						<p>端口故障</p>
					</li>
				</ul>
				<!-- a class="addChargeBtn" href="javascript:void(0)" onclick="addDW()">添加充电桩</a -->
				<a class="addChargeBtn" href="javascript:void(0)" onclick="comEditShowAlert('addChargeArea')">添加充电桩</a>
			</div>
			<div class="listEquip">
				<ul id="addli">
				<c:forEach items="${list }" var="equipment">
                   <li class="listConnectLi">
						<span></span>
						<p>${equipment.num }</p>
						<button onclick="delEqu('${equipment.qid}',${region.id })"><em></em></button>
					</li>				
				</c:forEach>
				</ul>
			</div>
		</div>
		<div class="layer"></div>
		<!-- 添加充电桩弹窗 -->
		<div class="comEditDiv addChargeArea">
			<div class="comInnerDiv">
				<span>编<em></em>号：</span>
				<input type="text" class="comTxtInp" id="chargeNumInp" placeholder="请输入充电桩编号"/>
			</div>
			<div class="addTwoBtnDiv">
				<button class="comTwoBtns tBt_cancel" onclick="closeAlert($('.addChargeArea'))">取消</button>
				<button class="comTwoBtns tBt_sure" onclick="addEqu()">保存</button>
			</div>
		</div>
		<!-- confirm 提现 -->
	    <!-- div class="addConfirm">
	    	<p>确认添加这台充电桩？</p>
	    	<button class="comTwoBtn twoBtn_cancel" onclick="closeAlert($('.addConfirm'))">取消</button>
			<button class="comTwoBtn twoBtn_sure" onclick="addChargeEquip()">确定</button>
	    </div -->
	    <div class="confirmDiv remarkDiv">
	    	<p>位置及其他备注信息</p>
	    	<div class="remarkInfo">1号楼架空层出入口处</div>
	    	<button class="comTwoBtn twoBtn_sure" onclick="closeAlert($('.remarkDiv'))" style="margin-top: 10px;">确定</button>
	    </div>
	    <div class="toast-wrap">
	       <span class="toast-msg"></span>
	    </div> 
		<!-- footer -->
		<jsp:include page="../../down.jsp">
		<jsp:param value="4" name="cmd"/>
	</jsp:include>
		<script src="${pageContext.request.contextPath }/weChat/jsPlugin/jquery.min.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath }/weChat/jsPlugin/tipInfo.js" type="text/javascript"></script>
		<script type="text/javascript">
			$(function(){
				//toast("不能重复添加充电桩")
			});
			
			//添加充电桩
			function addDW(){
				html = "";
				html += '<li class="listConnectLi">';
				html += '<span></span>'
				html += '<input />'
				html += '<button onclick="delEqu()"><em class="delIcon"></em></button>'
			/* 	html += '<button onclick="addEqu()">保存</button>' */
				html += '</li>'
				$("#addli").append(html);
			}
			//删除充电桩
			function delEqu(qid,regId,reArId){
				/* window.location.href="${pageContext.request.contextPath}/weChat/delEqu.htm?qid="+qid+"&regId="+regId+"&reArId="+reArId; */
			 	$.ajax({
					method:'post',
					url:'${pageContext.request.contextPath}/weChat/delEqu.htm',
					data:{
						qid:qid,
						regId:regId,
						reArId:reArId
					},
				    success:function(data){
				    	alert("删除成功");
				    	$(".listEquip").html(data);
				    },error:function(data){
				    	alert("删除失败");
				    }
				}) 
			}
			//添加充电桩
			function addEqu(){
				var regId=$("#regId").val();
				var num=$("#chargeNumInp").val();
				var reArId=$("#reArId").val();
				if(num == null || num == ''){
					alert("请输入编号");
					return false;
				}if(isNaN(num)){
					alert("请输入正确格式的编号");
				}
				$.ajax({
				method:'post',
				url:'${pageContext.request.contextPath}/weChat/checkEquNum.htm?num'+num,
			    success:function(data){
			    	var data=('('+data+')');
			    	if(data.state == '400'){
			    		alert(data.msg);
			    	}else if(data.state == '200'){
			    		window.location.href="${pageContext.request.contextPath}/weChat/addEqu.htm?regId="+regId+"&&num="+num+"&&reArId="+reArId; 
			    	}
			    }
				})
				
				
			 	/* $.ajax({
					method:'post',
					url:'${pageContext.request.contextPath}/weChat/delEqu.htm?regId='+regId,
					data:{
						num:num
					},
					success:function(data){
						alert("添加成功");
						toast("添加成功");
						$(".listEquip").html(data);
					},error:function(data){
						alert("添加失败");
					}
				})  */
			}
		</script>
	</body>
</html>
