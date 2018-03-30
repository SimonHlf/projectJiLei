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
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/weChat/Module/setting/css/rateSetting.css"/>
	</head>
	<body>
		<div class="rateSet">
			<strong class="comStrongTit">费率查看</strong>
			<p class="areaName">${regionName }-${regionArea.name }</p>
			<div class="innerRateSet">
				<input type="hidden" id="payPattern" value="0" />
				<div class="rateSetNav">
				<c:if test="${chargeType == '0' }">
					<label class="comLabel" for="timePattern">
						<span class="cirSpan"><b></b></span>
						<input id="timePattern" class="patternInp" type="radio" name="patternPay" value="0" />
						<span>计时模式</span>
					</label>
				</c:if>
				<c:if test="${chargeType == '1' }">
					<label class="comLabel" for="meterPattern">
						<span class="cirSpan"></span>
						<input id="meterPattern" class="patternInp" type="radio" name="patternPay" value="1" />
						<span>计量模式</span>
					</label>
				</c:if>
				<c:if test="${chargeType == '2' }">
					<label class="comLabel" for="jiciPattern">
						<span class="cirSpan"></span>
						<input id="jiciPattern" class="patternInp" type="radio" name="patternPay" value="2" />
						<span>计次模式</span>
					</label>
				</c:if>
				</div>
				<!-- 计时模式 -->
				<c:if test="${chargeType == '0' }">
				<div class="rateSetCon timePatternCon" style="display: block;">
					<p class="rateInfo"><span></span>最小和最大功率值关联配置参数</p>
					<ul>
						<c:forEach items="${reRateList }" var="reRate">
							<li>
								<input class="wattInp" type="number" value="${reRate.minPower }" style="color:#000;" disabled/>瓦&nbsp;至&nbsp;<input class="wattInp" type="number" value="${reRate.maxPower }" style="color:#000;" disabled/>瓦&nbsp;<input class="payMoneyInp" type="number" value="${reRate.standard }" style="color:#000;" disabled/>元/小时
							</li>
						</c:forEach>
					</ul>
				</div>
				</c:if>
				<!-- 计量模式 -->
				<c:if test="${chargeType == '1' }">
				<div class="rateSetCon meterPatternCon">
					<p class="meterP">
						<input type="number" readonly />元/KWh
					</p>
				</div>
				</c:if>
				<!-- 计次模式 -->
				<c:if test="${chargeType == '2' }">
				<div class="rateSetCon jiciPatternCon">
					<p class="rateInfo"><span></span>最小和最大功率值关联配置参数</p>
					<ul>
						<c:forEach items="${reRateList }" var="reRate">
							<li>
								<input class="wattInp" type="number" style="color:#000;" disabled value="${reRate.minPower }"/>瓦&nbsp;至&nbsp;<input class="wattInp"  style="color:#000;" disabled type="number" value="${reRate.maxPower }"/>瓦&nbsp;<input class="payMoneyInp"  style="color:#000;" disabled type="number" value="${reRate.standard }"/>元/次
							</li>
						</c:forEach>
					</ul>
				</div>
				</c:if>
				<p class="comSetP">
					<span class="comSetTit">包月模式</span>
					<label>
						<input type="checkbox" />
						<span class="checkSpan checkSpan_act posT"><em></em></span>
					</label>
				</p>
				<div class="monthlyPay">
					收费标准<input type="number" id="money" style="color:#000;" disabled value="${month.money }"/>元/月&nbsp;每月限制<input type="number" style="color:#000;" disabled id="num" value="${month.num }"/>次
				</div>
			</div>
		</div>
		<!-- footer -->
		<jsp:include page="../../down.jsp">
			<jsp:param value="4" name="cmd"/>
		</jsp:include>
		<script src="${pageContext.request.contextPath }/weChat/jsPlugin/jquery.min.js" type="text/javascript"></script>
		<script type="text/javascript">
			$(function(){
				selPattern();
			});
			function selPattern(){
				$(".patternInp").each(function(i){
					$(this).click(function(){
						$(".cirSpan").find("b").remove();
						$(".rateSetCon").hide();
						$(this).prev().append('<b></b>');
						$("#payPattern").val($(this).val());
						$(".rateSetCon").eq(i).show();
					})
				});
			}
		</script>
	</body>
</html>
