<%@page pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>
<script src="web/module/personalCen/js/personalTestInfor.js"></script>
<!-- 查询层 -->
<div class="searDiv">
    <input type="text" id="paperCreatName" placeholder="请输入考试名称">
    <button onclick="chakanBukao()">查询</button>
</div>
<div class="listNavCon">
    <ul class="headNavCon clearfix">
        <li class="oneLiWid">考试名称</li>
        <li class="oneLiWid">试卷名称</li>
        <li class="oneLiWid">考试时间</li>
        <li class="fiveLiWid">考试时长</li>
        <li class="fiveLiWid">详情</li>
    </ul>
    <ul class="mainListCon clearfix">
        <c:forEach items="${recordList}" var="record">
            <li>
            <p class="oneLiWid ellip">${record.exam_name }</p>
                <p class="oneLiWid ellip">${record.paperCreatName}</p>
                 
                <p class="oneLiWid">${record.change_time}</p>
                <p class="fiveLiWid">${record.exam_time}分钟</p>
                <p class="fiveLiWid">
                    <a href="javascript:lookDetail(${record.id})">查看</a>
                </p>
            </li>
        </c:forEach>
    </ul>
    <v:webpage url="PaperCreatFontCountroller/getPaperCreatNow.htm?1=1" page="${page }"/>
</div>



