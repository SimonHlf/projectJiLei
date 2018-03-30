<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8">
		<title>收货地址</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/web/Module/personalCen/css/deliveryAddress.css"/>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/web/css/layer.css"/>
	</head>
	<body>
		<div id="content">
		<%@ include file="../../head.jsp"%>  
		<!-- 个人中心内容 -->
		<div class="personalCenCon clearfix w1100">
			<%@ include file="personalHead.jsp"%>  
			<div class="rightPersonal fr">
				<strong class="rightTit"><span></span>收货地址</strong>
				<div class="rightCon">
					<div class="deliAddWrap">
						<div class="addAdd">
							<input type='hidden' name="count" id="count" value="${count}">
							<a href="javascript:void(0)" onclick="addNewAddress()">新增收货地址</a>
							<span>您已创建<em>${count}</em>个地址，最多可以创建<em>10</em>个</span>
						</div>
						<div class="listAddress">
							<ul>
								<c:forEach items="${list}" var="c">
								<li>
									<!-- 默认tag -->
									<c:if test="${c.defaultStatus==1}">
										<span class="defaultAdd">默认地址</span>
									</c:if>
									<c:if test="${c.defaultStatus==0}">
										<span class="defaultAdd" onclick="setDefault(${c.id})">设为默认地址</span>
									</c:if>
									
									<div class="comAddressDiv">
										<span class="addTit">收货人：</span>
										<p>${c.condigneeName}</p>
									</div>
									<!-- 引入地区插件 -->
									<div class="comAddressDiv">
										<span class="addTit">所在地区：</span>
										<p>${c.provinceName}${c.cityName}${c.areaName}</p>
									</div>
									<div class="comAddressDiv">
										<span class="addTit">详细地址：</span>
										<p>${c.liveAddress}</p>
									</div>
									<div class="comAddressDiv">
										<span class="addTit">手机号码：</span>
										<p>${c.telephone}</p>
									</div>
									<div class="setFunDiv">
										<a class="editAddBtn" href="javascript:void(0)" onclick="modifyAddress(${c.id})">编辑</a>
										<a class="delAddBtn" href="javascript:delAddress(${c.id})">删除</a>
									</div>
								</li>
								</c:forEach>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="layer"></div>
		<!-- 新增收货地址 -->
		<div id="showAddNewDiv" class="setFixAddBox">
			<div class="addInfoHead">
				<strong class="setFixTit">新增收货地址</strong>
				<span class="closeAddWin" onclick="closeFixWin()"></span>
			</div>
			<div class="fixAddForm">
				<div class="fixEditBox">
					<!-- 新增为空 修改为当前地址id -->
					 <form id="adddeliver"> 
					<input type="hidden" id="usaId">
					<div class="comEditFixBox">
						<em>
							<i>*</i>
							收货人姓名：
						</em>
						<input type="text" name="condigneeName" id="buyer_Name" class="comInpTxt inpWid1" placeholder="请填写收货人姓名" value="">
						<span id="writeNames" class="addFixInfos">请输入收货人姓名</span>
						<span id="succWriteNa" class="comRightIcon"></span>
					</div>
					<div class="comEditFixBox">
						<em>
							<i>*</i>
						</em>
						<div id="distpicker" style="display: inline-block;">
							所<span class="blank"></span>在<span class="blank"></span>地<span class="blank"></span>区：
							<select id="province"  name="provinceId" onchange="pdsboom1(this.options[this.options.selectedIndex].value)"> 
								<option value="">请选择省</option>
								<c:forEach items="${provinces}" var="p">${p.regionid}
									<option value="${p.regionid}">${p.regionname}</option>
								</c:forEach>
							</select>
							<select id="city" name="cityId"></select>
							<select id="district" name="areaId"></select>
						</div>
						<span id="districtSpan" class="addFixInfos"></span>
						<span id="succDistrict" class="comRightIcon"></span>
					</div>
					<div class="comEditFixBox">
						<em>
							<i>*</i>
							详<span class="blank"></span>细<span class="blank"></span>地<span class="blank"></span>址：
						</em>																
						<input type="text" name="liveAddress" id="detailAddress" class="comInpTxt inpWid2" placeholder="建议您如实填写详细收货地址，例如街道名称、门牌号码" value="">
						<span id="addressTip" class="addFixInfos">请输入您的详细地址</span>
						<span id="succAddress" class="comRightIcon"></span>
					</div>
					<div class="comEditFixBox">
						<em>
							<i>*</i>
							联<span class="blank"></span>系<span class="blank"></span>电<span class="blank"></span>话：
						</em>
						<input type="text" name="telephone" id="telPhone" class="comInpTxt inpWid1" maxlength="11" placeholder="请填写您的手机号码" value="">
						<span id="phoneTips" class="addFixInfos">请填写您的手机号码</span>
						<span id="succPhone" class="comRightIcon"></span>
					</div>
					</form>
					<a href="javascript:void(0)" class="saveInfo" onclick="saveAddress()">保存收货地址</a>
					<a id="cancelUpdate" href="javascript:void(0);" onclick="closeFixWin()">取消</a>
				</div>
			</div>
		</div>
		<div id="showEditJsp" class="setFixAddBox"></div>
		</div>
		<%@ include file="../../foot.jsp"%>  
		<script src="${pageContext.request.contextPath }/web/js/jquery-1.7.2.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="${pageContext.request.contextPath }/web/js/distpicker.data.js" type="text/javascript" charset="utf-8"></script>
		<script src="${pageContext.request.contextPath }/web/js/distpicker.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/web/js/layer.js"></script>
		<script type="text/javascript">
			
		$(function(){
			
		});
		
		function getId(id){
			return document.getElementById(id);
		}
		//新增收货地址
		function addNewAddress(){
			var count=$("#count").val();
			if(count<10){
				//新增地址时清空usaId的value
				$("#usaId").val("");
				$(".layer").show();
				$(".setFixTit").html("新增收货地址");
				$("#showAddNewDiv").show().css({"top":parseInt(($(window).height() - $("#showAddNewDiv").height())/2)}).animate({left:"50%"});
				/* $('#distpicker').distpicker('destroy'); */
				/* $('#distpicker').distpicker('reset', true); */
				saveFixInfoCheck();
			}else{
				 layer.msg("最多可以创建10个收货地址，您已经创建"+count+"个了");
			}
		}
		//修改地址
		function modifyAddress(id){
			$.ajax({
			    type: 'post',  
			    data:{id:id},
			    url: "${pageContext.request.contextPath }/web/shop/consigneeApi/toedit.htm",
			    success: function (html) {
			    	$(".layer").show();
			    	$("#showEditJsp").show().css({"top":parseInt(($(window).height() - $("#showEditJsp").height())/2)}).animate({left:"50%"}).html(html);
			    	saveFixInfoCheck();
			    }
			});
		}
		
		//修改收货地址
		function editAddress(){
			var buyerName = getId("buyer_Name2").value;
			var province = getId("province2").value;
			var city = getId("city2").value;
			var areaVal = getId("district2").value;
			var detailAddress = getId("detailAddress2").value;
			var mobile = getId("telPhone2").value;
			var id = getId("id").value;
		 	if(buyerName == ""){
				$("#buyer_Name").focus();
				$("#writeNames").show().html("收货人姓名不能为空");
				return false;
			}else if(buyerName.length > 8){
				$("#buyer_Name").focus();
				$("#writeNames").show().html("收货人姓名长度不能超过8个字符");
				return false;
			}else if(!(/^[\u4E00-\u9FA5]+$/).test(buyerName)){
				$("#buyer_Name").focus();
				$("#writeNames").show().html("收货人姓名是应为中文姓名");
				return false;
			}else if(province == ""){
				$("#districtSpan").show().html("请选择地区");
				return false;
			}else if(detailAddress==""){
				$("#detailAddress").focus();
				$("#addressTip").show().html("请填写您的详细收货地址");
				return false;
			}else if(mobile == ""){
				$("#telPhone").focus();
				$("#phoneTips").show().html("请填写您的手机号码");
				return false;
			}else if(!(/^1[3|4|5|7|8][0-9]\d{4,8}$/).test(mobile)){
				$("#telPhone").focus();
				$("#phoneTips").show().html("手机号码格式不正确，请从新填写");
				return false;
			}else if(mobile.length != 11){
				$("#telPhone").focus();
				$("#phoneTips").show().html("手机号码应为11位，请从新填写");
				return false;
			}else{
			$.ajax({
			    type: 'post',  
			    data:{id:id,
			    	condigneeName:buyerName,
			    	telephone:mobile,
			    	provinceId:province,
			    	cityId:city,
			    	areaId:areaVal,
			    	liveAddress:detailAddress	
			    },
			    url: "${pageContext.request.contextPath }/web/shop/consigneeApi/update.htm",
			    success: function (data) {	        	
			    	 if(data.result=="ok"){
			    		layer.msg("编辑成功");
			    		closeFixWin();
			    		window.location.href="${pageContext.request.contextPath}/web/shop/consigneeApi/toConsigneeJsp.htm";
			    	 }else{
			    		 layer.msg("编辑失败");
			    		 
			    	 }  
			    }
			    });
			}
		}
		
		//关闭新增收货地址和修改收货地址的弹窗
		function closeFixWin(){
			$(".setFixAddBox").animate({left:"-50%"},function(){
				$(".setFixAddBox").hide();
				$("#usaId").val("");
				$(".layer").hide();
				$("#buyer_Name").val("");
				$("#province").val("");
				$("#city").val("");
				$("#district").val("");
				$("#detailAddress").val("");
				$("#telPhone").val("");
				$(".addFixInfos").hide().html("");
				$(".comRightIcon").hide();
			});
		}
		//保存用户的收货地址
		function saveAddress(){
			var usaId = getId("usaId").value;
			var buyerName = getId("buyer_Name").value;
			var province = getId("province").value;
			var city = getId("city").value;
			var areaVal = getId("district").value;
			var detailAddress = getId("detailAddress").value;
			var mobile = getId("telPhone").value;
		 	if(buyerName == ""){
				$("#buyer_Name").focus();
				$("#writeNames").show().html("收货人姓名不能为空");
				return false;
			}else if(buyerName.length > 8){
				$("#buyer_Name").focus();
				$("#writeNames").show().html("收货人姓名长度不能超过8个字符");
				return false;
			}else if(!(/^[\u4E00-\u9FA5]+$/).test(buyerName)){
				$("#buyer_Name").focus();
				$("#writeNames").show().html("收货人姓名是应为中文姓名");
				return false;
			}else if(province == ""){
				$("#districtSpan").show().html("请选择地区");
				return false;
			}else if(detailAddress==""){
				$("#detailAddress").focus();
				$("#addressTip").show().html("请填写您的详细收货地址");
				return false;
			}else if(mobile == ""){
				$("#telPhone").focus();
				$("#phoneTips").show().html("请填写您的手机号码");
				return false;
			}else if(!(/^1[3|4|5|7|8][0-9]\d{4,8}$/).test(mobile)){
				$("#telPhone").focus();
				$("#phoneTips").show().html("手机号码格式不正确，请从新填写");
				return false;
			}else if(mobile.length != 11){
				$("#telPhone").focus();
				$("#phoneTips").show().html("手机号码应为11位，请从新填写");
				return false;
			}else{
			    
				$.ajax({
				    type: 'post',  
				    data:{condigneeName:buyerName,
				    	telephone:mobile,
				    	provinceId:province,
				    	cityId:city,
				    	areaId:areaVal,
				    	liveAddress:detailAddress	
				    },
				    url: "${pageContext.request.contextPath }/web/shop/consigneeApi/add.htm",
				    success: function (data) {	        	
				    	 if(data.result=="ok"){
				    		layer.msg("添加成功");
				    		closeFixWin();
				    		window.location.href="${pageContext.request.contextPath}/web/shop/consigneeApi/toConsigneeJsp.htm";
				    	 }else{
				    		 layer.msg("添加失败");
				    		 
				    	 }  
				    }
				    });
			}
		}
		
		
		//保存收货地址
		function saveAddr(usaId,buyerName,province,city,areaVal,detailAddress,mobile){
			$.ajax({
				type:"post",
				async:false,
				dataType:"json",
				//url:"shopManager.do?action=saveUserShipAddress&usaId="+usaId+"&buyerName="+buyerName+"&province="+province+"&city="+city
				            //+"&detailAddress="+detailAddress+"&zip="+zip+"&mobile="+mobile,
				success:function(json){
					if(json){
						alert("收货地址保存成功！");
						window.location.reload(true);
					}else{
						alert("收货地址保存失败，请重新填写！");
					}
				}
			});
		}
		//新增或者修改收货地址弹窗下的各个input的blur事件
		function saveFixInfoCheck(){
			$("#buyer_Name").blur(function(){
				var buyerName = getId("buyer_Name").value;
				
				if(buyerName == ""){
					$("#writeNames").show().html("收货人姓名不能为空");
					$("#succWriteNa").hide();
				}else if(buyerName.length > 8){
					$("#writeNames").show().html("收货人姓名长度不能超过8个字符");
					$("#succWriteNa").hide();
				}else if(!(/^[\u4E00-\u9FA5]+$/).test(buyerName)){
					$("#writeNames").show().html("收货人姓名是应为中文姓名");
					$("#succWriteNa").hide();
				}else{
					$("#succWriteNa").show();
					$("#writeNames").hide().html("");
				}
			});
			$("#buyer_Name2").blur(function(){
				var buyerName = getId("buyer_Name2").value;
				
				if(buyerName == ""){
					$("#writeNames2").show().html("收货人姓名不能为空");
					$("#succWriteNa2").hide();
				}else if(buyerName.length > 8){
					$("#writeNames2").show().html("收货人姓名长度不能超过8个字符");
					$("#succWriteNa2").hide();
				}else if(!(/^[\u4E00-\u9FA5]+$/).test(buyerName)){
					$("#writeNames2").show().html("收货人姓名是应为中文姓名");
					$("#succWriteNa2").hide();
				}else{
					$("#succWriteNa2").show();
					$("#writeNames2").hide().html("");
				}
			});
			$("#detailAddress").blur(function(){
				var detailAddress = getId("detailAddress").value;
				
				if(detailAddress==""){
					$("#addressTip").show().html("请填写您的详细收货地址");
					$("#succAddress").hide();
				}else{
					$("#succAddress").show();
					$("#addressTip").hide().html("");
				}
			});
			$("#detailAddress2").blur(function(){
				var detailAddress = getId("detailAddress2").value;
				
				if(detailAddress==""){
					$("#addressTip2").show().html("请填写您的详细收货地址");
					$("#succAddress2").hide();
				}else{
					$("#succAddress2").show();
					$("#addressTip2").hide().html("");
				}
			});
			$("#telPhone").blur(function(){
				var mobile = getId("telPhone").value;
				
				if(mobile == ""){
					$("#phoneTips").show().html("请填写您的手机号码");
					$("#succPhone").hide();
				}else if(!(/^1[3|4|5|7|8][0-9]\d{4,8}$/).test(mobile)){
					$("#phoneTips").show().html("手机号码格式不正确，请从新填写");
					$("#succPhone").hide();
				}else if(mobile.length != 11){
					$("#phoneTips").show().html("手机号码应为11位，请从新填写");
					$("#succPhone").hide();
				}else{
					$("#phoneTips").hide().html("");
					$("#succPhone").show();
				}
			});
			$("#telPhone2").blur(function(){
				var mobile = getId("telPhone2").value;
				
				if(mobile == ""){
					$("#phoneTips2").show().html("请填写您的手机号码");
					$("#succPhone2").hide();
				}else if(!(/^1[3|4|5|7|8][0-9]\d{4,8}$/).test(mobile)){
					$("#phoneTips2").show().html("手机号码格式不正确，请从新填写");
					$("#succPhone2").hide();
				}else if(mobile.length != 11){
					$("#phoneTips2").show().html("手机号码应为11位，请从新填写");
					$("#succPhone2").hide();
				}else{
					$("#phoneTips2").hide().html("");
					$("#succPhone2").show();
				}
			});
		}
			
	        function pdsboom1(a) {
	         	$("#province option[value='pdss1']").remove();
	        	$("#city").find("option").remove();
	        	$("#district").find("option").remove();
	        	$.ajax({
	        		url : "${pageContext.request.contextPath }/web/shop/consigneeApi/selectRegions.htm?parentid=" + a,
	        		success : function(data) {
	        			//var data = eval("("+data+")");
	        			var str="<option value=''>---市---</option>";
	        			for(var i=0;i<data.length;i++){
	        				str+="<option value='"+data[i].regionid+"'>"+data[i].regionname+"</option>";
	        			}
	        			$("#city").append(str);
	        		}
	        	});
	        }
	        function pdsboom12(a) {
	         	$("#province12 option[value='pdss1']").remove();
	        	$("#city2").find("option").remove();
	        	$("#district2").find("option").remove();
	        	//$("#district2").find("option").remove();
	        	$.ajax({
	        		url : "${pageContext.request.contextPath }/web/shop/consigneeApi/selectRegions.htm?parentid=" + a,
	        		success : function(data) {
	        			//var data = eval("("+data+")");
	        			var str="<option value=''>---市---</option>";
	        			for(var i=0;i<data.length;i++){
	        				str+="<option value='"+data[i].regionid+"'>"+data[i].regionname+"</option>";
	        			}
	        			$("#city2").append(str);
	        		}
	        	});
	        } 
	  
		 $("#city").change(function (){
			 $("#city option[value='pdss2']").remove();
				$("#district").find("option").remove();
				$.ajax({
					url : "${pageContext.request.contextPath }/web/shop/consigneeApi/selectRegions.htm?parentid=" + $(this).val(), 
					success : function(data) {
						//var data = eval("("+data+")");
						var str="<option value=''>---区---</option>";
						for(var i=0;i<data.length;i++){
							str+="<option value='"+data[i].regionid+"'>"+data[i].regionname+"</option>";
						}
						$("#district").append(str);
					}
				});
		 });
		
	
		function delAddress(id){
			$.ajax({
			    type: 'post',  
			    data:{id:id},
			    url: "${pageContext.request.contextPath }/web/shop/consigneeApi/del.htm",
			    success: function (data) {	        	
			    	 if(data.result=="ok"){
			    		layer.msg("删除成功");
			    		window.location.href="${pageContext.request.contextPath}/web/shop/consigneeApi/toConsigneeJsp.htm";
			    	 }else{
			    		 layer.msg("删除失败");
			    		 
			    	 }  
			    }
			    });
		}
		
		function setDefault(id){
			$.ajax({
			    type: 'post',  
			    data:{consigneeId:id},
			    url: "${pageContext.request.contextPath }/web/shop/consigneeApi/updateStatus.htm",
			    success: function (data) {	        	
			    	 if(data.result=="ok"){
			    		//layer.msg("设置成功");
			    		window.location.href="${pageContext.request.contextPath}/web/shop/consigneeApi/toConsigneeJsp.htm";
			    	 }else{
			    		 layer.msg("设置失败");
			    		 
			    	 }  
			    }
			    });
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
