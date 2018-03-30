<%@page pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="v" tagdir="/WEB-INF/tags"%>
<div class="timePart">
	<div class="startDiv">
		<span>起：</span>
		<input id="startTimeInp" value="${createState }" name="startTime" type="text" placeholder="请选择起始时间" readonly/>
		<span class="inputLayer" onclick="checkInpSel()" style="display:none;"></span>
	</div>
	<div class="endDiv">
		<span>至：</span>
		<input id="endTimeInp" value="${endState }" name="endTime" type="text" placeholder="请选择截止时间" readonly/>
		<span class="inputLayer" onclick="checkInpSel()" style="display:none;"></span>
	</div>
</div>