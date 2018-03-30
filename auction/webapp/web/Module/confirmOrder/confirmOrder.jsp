<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8">
		<title>确认订单</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/web/Module/confirmOrder/css/confirmOrder.css"/>
	</head>
	<body>
		<%@ include file="../../head.jsp"%>  
		<div class="confirmDivCon clearfix w1100">
			<!-- 存在收货地址 -->
			<c:if test="${consignees.size()>0}">
				<div class="addressDiv">
					<strong class="addressTit">确认收货地址</strong>
					<div class="addressList">
						<span class="listSpTit">邮寄到</span>
						<!-- 存在收货地址 -->
						<ul id="con_adress">
						
							<c:forEach items="${consignees}" var="c">
								<li>
									<label for="addInp1">
										<p>${c.provinceName}${c.cityName}${c.areaName}${c.liveAddress}(<span>${c.condigneeName}</span>&nbsp;收)${c.telephone}</p>
										
										<c:if test="${c.defaultStatus == 1 }">
											<input type="hidden" name="condigneeName" id="condigneeName" value="${c.condigneeName}"/>
											<input type="hidden" name="phone" id="phone" value="${c.telephone}"/>
											<input type="hidden" name="address" id="address" value="${c.provinceName}${c.cityName}${c.areaName}${c.liveAddress}"/>
											<span class="radiusSpan selActSpan"><em></em></span>
										</c:if>
										<c:if test="${c.defaultStatus != 1 }">
											<span class="radiusSpan"><em></em></span>
										</c:if>
										<input type="radio" id="addInp1" class="addressInp" name="addressInp" />
									</label>
									<c:if test="${c.defaultStatus == 1 }">
										<div class="setAdd fl">
											<span class="defaultAdd">默认地址</span>
											<a class="setAddBtn" href="javascript:toEditAddress('${c.id}',1)">修改地址</a>
										</div>
									</c:if>
									<c:if test="${c.defaultStatus != 1 }">
										<div class="setAdd noDefaultAdd fl">
											<a class="setAddBtn" href="javascript:defaultAddress('${c.id}',1)">设置为默认地址</a>
										</div>
									</c:if>
									
								</li>
							</c:forEach>	
						</ul>
					</div>
				</div>
			</c:if>
			<!-- 不存在收货地址 -->
			<c:if test="${consignees.size()==0}">
				<!--  strong class="addressTit">添加收货地址</strong-->
				<div class="noAddressDiv" id="no_adreee">
					<img src="${pageContext.request.contextPath }/web/Module/confirmOrder/images/addAdd.png"/>
					<p>暂无收货地址，<a href="javascript:void(0)" onclick="addNewAddress()">请添加</a></p>
				</div>
			</c:if>
			<!-- 异步加载收货地址 -->
			<div class="addressDiv" id="YB_adress">
					<strong class="addressTit">确认收货地址</strong>
					<div class="addressList">
						<span class="listSpTit">邮寄到</span>
						<ul id="YB_adresslist">
								
						</ul>
					</div>
				</div> 
			
			<!-- 确认订单 -->
			<div class="confirmOrderDiv">
				<strong class="addressTit">确认订单</strong>
				<ul class="confirmNav">
					<li class="confirWid1">商品</li>
					<li class="confirWid2">商品属性</li>
					<li class="confirWid2">单价</li>
					<li class="confirWid2">数量</li>
					<li class="confirWid2">总价</li>
				</ul>
				<div class="confirmDetail">
					<ul>
						<li class="clearfix">
							<div class="comInnerCon confirWid3 detailCon">
								<div class="topProDetail">
									<div class="thumbnailImg">
										<img src="/${product.thumbnailurl}" />
									</div>
									<a href="">${product.name}</a>
									<p>
										<a href="">
											<img src="${pageContext.request.contextPath }/web/Module/youleBuy/images/shopThumb.jpg"/>
											<span>西藏锦绣</span>
										</a>
									</p>
								</div>
								<div class="botMarkNote" style="display:none">
									<div><span>给卖家留言:</span><textarea placeholder="选填:填写内容已和卖家协商确认"></textarea></div>
									<div><span>发票信息：</span><input type="text" placeholder="选填:填写发票抬头" /></div>
								</div>
							</div>
							
								<c:if test="${product.attr1!='0'}">
									<div class="comInnerCon confirWid4">属性：${pav.specName}</div>
									<c:if test="${product.type==1 || product.type==4 }">
										<div class="comInnerCon confirWid4">单价：¥${pav.parentPrice}</div>
									</c:if>
									<c:if test="${product.type==2}">
										<div class="comInnerCon confirWid4">单价：${pav.parentPrice}金币</div>
									</c:if>
									<c:if test="${product.type==3}">
										<div class="comInnerCon confirWid4">单价：${pav.parentPrice}积分</div>
									</c:if>
								</c:if>
								<c:if test="${product.attr1=='0'}">
									<div class="comInnerCon confirWid4">属性：无</div>
									<c:if test="${product.type==1 || product.type==4 }">
										<div class="comInnerCon confirWid4">单价：¥${product.price}</div>
									</c:if>
									<c:if test="${product.type==2}">
										<div class="comInnerCon confirWid4">单价：${product.price}金币</div>
									</c:if>
									<c:if test="${product.type==3}">
										<div class="comInnerCon confirWid4">单价：${product.price}积分</div>
									</c:if>
								</c:if>
							
							
							
							<div class="comInnerCon confirWid4 clearfix">
								<div class="buyNum fl">
									<span class="leftSp reduce" id="reduceNum">-</span>
									<p><input type="number" value="${num}" id="proNum" onblur="checkProNum(this)" onkeyup="checkProNum(this)" onkeydown="checkProNum(this)"></p>
									<span class="rightSp plus" id="plusNum">+</span>
								</div>
							</div>
							<c:if test="${product.type==1 || product.type==4 }">
								<div class="comInnerCon confirWid4">总价：¥<span class="totalPrice" id="totalPrice">${total}</span></div>
							</c:if>
							<c:if test="${product.type==2}">
								<div class="comInnerCon confirWid4">总价：<span class="totalPrice" id="totalPrice">${total}</span>金币</div>
							</c:if>
							<c:if test="${product.type==3}">
								<div class="comInnerCon confirWid4">总价：<span class="totalPrice" id="totalPrice">${total}</span>积分</div>
							</c:if>
							
						</li>
					</ul>
				</div>
				<!-- 支付方式 -->
				<c:if test="${product.type==1 || product.type==4 }">
				<div class="payWay">
					<strong class="addressTit">选择支付方式</strong>
					<input type="hidden" id="selPayInp" />
					<ul class="clearfix">
						<li>
							<label for="weixinPayInp">
								<img src="${pageContext.request.contextPath }/web/Module/confirmOrder/images/wchat.png"/>
								<input type="radio" id="weixinPayInp" name="selectPay" onclick="selPayWay(this)" value="1" />
								<p>微信支付</p >
								<span class="selNowSp"><em></em></span>
							</label>
						</li>
						<li>
							<label for="aliPayInp">
								<img src="${pageContext.request.contextPath }/web/Module/confirmOrder/images/alipay.png"/>
								<input type="radio" id="aliPayInp" name="selectPay" onclick="selPayWay(this)" value="2" />
								<p>支付宝支付</p >
								<span class="selNowSp"><em></em></span>
							</label>
						</li>
					</ul>
				</div>
				</c:if>
				<!-- 付款 -->
				<div class="payDiv fr">
					<div class="topPayDiv">
						<input type="hidden" value="${product.type}" name="pid" id="pType" >
						<input type="hidden" value="${product.id}" name="pid" id="pid" >
						<input type="hidden" value="${pav.id}" name="pavId" id="pavId" >
						<input type="hidden" value="${pav.parentPrice}" name="parentPrice" id="parentPrice" >
						<input type="hidden" value="${product.trans}" name="trans" id="trans" >
					 	<p><span>运费：${product.trans}</span></p>
					 	
					 	<c:if test="${product.type==1 || product.type==4 }">
							<h2><span>实收：</span>¥<em id="endTotal">${totalprice}</em></h2>
						</c:if>
						<c:if test="${product.type==2}">
							<h2><span>实收：</span><em id="endTotal">${totalprice}</em>金币</h2>
						</c:if>
						<c:if test="${product.type==3}">
							<h2><span>实收：</span><em id="endTotal">${totalprice}</em>积分</h2>
						</c:if>
						<!--<p><span>收件人：</span>黄利峰</p> -->
					</div>
					<a href="javascript:submitOrder()">提交订单</a>
				</div>
			</div>
		</div>
		<%@ include file="../../foot.jsp"%>  
		<div class="layer"></div>
		<!-- 动态生成微信支付二维码  -->
		<div id="newPayCode">
			<a href="javascript:void(0)" onclick="closePayCode()"></a>
			<img src=""/>
		</div>
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
		
		
		
		<script type="text/javascript" src="${pageContext.request.contextPath }/web/js/jquery-1.7.2.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/web/js/layer.js"></script>
		<script type="text/javascript">
		$(function(){
			$("#YB_adress").hide();
		})
		var payway = '';
		
		$("#reduceNum").click(function(){
			var trans=Number($("#trans").val());
			var parentPrice=Number($("#parentPrice").val());
			var num=Number($("#proNum").val());
			var endNum=num-1;
			if(endNum<1){
				endNum=1;	
			}
			var totalPrice=parentPrice*endNum;
			var endTotal=parentPrice*endNum+trans;
			$("#proNum").val(endNum);
			$("#totalPrice").html(totalPrice.toFixed(2));
			$("#endTotal").html(endTotal.toFixed(2));
			
		});	
		$("#plusNum").click(function(){
			var trans=Number($("#trans").val());
			var parentPrice=Number($("#parentPrice").val());
			var num = Number($("#proNum").val());
			var endNum=num+1;
			var totalPrice=parentPrice*endNum;
			var endTotal=parentPrice*endNum+trans;
			$("#proNum").val(endNum);
			$("#totalPrice").html(totalPrice.toFixed(2));
			$("#endTotal").html(endTotal.toFixed(2));
		});
		function getId(id){
			return document.getElementById(id);
		}
		//新增收货地址
		function addNewAddress(){
			//$("#usaId").val("");
			$(".layer").show();
			$(".setFixTit").html("新增收货地址");
			$("#showAddNewDiv").show().css({"top":parseInt(($(window).height() - $("#showAddNewDiv").height())/2)}).animate({left:"50%"});
			saveFixInfoCheck();
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
		//关闭新增收货地址和修改收货地址的弹窗
		function closeFixWin(){
			$(".setFixAddBox").animate({left:"-50%"},function(){
				$(".setFixAddBox").hide();
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
		//修改地址
		function toEditAddress(id,type){
			$.ajax({
			    type: 'post',  
			    data:{id:id,type:type},
			    url: "${pageContext.request.contextPath }/web/shop/consigneeApi/toedit2.htm",
			    success: function (html) {
			    	
			    	$(".layer").show();
			    	$("#showEditJsp").show().css({"top":parseInt(($(window).height() - $("#showEditJsp").height())/2)}).animate({left:"50%"}).html(html);
			    	saveFixInfoCheck();
			    }
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
				    url: "${pageContext.request.contextPath }/web/shop/consigneeApi/add2.htm",
				    success: function (data) {	 
				    	
				    	 var str="";
				    	 for(var i=0;i<data.length;i++){
				    		str+=' <li>'+
								'<label for="addInp1">'+
									'<p>'+data[i].provinceName+''+data[i].cityName+''+data[i].areaName+''+data[i].liveAddress+'(<span>'+data[i].condigneeName+'</span>&nbsp;收)'+data[i].telephone+'</p>';

									if(data[i].defaultStatus == 1){
										str+='<input type="hidden" name="condigneeName" id="condigneeName" value="${c.condigneeName}"/>'+
										'<input type="hidden" name="phone" id="phone" value="${c.telephone}"/>'+
										'<input type="hidden" name="address" id="address" value="${c.provinceName}${c.cityName}${c.areaName}${c.liveAddress}"/>'+
										'<span class="radiusSpan selActSpan"><em></em></span>';
									}
									if(data[i].defaultStatus != 1){
										str+='<span class="radiusSpan"><em></em></span>';
									}	

									str+='<input type="radio" id="addInp1" class="addressInp" name="addressInp" />'+
								'</label>';
								if(data[i].defaultStatus == 1){
									str+='<div class="setAdd fl">'+
										'<span class="defaultAdd">默认地址</span>'+
										'<a class="setAddBtn" href="javascript:toEditAddress('+data[i].id+','+2+')">修改地址</a>'+
									'</div>';
								}
								if(data[i].defaultStatus != 1){
									str+='<div class="setAdd noDefaultAdd fl">'+
										'<a class="setAddBtn" href="javascript:defaultAddress('+data[i].id+','+2+')">设置为默认地址</a>'+
									'</div>';
								}	
								
								str+='</li>';
				    		 
				    	 }
				    	closeFixWin();
				    	$("#no_adreee").hide();
				    	$("#YB_adress").show();
				    	$("#YB_adresslist").append(str);	
				    }
				    });
			}
		}
		//修改收货地址
		function editAddress(){
			var buyerName = getId("buyer_Name2").value;
			var province = getId("province2").value;
			var city = getId("city2").value;
			var areaVal = getId("district2").value;
			var detailAddress = getId("detailAddress2").value;
			var mobile = getId("telPhone2").value;
			var type = getId("type").value;
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
			    	liveAddress:detailAddress,
			    	type:type
			    },
			    url: "${pageContext.request.contextPath }/web/shop/consigneeApi/update2.htm",
			    success: function (html) {	        	
			    	
			    	closeFixWin();
			    	
			    	if(type==2){
			    		$("#YB_adresslist").html(html);	
			    	}else{
			    		$("#con_adress").html(html);
			    	}
				    
			    }
			    });
			}
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
	
		//设置默认收货地址
		function defaultAddress(id,type){
			$.ajax({
				method : 'post',
				url : '${pageContext.request.contextPath }/web/shop/orderApi/setDefault.htm',
				data :{id:id,type:type},
				success : function(data) {
					if(type!=2){
						$("#con_adress").html(data);
					}else{
						$("#YB_adresslist").html(data);
					}
				}
				
			})
			
		}
		
		function checkProNum(obj){
			var num=$(obj).val();
			if(num<1){
				$(obj).val(1);
			}
		}
		
		function submitOrder(){
			var receivername=$("#condigneeName").val();
			var receivertel=$("#phone").val();
			var receiveraddress=$("#address").val();
			
			if(receivername==undefined){
				layer.msg("请选择收货地址");
				return false;
			}
			
			
			
			var pType=$("#pType").val();
			var pavId=$("#pavId").val();
			var num=$("#proNum").val();
			var pid=$("#pid").val();
			if(pType==1 || pType==4){//现金购买
				if(payway == ''){
					layer.msg("请选择支付方式");
					return false;
				}
				if(payway == 1){
					 //打开付费二维码 -- 微信二维码
					 var scrollTop = document.documentElement.scrollTop || document.body.scrollTop;
					 $(".layer").show();
					 $("#newPayCode").show().css({
						 "top":parseInt(($(window).height() - $("#newPayCode").height())/2) + scrollTop
					 }).animate({left:"50%"});
					 $("#newPayCode img").attr("src","../../../qrcode.htm?pavId="+pavId+"&num="+num+"&pid="+pid+"&receivername="+receivername+"&receivertel="+receivertel+"&receiveraddress="+receiveraddress+"&paytype=1")
					/* window.location.href="${pageContext.request.contextPath }/qrcode.htm?pavId="+pavId+"&num="+num+"&pid="+pid+"&receivername="+receivername+"&receivertel="+receivertel+"&receiveraddress="+receiveraddress+"&paytype=1"; */
				}
				if(payway == 2){
					window.location.href="${pageContext.request.contextPath }/web/shop/aliPayApi/pay.htm?pavId="+pavId+"&num="+num+"&pid="+pid+"&receivername="+receivername+"&receivertel="+receivertel+"&receiveraddress="+receiveraddress+"&paytype=2";
				}
				
			}else{//积分或金币购买
				
				 $.ajax({
				        method:'post',
				        url:'${pageContext.request.contextPath }/web/shop/aliPayApi/payByGoldOrJifen.htm',
				        data:{pavId:pavId,
				        	  num:num,
				        	  pid:pid,
				        	  receivername:receivername,
				        	  receivertel:receivertel,
				        	  receiveraddress:receiveraddress,
				        	  paytype:1
				        	},
				        success:function (data) {
				            // data=eval("("+data+")");
				            if(data.result=="ok"){
				            	//返回个人中心页面
				            	alert("购买成功")
				            	
				            	window.location.href="${pageContext.request.contextPath }/web/shop/orderApi/myOrderList.htm";
				            }
				            if(data.result=="fail"){
				            	//跳转路径
				            	alert(data.msg)
				            }
				        }
				    });
				
				
			}
			
		}
		//关闭微信二维码支付 
		function closePayCode(){
			
			$("#newPayCode").animate({left:"-50%"},function(){
				$("#newPayCode").hide();
				$(".layer").hide();
				location.href="${pageContext.request.contextPath }/web/shop/orderApi/myOrderList.htm?sort=2";
			});
		}
		function selPayWay(obj){
			$(".selNowSp").removeClass("current");
			$(".payWay label").removeClass("active");
			$(obj).parent().addClass("active");
			$(obj).parent().find("span").addClass("current");
			$("#selPayInp").val($(obj).val());
			payway = $("#selPayInp").val();
		}
		</script>
	</body>
</html>
