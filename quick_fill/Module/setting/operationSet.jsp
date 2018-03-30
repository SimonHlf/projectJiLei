<!DOCTYPE html>
<%@page pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="v" tagdir="/WEB-INF/tags"%>
<html>
	<head>
		<meta charset="UTF-8">
		<title>运营设置</title>
		<meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0"/>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/weChat/css/reset.css"/>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/weChat/Module/setting/css/operationSet.css"/>
		<link href="${pageContext.request.contextPath }/weChat/css/mobiscroll.core-2.5.2.css" rel="stylesheet" type="text/css" />
		<link href="${pageContext.request.contextPath }/weChat/css/mobiscroll.animation-2.5.2.css" rel="stylesheet" type="text/css" />
		<link href="${pageContext.request.contextPath }/weChat/css/mobiscroll.android-ics-2.5.2.css" rel="stylesheet" type="text/css" />
	</head>
	<body class="bodyPadBot">
		<div class="operationDiv">
			<strong class="comStrongTit">运营设置</strong>
			<p class="areaName">${region.name }</p>
			<input type="hidden" id="regId" value="${region.id }">
			<div class="comAddDiv">
				<p>所在城市：</p>
				<p>
					<input type="text" value="${cityName }" placeholder="请填写小区所在的地区名称" />
				</p>
			</div>
			<div class="comAddDiv">
				<p>小区名称：</p>
				<p>
					<input type="text" value="${region.name }" placeholder="请填写小区名称6个汉字以内" maxlength="6" />
				</p>
			</div>
			<div class="comAddDiv">
				<p>小区地址：</p>
				<p>
					<input type="text" value="${region.address }" placeholder="请填写小区所在地址"/>
				</p>
			</div>
			<div class="comAddDiv">
				<p>联系电话：</p>
				<p>
					<input type="text" value="${region.regionPhone }" placeholder="请填写小区运营商电话"/>
				</p>
			</div>
			<button class="chargeSet" ontouchend="goChargingSet(${region.id})">充电区设置</button>
			<div id="eleStandard">
			<p class="comSetP">
				<span class="comSetTit">电费标准</span>
				<input class="numInp" id="eleStan" type="number" value="${region.electricityStandard }"/>
				<span>元/KWh</span>
				<button class="addDisLi" ontouchend="saveEleStandard()">保存</button>
			</p>
			</div>
			<p class="tipTxt">
				<span>提示：</span>
				<span>仅用于系统计算每次从点的实际收益,并无实际意义 ,请按实际电费收费标准填写</span>
			</p>
			<p class="comSetP">
				<span class="comSetTit">充值优惠时间段</span>
				<label>
					<span class="checkSpan" ontouchend="setTimeArea(this)"><em></em></span>
				</label>
				<button class="addDisLi saveTimePart" ontouchend="saveTime(${region.id})">保存起止时间</button>
			</p>
			<div class="timePart">
				<div class="startDiv">
					<span>起：</span>
					<input id="startTimeInp" value="${createState }" name="startTime" type="text" placeholder="请选择起始时间">
					<span class="inputLayer" ontouchend="checkInpSel()"></span>
				</div>
				<div class="endDiv">
					<span>至：</span>
					<input id="endTimeInp" value="${endState  }" name="endTime" type="text" placeholder="请选择截止时间">
					<span class="inputLayer" ontouchend="checkInpSel()"></span>
				</div>
			</div>
			<div class="comSetP" id="couList">
				<span class="comSetTit">和固定充值金额关联</span> 
				<button class="addDisLi" ontouchend="addLevelList()">增加档位</button>
				<ul id="addli">
				    <c:forEach items="${roList }" var="coupon">
					    <li>
							充值<input class="numInp" type="number" value="${coupon.balance_order }"/>元<span></span>赠送<input class="numInp" value="${coupon.balance_give }" type="number" />元
							<button ontouchend="delCou('${coupon.id}','${coupon.region_id }')"><em class="delIcon"></em></button>
						</li>
				    </c:forEach>
				</ul>
			</div>
			<div id="regionOperatorList">
			<div class="setInfo">分成及管理员设置</div>
			<div class="percentDiv">
				<p>厂商分成比例<span>${firm }</span><input type="hidden" id="firmInp" value="${firm }"/></p>
				<p>运营商分成比例<input type="text" id="opeInp" value="${ope }"/></p>
			</div>
			<div class="mainPercentSet clearfix">
				<!-- nav -->
				<div class="clearfix">
					<div class="nameSet fl">姓名</div>
					<div class="numSet fl">用户编号</div>
					<div class="detailSet fl">
						<ul class="clearfix">
							<li>
								<p>运营</p>
								<p>设置</p>
							</li>
							<li>
								<p>设备</p>
								<p>管理</p>
							</li>
							<li>
								<p>注册</p>
								<p>账户</p>
							</li>
							<li>
								<p>运营</p>
								<p>统计</p>
							</li>
							<li>
								<p>费率</p>
								<p>查看</p>
							</li>
							<li>
								<p>分成</p>
								<p>比例</p>
							</li>
						</ul>
					</div>
					<div ontouchend="showOperSetFixDiv('operationSetDiv','')" class="addSet onlyAdd fl"><b></b></div>
				</div>
				<div class="listSetDiv clearfix">
					<ul>
						<c:forEach items="${regionOperatorList}" var="ro">
							<li class="userSetLi clearfix">
								<p class="nameSet fl">${ro.name }</p>
								<p class="numSet fl">${ro.num }</p>
								<p class="detailSet fl">
									<label>
										<c:if test="${ro.powerOne == '1' }">
											<span class="selAct"><em></em></span>
										</c:if>
										<c:if test="${ro.powerOne == '0' }">
		                                	<span><em></em></span>								
										</c:if>
	 									<input class="checkInp" type="checkbox" disabled/>
									</label>
									<label>
										<c:if test="${ro.powerTwo == '1' }">
									<span class="selAct"><em></em></span>
									</c:if>
									<c:if test="${ro.powerTwo == '0' }">
	                                <span><em></em></span>								
									</c:if>
										<input class="checkInp" type="checkbox" value="${ro.powerTwo }" disabled/>
									</label>
									<label for="">
											<c:if test="${ro.powerThree == '1' }">
									<span class="selAct"><em></em></span>
									</c:if>
									<c:if test="${ro.powerThree == '0' }">
	                                <span><em></em></span>								
									</c:if>
										<input class="checkInp" type="checkbox" value="${ro.powerThree }" disabled/>
									</label>
									<label>
											<c:if test="${ro.powerFour == '1' }">
									<span class="selAct"><em></em></span>
									</c:if>
									<c:if test="${ro.powerFour == '0' }">
	                                <span><em></em></span>								
									</c:if>
										<input class="checkInp" type="checkbox" value="${ro.powerFour }" disabled/>
									</label>
									<label>
											<c:if test="${ro.powerFive == '1' }">
									<span class="selAct"><em></em></span>
									</c:if>
									<c:if test="${ro.powerFive == '0' }">
	                                <span><em></em></span>								
									</c:if>
										<input class="checkInp" type="checkbox" value="${ro.powerFive }" disabled/>
									</label>
									<label>
										<input class="perInpTxt" type="text" value="${ro.proportionAdmin }" disabled/>
									</label>
								</p>
								<p ontouchend="showSetLayer(${ro.id })" class="addSet fl"><span></span></p>
								<!-- 设置 -->
								<div id="setNowLayer_${ro.id}" class="setNowLayer">
									<!--  div onclick="showEdit(${ro.id})"><em class="editIcon"></em><span></span>修改</div-->
									<div ontouchend="showOperSetFixDiv('operationEditDiv',${ro.id})"><em class="editIcon"></em><span></span>修改</div>
									<!-- <div ontouchend="comEditShowAlert('delfirm')"><em class="delIcon"></em><span></span>删除</div> -->
									<div ontouchend="delRegionOperator(${ro.id})"><em class="delIcon"></em><span></span>删除</div>
									<div ontouchend="cancelSet(${ro.id })"><em class="cancelIcon"></em>取消</div>
								</div>
							</li>
						</c:forEach>
					</ul>
				</div>
			</div>
			<div class="buttonDiv">
				<button ontouchend="saveBilv()">确认修改</button>
			</div>
			</div>
			<div class="layer"></div>
			<input id="adminPlus" type="hidden"/>
			<!-- 增加档位 -->
			<div class="comEditDiv addLevelDiv">
				<div class="comInnerDiv">
					<span>充<em></em>值：</span>
					<input type="text" class="comTxtInp" id="balanceOrder" placeholder="请输入充值金额"/>
				</div>
				<div class="comInnerDiv">
					<span>赠<em></em>送：</span>
					<input type="text" class="comTxtInp" id="balanceGive" placeholder="请输入赠送金额"/>
				</div>
				<div class="addTwoBtnDiv fl">
					<button class="comTwoBtns tBt_cancel" ontouchend="closeAlert($('.addLevelDiv'))">取消</button>
					<button class="comTwoBtns tBt_sure" ontouchend="addCou()">保存</button>
				</div>
			</div>
			<!-- 分成及管理员设置--添加 -->
			<div class="comEditDiv operationSetDiv"></div>
		</div>
		<div class="delfirm">
	    	<p>确认要删除这条记录？</p>
	    	<button class="comTwoBtn twoBtn_cancel" ontouchend="closeAlert($('.delfirm'))">取消</button>
			<button class="comTwoBtn twoBtn_sure" ontouchend="delRegionOperator()">确定</button>
	    </div>
	    <div class="toast-wrap">
	        <span class="toast-msg"></span>
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
		<script src="${pageContext.request.contextPath }/weChat/jsPlugin/initCalender.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath }/weChat/jsPlugin/tipInfo.js" type="text/javascript"></script>
		<script type="text/javascript">
			$(function(){
				initData();
			});
			function initData(){
				var stTime = $("#startTimeInp").val();
				var endTime = $("#endTimeInp").val();
				initDate("startTimeInp");
				initDate("endTimeInp");
				if(stTime != "" && endTime != ""){
					$(".checkSpan").addClass("checkSpan_act");
					$(".inputLayer").hide();
					setSelFlag = false;
				}
				$(".mainPercentSet").width($(window).width());
				initCalOperPercent();
			}
			//初始计算添加管理员后运营商的比例
			function initCalOperPercent(){
				var percentNum = 0;
				if($(".perInpTxt").length == 0){
					$("#adminPlus").val(0)
				}else{
					$(".perInpTxt").each(function(i){
						percentNum += parseFloat($(".perInpTxt").eq(i).val())
					});
					$("#adminPlus").val(percentNum);
					//console.log($("#adminPlus").val() + "--" + typeof parseFloat($("#adminPlus").val()))
				}
			}
			function showOperSetFixDiv(options,id){
				var cliHei = $(window).height();
				if(options == "operationSetDiv"){//添加
					var str = "";
					str += "<div class='comInnerDiv'>";
					str += "<span>姓<em></em>名：</span><input type='text' class='comTxtInp' id='roName' placeholder='请输入用户姓名'/>";
					str += "</div>";
					str += "<div class='comInnerDiv'>";
					str += "<span>用户编号：</span><input type='text' class='comTxtInp' id='roNum' placeholder='请输入用户编号'/></div>";
					str += '<div class="comInnerDiv">';
					str += '<span>分成比例：</span><input type="text" class="comTxtInp" id="roAdmin" placeholder="请设置分成比例"/></div>';
					str += '<div class="comInnerDiv">';
					str += '<div class="comFlInner">';
					str += '<span>运营设置：</span><label><span><em></em></span><input ontouchend="setStatus(this)" id="roOne" class="checkInp" type="checkbox" value="0"/></label></div>';
					str += '<div class="comFlInner">';
					str += '<span>设备管理：</span><label><span><em></em></span><input ontouchend="setStatus(this)" id="roTwo" class="checkInp" type="checkbox" value="0"/></label></div>';
					str += '<div class="comFlInner">';
					str += '<span>注册账户：</span><label><span><em></em></span><input ontouchend="setStatus(this)" id="roThree" class="checkInp" type="checkbox" value="0"/></label></div>';
					str += '<div class="comFlInner">';
					str += '<span>运营统计：</span><label><span><em></em></span><input ontouchend="setStatus(this)" id="roFour" class="checkInp" type="checkbox" value="0"/></label></div>'
					str += '<div class="comFlInner">';
					str += '<span>费率查看：</span><label><span><em></em></span><input ontouchend="setStatus(this)" id="roFive" class="checkInp" type="checkbox" value="0"/></label></div>'
					str += '</div>';
					str += '<div class="addTwoBtnDiv fl">';
					str += '<button class="comTwoBtns tBt_cancel" ontouchend=closeAlert($(".operationSetDiv"))>取消</button>';
					str += '<button class="comTwoBtns tBt_sure" ontouchend="addRegionOperator()">保存</button>';
					str += '</div>';
					$(".operationSetDiv").html("").append(str);	
					$(".layer").show().animate({"opacity":1},200,function(){
						$(".operationSetDiv").show().css({"top":parseInt((cliHei - $(".operationSetDiv").height())/2)});
					});
				}else if(options == "operationEditDiv"){
					$.ajax({
						method:'post',
						url:'${pageContext.request.contextPath}/weChat/editRegionOperatorBefore.htm?id='+id,
						success:function(data){
							$(".operationSetDiv").html("").append(data);
							$(".layer").show().animate({"opacity":1},200,function(){
								$(".operationSetDiv").show().css({"top":parseInt((cliHei - $(".operationSetDiv").height())/2)});
							});
						}		
					})
				}
				
			}
			//显示每行对应set层
			function showSetLayer(id){
				$("#setNowLayer_" + id).animate({"top":0});
			}
			function cancelSet(id){
				$("#setNowLayer_" + id).animate({"top":-39});
			}
			//修改
			function showEdit(cmd){
				//alert(cmd);
				var cliHei = $(window).height();
				$.ajax({
					method:'post',
					url:'${pageContext.request.contextPath}/weChat/editRegionOperatorBefore.htm?id='+cmd,
					success:function(data){
						$(".layer").show().animate({"opacity":1},200,function(){
							$(".operationSetDivEdit").show(data).css({"top":parseInt((cliHei - $(".operationSetDiv").height())/2)});
						});
					}		
					
				})
			}
			//设置充电优惠时间段区间
			var setSelFlag = true;
			function setTimeArea(obj){
				if(setSelFlag){
					$(obj).addClass("checkSpan_act");
					$(".inputLayer").hide();
				}else{
					$(obj).removeClass("checkSpan_act");
					$(".inputLayer").show();
					$("#startTimeInp").val("");
					$("#endTimeInp").val("");
				}
				setSelFlag = !setSelFlag;
			}
			//检测设置优惠时间段复选框是否勾选
			function checkInpSel(){
				if($(".checkSpan_act").length == 0){
					toast("请先勾选修改优惠起止时间");
					return;
				}
			}
			function setStatus(obj){
				if(!obj.checked){//选中
					$(obj).val(1);
					$(obj).prev().addClass("selAct");
				}else{
					$(obj).val(0);
					$(obj).prev().removeClass("selAct");
				}
			}
			function setStatusEdit(obj){
				//console.log($(obj).attr("checked"))
				var checkStatus = $(obj).is(":checked");
				//console.log(!checkStatus);
				if(!checkStatus){
					$(obj).val(1);
					$(obj).prev().addClass("selAct");
				}else{
					$(obj).val(0);
					$(obj).prev().removeClass("selAct");
				}
			}
			//跳转充电区设置页面
			function goChargingSet(cmd){
				window.location.href = "${pageContext.request.contextPath}/weChat/chargingAreaSetting.htm?regId="+cmd;
			}
			//删除优惠券
			function delCou(cmd,regId){
				$.ajax({
					method:'post',
					url:'${pageContext.request.contextPath}/weChat/delCoupon.htm',
					data:{
						id:cmd,
						regionId:regId
					},
					success:function(data){
						toast("删除成功");
						$("#couList").html(data);
					},
					error:function(data){
						toast("删除失败");
					}
				})
			}
			//添加优惠券
			function addCou(){
				var regId=$("#regId").val();
				var startTimeInp=$("#startTimeInp").val();
				var endTimeInp=$("#endTimeInp").val();
				var balanceOrder=$("#balanceOrder").val();
				var balanceGive=$("#balanceGive").val();
				/*if(startTimeInp == null || startTimeInp == "" || endTimeInp == null || endTimeInp == ""){
					alert("请选择充值优惠的日期区间");
					return;
				}*/
				if(balanceOrder == null || balanceOrder == ""){
					toast("请输入充值金额");
					return;
				}if(balanceGive == null ||balanceGive == ""){
					toast("请输入赠送金额");
					return;
				}
				$.ajax({
				method:'post',
				url:'${pageContext.request.contextPath}/weChat/addCoupon.htm',
				data:{
					regionId:regId,
					createStart:startTimeInp,
					createEnd:endTimeInp,
					balanceOrder:balanceOrder,
					balanceGive:balanceGive
				},
				success:function(data){
					toast("添加成功");
					closeAlert($('.addLevelDiv'))
					$("#couList").html(data);
				},
				error:function(data){
					toast("添加失败");
				}
				})
			}
			function addLevelList(){
				var startTimeInp=$("#startTimeInp").val();
				var endTimeInp=$("#endTimeInp").val();
				if(startTimeInp == null || startTimeInp == "" || endTimeInp == null || endTimeInp == ""){
					toast("请选择充值优惠的日期区间");
					return;
				}
				comEditShowAlert('addLevelDiv');
			}
			//添加档位
			function addDW(){
				html = "";
				html += '<li>';
				html += '充值<input class="numInp" type="number"/>元<span></span>'
				html += '赠送<input class="numInp" type="number" />元'
				html += '<button ontouchend="delCou(0)"><em class="delIcon"></em></button>'
				html += '</li>'
				$("#addli").append(html);
			}
			function checkboxitem(){
				$("#checkboxitem label span em").innerHTML = "√";
				$("#checkboxitem label input").checkbox = checkbox;
			}
			
			//修改优惠券起止时间
			function saveTime(cmd){
				var startTimeInp=$("#startTimeInp").val();
				var endTimeInp=$("#endTimeInp").val();
				if($(".checkSpan_act").length == 0){
					toast("请先勾选修改优惠起止时间");
					return;
				}
				if(startTimeInp == ""){
					toast("请选择优惠起始时间");
					return;
				}else if(endTimeInp == ""){
					toast("请选择优惠结束时间");
					return;
				}else if(endTimeInp < startTimeInp){
					toast("结束时间不能小于起始时间");
					return;
				}
				$.ajax({
					method:'post',
					url:'${pageContext.request.contextPath}/weChat/editCouponTime.htm',
					data:{
						createStart:startTimeInp,
						createEnd:endTimeInp,
						regionId:cmd
					},
					success:function(data){;
						toast("时间保存成功");
						$(".timePart").html(data);
						initDate("startTimeInp");
						initDate("endTimeInp");
					}
				})
			}
			
			//添加运营商管理员
			 function addRegionOperator(){
				 var firmInp=$("#firmInp").val();
				var regId=$("#regId").val();
				var name=$("#roName").val();
				var num=$("#roNum").val();
				var proportionAdmin=$("#roAdmin").val();
				var one=$("#roOne").val();
				var two=$("#roTwo").val();
				var three=$("#roThree").val();
				var four=$("#roFour").val();
				var five=$("#roFive").val();
				var opeInp=$("#opeInp").val();//运营商比例
				var adminPlus=$("#adminPlus").val();//管理员比例之和
				if(name == null || name == ""){
					toast("请输入管理员名称");
					return false;
				}if(num == null || num == ""){
					toast("请输入管理员编号");
					return false;
				}if(isNaN(num)){;
					toast("请输入正确格式的编号");
					return false;
				}
				if(proportionAdmin == null || proportionAdmin == ""){
					toast("请输入管理员分成比例");
					return false;
				}
				if(isNaN(proportionAdmin)){
					toast("请输入正确格式的比例");
					return false;
				}
				var bb=1-firmInp;
				if(proportionAdmin>bb){
					toast("请输入合适的管理员分成比例");
					return false;
				}if(proportionAdmin<0){
					toast("请输入合适的管理员分成比例");
					return false;
				}
				$.ajax({
					method:'post',
					url:'${pageContext.request.contextPath}/weChat/isCheckNum.htm',
					data:{
						num:num
					},
					success:function(data){
						var data=eval('(' + data + ')');
						if(data.state == false){
							toast(data.msg);
							return false;
						}else if(data.state == true){
						window.location.href="${pageContext.request.contextPath}/weChat/addRegionOperator.htm?regionId="+regId+"&&name="+name+"&&num="+num+
								"&&proportionAdmin="+proportionAdmin+"&&powerOne="+one+"&&powerTwo="+two+
								"&&powerThree="+three+"&&powerFour="+four+"&&powerFive="+five+"&&powerSix=1"+"&&opeInp="+opeInp+"&&adminPlus="+adminPlus;
						 toast("添加管理员成功");	
						 closeAlert($('.operationSetDiv'))
						/*    $.ajax({
						    	 method:'post',
						    	 url:'${pageContext.request.contextPath}/weChat/addRegionOperator.htm',
						    	 data:{
						    		 regionId:regId,
						    		 name:name,
						    		 num:num,
						    		 proportionAdmin:proportionAdmin,
						    		 powerOne:one,
						    		 powerTwo:two,
						    		 powerThree:three,
						    		 powerFour:four,
						    		 powerFive:five,
						    		 powerSix:1,
						    		 opeInp:opeInp,
						    		 adminPlus:adminPlus
						    	 },
						    	 success:function(data){
						    		 toast("添加管理员成功");
						    		 closeAlert($('.operationSetDiv'))
						    		 $("#regionOperatorList").html(data);
						    	 },error:function(data){
						    		 toast("添加管理员失败");
						    	 }
						     }) */ 
						}
					}
				})
			} 
			
			//修改运营商管理员
			 function editRegionOperator(id){
				var regId=$("#regId").val();
				var name=$("#roName").val();
				var num=$("#roNum").val();
				var proportionAdmin=$("#roAdmin").val();
				var one=$("#roOne").val();
				var two=$("#roTwo").val();
				var three=$("#roThree").val();
				var four=$("#roFour").val();
				var five=$("#roFive").val();
				var adminValue=$("#adminValue").val();//管理员之前的分成比例
				 var firmInp=$("#firmInp").val();
				if(name == null || name == ""){
					toast("请输入管理员名称");
					return false;
				}if(num == null || num == ""){
					toast("请输入管理员编号");
					return false;
				}if(isNaN(num)){;
					toast("请输入正确格式的编号");
					return false;
				}
				if(proportionAdmin == null || proportionAdmin == ""){
					toast("请输入管理员分成比例");
					return false;
				}
				if(isNaN(proportionAdmin)){
					toast("请输入正确格式的比例");
					return false;
				}
				var bb=1-firmInp;
				if(proportionAdmin>bb){
					toast("请输入合适的管理员分成比例");
					return false;
				}if(proportionAdmin<0){
					toast("请输入合适的管理员分成比例");
					return false;
				}
				window.location.href="${pageContext.request.contextPath}/weChat/editRegionOperator.htm?id="+id+"&&name="+name+"&&num="+num
				+"&&regionId="+regId+"&&proportionAdmin="+proportionAdmin+"&&powerOne="+one+"&&powerTwo="+two+"&&powerThree="+three+"&&powerFour="+four+"&&powerFive="+five+"&&adminValue="+adminValue;
				toast("修改管理员成功");
	    		 closeAlert($('.operationSetDiv'))
				/*      $.ajax({
			    	 method:'post',
			    	 url:'${pageContext.request.contextPath}/weChat/editRegionOperator.htm',
			    	 data:{
			    		 id:id,
			    		 name:name,
			    		 num:num,
			    		 regionId:regId,
			    		 proportionAdmin:proportionAdmin,
			    		 powerOne:one,
			    		 powerTwo:two,
			    		 powerThree:three,
			    		 powerFour:four,
			    		 powerFive:five
			    	 },
			    	 success:function(data){
			    		 toast("修改管理员成功");
			    		 closeAlert($('.operationSetDiv'))
			    		 $("#regionOperatorList").html(data);
			    	 },error:function(data){
			    		 toast("修改管理员失败");
			    	 }
			     })   */
			} 
			
			//删除运营商管理员
			function delRegionOperator(cmd){
				var regId=$("#regId").val();
				window.location.href="${pageContext.request.contextPath}/weChat/delRegionOperator.htm?id="+cmd+"&&regId="+regId;
				toast("删除管理员成功");
				/* $.ajax({
					method:'post',
					url:'${pageContext.request.contextPath}/weChat/delRegionOperator.htm?id='+cmd+'&regId='+regId,
					success:function(data){
						toast("删除管理员成功");
						$("#regionOperatorList").html(data);
					}		
				}) */
			}
			//保存电费标准
			function saveEleStandard(){
				var regId=$("#regId").val();
				var eleStan=$("#eleStan").val();
				if(eleStan == null || eleStan == ""){
					toast("请输入电费标准");
					return false;
				}
                $.ajax({
                	method:'post',
                	url:'${pageContext.request.contextPath}/weChat/saveEleStandard.htm?regId='+regId+'&eleStandard='+eleStan,
                	success:function(data){
                		toast("保存成功");
                		$("#eleStandard").html(data);
                	}		
                })
			}
			//保存运营商比例
			function saveBilv(){
				var firmInp=$("#firmInp").val();
				var opeInp=$("#opeInp").val();
				var regId=$("#regId").val();//小区id
				/*if(firmInp == null || firmInp == ""){
					alert("请输入厂商比例");
					return false;
				}*/if(opeInp == null || opeInp == ""){
					toast("请输入运营商比例");
					return false;
				}if(isNaN(opeInp)){
					toast("请输入正确格式的比例");
				}
				var aa=1-firmInp-parseFloat($("#adminPlus").val());
			 	if(opeInp>aa){
					toast("请输入合适的运营商比例");
					return false;
				}
				toast("保存成功");
				setTimeout(function(){
					window.location.href="${pageContext.request.contextPath}/weChat/saveBilv.htm?ope="+opeInp+"&&regId="+regId;
				},1500); 
			}
		</script>
	</body>
</html>
