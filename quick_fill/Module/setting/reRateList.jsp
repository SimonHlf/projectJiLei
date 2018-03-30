<%@page pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="v" tagdir="/WEB-INF/tags"%>
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
					</c:if>
				</div>
				<!-- 计时模式 -->
				<c:if test="${chargeType == '1' }">
				<div class="rateSetCon timePatternCon" style="display: block;" id="div1">
					<p class="rateInfo"><span></span>最小和最大功率值关联配置参数</p>
					<ul id="addli1">
					<c:forEach items="${reRateList }" var="reRate">
					<li>
							<input class="wattInp" type="number" value="${reRate.minPower }">瓦&nbsp;至&nbsp;<input class="wattInp" type="number" value="${reRate.maxPower }">瓦&nbsp;<input class="payMoneyInp" type="number" value="${reRate.standard }">元/小时
							<button onclick="del('${reRate.id}','${reArId }','1')"><em class="delIcon"></em></button>
						</li>
					</c:forEach>
					</ul>
					<div class="addBtnDiv" onclick="comEditShowAlert('addJiShiDiv')"><button>增加档位</button></div>
				</div>
				</c:if>
				<!-- 计量模式 -->
				<c:if test="${chargeType == '2' }">
				<div class="rateSetCon meterPatternCon" id="div2">
					<p class="meterP">
						<input type="number" />元/KWh
					</p>
				</div>
				</c:if>
				<!-- 计次模式 -->
				<c:if test="${chargeType == '3' }">
				<div class="rateSetCon jiciPatternCon" id="div3">
					<p class="rateInfo"><span></span>最小和最大功率值关联配置参数</p>
					<ul id="addli2">
					<c:forEach items="${reRateList }" var="reRate">
					<li>
							<input class="wattInp" type="number" value="${reRate.minPower }">瓦&nbsp;至&nbsp;<input class="wattInp" type="number" value="${reRate.maxPower }">瓦&nbsp;<input class="payMoneyInp" type="number" value="${reRate.standard }">元/次
							<button onclick="del('${reRate.id}','${reArId }','2')"><em class="delIcon"></em></button>
						</li>
					</c:forEach>
					</ul>
					<div class="addBtnDiv" onclick="comEditShowAlert('addJiShiDiv')"><button>增加档位</button></div>
				</div>
				</c:if>
				</div>
