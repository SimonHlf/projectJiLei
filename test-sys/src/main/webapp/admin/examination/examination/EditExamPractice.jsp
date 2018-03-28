<%@page pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>
<script type="text/javascript" src="assets/js/datetime/jedate.js"></script>
<link rel="stylesheet" type="text/css" href="assets/css/jedate.css">
<div class="widget model_widget">
    <div class="widget-body">
        <div id="horizontal-form">
            <form class="form-horizontal" method="post" id="editExamPractionForm">
                <input type="hidden" name="id" value="${Examination.id}">
                <div >
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">练习考试名称</label>
                        <div class="col-sm-3">
                            <input class="form-control" value="${Examination.examName}" id="examName" name="examName" placeholder="练习考试名称" required>
                        </div>
                        <label class="col-sm-2 control-label no-padding-right">试卷列表</label>
                        <div class="col-sm-3">
                            <v:creatlist type="creatId" id="creatId" value="${Examination.creatId}" name="creatId"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">开始时间</label>
                        <div class="col-sm-3">
                            <input class="form-control" id="startTime" value="${Examination.startTime}" name="startTime" type="text" placeholder="开始时间"
                                   onClick="jeDate({dateCell:'#startTime',isTime:true,format:'YYYY-MM-DD hh:mm'})" required
                                   readonly>
                        </div>
                        <label class="col-sm-2 control-label no-padding-right">结束时间</label>
                        <div class="col-sm-3">
                            <input class="form-control" id="endTime" value="${Examination.endTime}" name="endTime" type="text" placeholder="结束时间" required
                                   onClick="jeDate({dateCell:'#endTime',isTime:true,format:'YYYY-MM-DD hh:mm'})"
                                   readonly>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">是否启用</label>
                        <div class="col-sm-3">
                            <v:items type="examStatus" id="examStatus" value="${Examination.examStatus}" name="examStatus"/>
                        </div>
                        <label class="col-sm-2 control-label no-padding-right">所属机构</label>
                        <div class="col-sm-3">
                            <select name="orgId" id="orgId">
                                <c:forEach items="${orgList}" var="org">
                                    <c:choose>
                                        <c:when test="${Examination.orgId == org.id}">
                                            <option value="${org.id}" selected>${org.name}</option>
                                        </c:when>
                                        <c:otherwise>
                                            <option value="${org.id}">${org.name}</option>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">是否显示答案</label>
                        <div class="col-sm-3">
                            <v:items type="IsAnswerDisplay" id="IsAnswerDisplay" value="${Examination.attr0}" name="attr0"/>
                        </div>
                    </div>
                    <p align="center">
                        <button type="button" onclick="saveExamPractice()" class="btn btn-info">
                            保存
                        </button>
                        <button type="button" onclick="ajaxLoad('ExaminationController/list.htm','考试管理',this)" class="btn btn-default"> 返回</button>
                    </p>
                </div>
            </form>
        </div>
    </div>
</div>