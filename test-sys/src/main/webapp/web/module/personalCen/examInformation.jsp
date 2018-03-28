<%@page pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>
	<!-- 考试信息 -->
	<div class="comNavConPart">
		<strong>即将参加的考试</strong>
		<!-- 查询层 -->
		<div class="searDiv">
			<input type="text" id="searchByname" placeholder="请输入考试名称">
			<button onclick="chaxun()">查询</button>
		</div>
		<div class="listNavCon"> 
			<ul class="headNavCon clearfix">
				<li class="oneLiWid">考试名称</li>
				<li class="oneLiWid">试卷名称</li>
				<li class="oneLiWid">开考时间</li>
				<li class="oneLiWid">截止时间</li>
				<li class="fourLiWid">考试时长</li>
				<li class="fourLiWid">考试次数</li>
				<li class="fourLiWid">已考次数</li>
				<li class="fourLiWid">开始考试</li>
			</ul>  
			<ul class="mainListCon clearfix">
				<c:forEach items="${paperCreatList}" var="paperCreat">
					<li>
					<p class="oneLiWid ellip">${paperCreat.exam_name}</p>
					<p class="oneLiWid ellip">${paperCreat.paperName}</p>
					<p class="oneLiWid ellip">${paperCreat.start_time}</p>
					<p class="oneLiWid ellip">${paperCreat.end_time}</p>
					<p class="fourLiWid">${paperCreat.exam_time}分钟</p>
					<p class="fourLiWid">${paperCreat.exam_use}次</p>
					<p class="fourLiWid">${paperCreat.times}</p>
					<!-- <p class="fourLiWid">209</p> -->
					<p class="fourLiWid">
						<a href="javascript:startTest(${paperCreat.ins_id},${paperCreat.id},${paperCreat.examId})">开始考试</a>
					</p>
				</li>
				</c:forEach>
			</ul>
		</div>
	</div>
	<script type="text/javascript" src="${pageContext.request.contextPath}/web/jsPlugin/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/web/module/personalCen/js/personalCen.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/web/module/personalCen/js/personalTestInfor.js"></script>
	<script type="text/javascript">
		$(function() {
			checkHeight();
		});
	</script>
<!-- </body> -->