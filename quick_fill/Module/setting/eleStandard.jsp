<%@page pageEncoding="utf-8" %>
<div id="eleStandard">
			<p class="comSetP">
				<span class="comSetTit">电费标准</span>
				<input class="numInp" id=eleStan type="number" value="${region.electricityStandard }"/>
				<span>元/KWh</span>
				<button class="addDisLi" onclick="saveEleStandard()">保存</button>
			</p>
			</div>