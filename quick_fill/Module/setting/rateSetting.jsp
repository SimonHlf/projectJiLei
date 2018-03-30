<!DOCTYPE html>
<%@page pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="v" tagdir="/WEB-INF/tags"%>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0"/>
		<title>费率设置</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/weChat/css/reset.css"/>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/weChat/Module/setting/css/rateSetting.css"/>
	</head>
	<body class="bodyPadBot">
		<div class="rateSet">
			<strong class="comStrongTit">费率设置</strong>
			<p class="areaName">${regionName }-${regionArea.name }</p>
			<div class="innerRateSet">
				<input type="hidden" id="payPattern" value="0" />
				<input type="hidden" id="reArId" value="${reArId}"/>
				<div class="rateSetNav">
				<div id="ddiv">
					<c:if test="${sta == '0' }">
						<label class="comLabel" for="timePattern">
							<span class="cirSpan"><b></b></span>
							<input id="timePattern" class="patternInp" type="radio" name="patternPay" value="0" />
							<span>计时模式</span>
						</label>
						<label class="comLabel" for="meterPattern">
							<span class="cirSpan"></span>
							<input id="meterPattern" class="patternInp" type="radio" name="patternPay" value="1" />
							<span>计量模式</span>
						</label>
						<label class="comLabel" for="jiciPattern">
							<span class="cirSpan"></span>
							<input id="jiciPattern" class="patternInp" type="radio" name="patternPay" value="2" />
							<span>计次模式</span>
						</label>
					</c:if>
					<c:if test="${sta == '1' }">
						<c:if test="${chargeType == '0' }">
							<label class="comLabel" for="timePattern">
								<span class="cirSpan_has"><b></b></span>
								<span>计时模式</span>
							</label>
						</c:if>
						<c:if test="${chargeType == '1' }">
							<label class="comLabel" for="meterPattern">
								<span class="cirSpan_has"><b></b></span>
								<span>计量模式</span>
							</label>
						</c:if>
						<c:if test="${chargeType == '2' }">
							<label class="comLabel" for="jiciPattern">
								<span class="cirSpan_has"><b></b></span>
								<span>计次模式</span>
							</label>
						</c:if>
					</c:if>
				</div>
				<!-- 计时模式 -->
				<div class="rateSetCon timePatternCon" style="display: block;" id="div1">
					<p class="rateInfo"><span></span>最小和最大功率值关联配置参数</p>
					<ul id="addli1">
						<c:forEach items="${reRateList }" var="reRate">
							<li>
								<input class="wattInp" type="number" disabled value="${reRate.minPower }" />瓦&nbsp;至&nbsp;<input class="wattInp" disabled type="number" value="${reRate.maxPower }">瓦&nbsp;<input class="payMoneyInp" disabled type="number" value="${reRate.standard }">元/小时
								<em class="delIcon" ontouchend="del('${reRate.id}','${reArId }','1')"></em>
							</li>
						</c:forEach>
					</ul>
					<div class="addBtnDiv" ontouchend="comEditShowAlert('addJiShiDiv')"><button>增加档位</button></div>
				</div>
				<!-- 计量模式 -->
				<div class="rateSetCon meterPatternCon" id="div2">
					<p class="meterP">
						<input type="number" />元/KWh
					</p>
				</div>
				<!-- 计次模式 -->
				<div class="rateSetCon jiciPatternCon" id="div3">
					<p class="rateInfo"><span></span>最小和最大功率值关联配置参数</p>
					<ul id="addli2">
						<c:forEach items="${reRateList }" var="reRate">
							<li>
								<input class="wattInp" disabled type="number" value="${reRate.minPower }">瓦&nbsp;至&nbsp;<input disabled class="wattInp" type="number" value="${reRate.maxPower }">瓦&nbsp;<input class="payMoneyInp" disabled type="number" value="${reRate.standard }">元/次
								<em class="delIcon" ontouchend="del('${reRate.id}','${reArId }','2')"></em>
							</li>
						</c:forEach>
					</ul>
					<div class="addBtnDiv">
						<button ontouchend="comEditShowAlert('addJiCiDiv')">增加档位</button>
					</div>
				</div>
				</div>
				<p class="comSetP">
					<span class="comSetTit">包月模式</span>
					<label>
						<span class="checkSpan" ontouchend="setTimeArea(this)"><em></em></span>
					</label>
				</p>
				<div class="monthlyPay">
					<span class="inputLayer" ontouchend="checkInpSel()"></span>
					收费标准<input type="number" id="money" value="${month.money }">元/月&nbsp;每月限制<input type="number" id="num" value="${month.num }">次
				</div>
				<div class="addBtnDiv" style="margin-top:0.1rem;">
					<button ontouchend="sub()">保存</button>
				</div>
				<div class="monthlyPay" style="margin-top:0.25rem;">
					最大充电时间<input type="number" id="maxTime" value="${regionArea.attr0 }">分钟
					<button ontouchend="saveTime()">保存</button>
				</div>
			</div>
			<!-- 计时模式--增加档位 -->
			<div class="comEditDiv addJiShiDiv">
				<div class="comInnerDiv">
					<span>最小功率：</span>
					<input type="text" class="comTxtInp" id="minPower" placeholder="请输入最小功率"/>
				</div>
					<div class="comInnerDiv">
					<span>最大功率：</span>
					<input type="text" class="comTxtInp" id="maxPower" placeholder="请输入最大功率"/>
				</div>
					<div class="comInnerDiv">
					<span>费<em></em>率：</span>
					<input type="text" class="comTxtInp" id="standard" placeholder="请输入费率"/>
				</div>
				<div class="addTwoBtnDiv fl">
					<button class="comTwoBtns tBt_cancel" ontouchend="closeAlert($('.addJiShiDiv'))">取消</button>
					<button class="comTwoBtns tBt_sure" ontouchend="add(1)">保存</button>
				</div>
			</div>
			<!-- 计次模式--增加档位 -->
			 <div class="comEditDiv addJiCiDiv">
				<div class="comInnerDiv">
					<span>最小功率：</span>
					<input type="text" class="comTxtInp" id="minPower2" placeholder="请输入最小功率"/>
				</div>
					<div class="comInnerDiv">
					<span>最大功率：</span>
					<input type="text" class="comTxtInp" id="maxPower2" placeholder="请输入最大功率"/>
				</div>
					<div class="comInnerDiv">
					<span>费<em></em>率：</span>
					<input type="text" class="comTxtInp" id="standard2" placeholder="请输入费率"/>
				</div>
				<div class="addTwoBtnDiv fl">
					<button class="comTwoBtns tBt_cancel" ontouchend="closeAlert($('.addJiCiDiv'))">取消</button>
					<button class="comTwoBtns tBt_sure" ontouchend="add(3)">保存</button>
				</div>
			</div> 
		</div>
		<div class="toast-wrap">
	        <span class="toast-msg"></span>
	    </div> 
		<div class="layer"></div>
		<!-- footer -->
		<jsp:include page="../../down.jsp">
			<jsp:param value="4" name="cmd"/>
		</jsp:include>
		<script src="${pageContext.request.contextPath }/weChat/jsPlugin/jquery.min.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath }/weChat/jsPlugin/tipInfo.js" type="text/javascript"></script>
		<script type="text/javascript">
			var setSta = '${sta}';
			$(function(){
				initData();
			});
			function initData(){
				var money = $("#money").val();
				var num = $("#num").val();
				var reArId = $("#reArId").val();
				if(money != "" && num != ""){
					$(".checkSpan").addClass("checkSpan_act");
					$(".inputLayer").hide();
					setSelFlag = false;
				}
				if(setSta == 0){
					selPattern();
				}
			}
			function selPattern(){
				$(".patternInp").each(function(i){
					$(this).click(function(){
						$(".cirSpan").find("b").remove();
						$(".rateSetCon").hide();
						$(this).prev().append('<b></b>');
						$("#payPattern").val($(this).val());
						$(".rateSetCon").eq(i).show();
						if(i == 0){//计时模式
							findNowPattern(i);
						}else if(i == 1){//计量模式
							findNowPattern(i);
						}else{//计次模式
							findNowPattern(i);
						}
					})
				});
			}
			//增加包月模式
			var setSelFlag = true;
			function setTimeArea(obj){
				if(setSelFlag){
					$(obj).addClass("checkSpan_act");
					$(".inputLayer").hide();
				}else{
					$(obj).removeClass("checkSpan_act");
					$(".inputLayer").show();
				}
				setSelFlag = !setSelFlag;
			}
			//检测设置优惠时间段复选框是否勾选
			function checkInpSel(){
				if($(".checkSpan_act").length == 0){
					toast("请先勾选包月模式");
					return;
				}
			}
			function findNowPattern(cmd){
                  var reArId=$("#reArId").val();
			/* 	$.ajax({
					method:'post',
					url:'${pageContext.request.contextPath}/weChat/findNowPattern.htm?chargeType='+cmd+'&reArId='+reArId,
				    success:function(data){
				    	if(cmd == 0){
				    		$("#div1").html(data);
				    	}else if(cmd == 1){
				    		$("#div2").html(data);
				    	}else if(cmd == 2){
				    		$("#div3").html(data);
				    	}
				    }
				})  */
			}
			//删除费率档位
			function del(id,reArId,fla){
				window.location.href="${pageContext.request.contextPath}/weChat/delDanWei.htm?id="+id+"&&reArId="+reArId+"&&fla="+fla;
			}
			//添加费率档位
			function add(typeCharge){
				var reArId=$("#reArId").val();//项目id
				if(typeCharge == '1'){//计时模式
					var minPower=$("#minPower").val();//最小功率
					var maxPower=$("#maxPower").val();//最大功率
					var standard=$("#standard").val();//计量标准
				}if(typeCharge == '3'){//计次模式
					var minPower=$("#minPower2").val();//最小功率
					var maxPower=$("#maxPower2").val();//最大功率
					var standard=$("#standard2").val();//计量标准
				}
				if(minPower == ""){
					toast("请填写最小功率");
				}else if(maxPower == ""){
					toast("请填写最大功率");
				}else if(standard == ""){
					toast("请填写收费标准");
				}else{
					if(minPower == 0){
						toast("最小功率不能为0");
					}else if(maxPower == 0){
						toast("最大功率不能为0");
					}else if(standard == 0){
						toast("收费标准不能为0");
					}else{
						if(minPower > maxPower){
							toast("最大功率不能小于最小功率");
							return;
						}
						toast("添加成功");
						window.location.href="${pageContext.request.contextPath}/weChat/addDanWei.htm?reArId="+reArId+"&&minPower="+minPower+"&&maxPower="+maxPower+"&&standard="+standard+"&&typeCharge="+typeCharge;
					}
				}
			}

			function sub() {//修改包月模式信息
				var money = $("#money").val();
				var num = $("#num").val();
				var reArId = $("#reArId").val();
				if($(".checkSpan_act").length == 0){
					toast("请先勾选包月模式");
					return;
				}
				if(money == ""){
					toast("收费标准不能为空");
					return;
				}else if(num == ""){
					toast("每月限制次数不能为空");
					return;
				}
				toast("编辑成功");
				setTimeout(function(){
					window.location.href="${pageContext.request.contextPath}/weChat/saveMonth.htm?money="+money+"&&num="+num+"&&reArId="+reArId;
				},1500);
			}
			
			//保存最大充电时长
			function saveTime(){
				var reArId=$("#reArId").val();
				var maxTime=$("#maxTime").val();
				if(maxTime == null || maxTime == ""){
					toast("请输入有效的时长");
				}else{
					if(isNaN(maxTime)){
						toast("请输入有效的时长");
						return false;
					}
					toast("保存成功");
					window.location.href="${pageContext.request.contextPath}/weChat/saveTime.htm?reArId="+reArId+"&&maxTime="+maxTime;
				}
			}
		</script>
	</body>
</html>
