<%@page pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>


<div class="widget model_widget">
    <div class="widget-body">
        <div id="horizontal-form">
            <div>
                <form class="form-horizontal" method="post" id="addExaminationForm">
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">考试名称</label>
                        <div class="col-sm-3">
                            <input class="form-control" id="examName" name="examName" placeholder="考试名称" required>
                        </div>
                        <label class="col-sm-2 control-label no-padding-right">试卷列表</label>
                        <div class="col-sm-3">
                            <v:creatlist type="creatId" id="creatId" name="creatId"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">开始考试时间</label>
                        <div class="col-sm-3">
                            <input class="form-control" id="startTime" name="startTime" type="text" placeholder="开始考试时间"
                                   onClick="jeDate({dateCell:'#startTime',isTime:true,format:'YYYY-MM-DD hh:mm'})"
                                   required
                                   readonly>
                        </div>
                        <label class="col-sm-2 control-label no-padding-right">结束考试时间</label>
                        <div class="col-sm-3">
                            <%--<input type="datetime-local" class="form-control" name="endTime" placeholder="结束考试时间" required>--%>
                            <input class="form-control" id="endTime" name="endTime" type="text" placeholder="结束考试时间"
                                   required
                                   onClick="jeDate({dateCell:'#endTime',isTime:true,format:'YYYY-MM-DD hh:mm'})"
                                   readonly>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">是否启用</label>
                        <div class="col-sm-3">
                            <v:items type="examStatus" id="examStatus" name="examStatus"/>
                        </div>
                        <label class="col-sm-2 control-label no-padding-right">是否显示答案</label>
                        <div class="col-sm-3">
                            <v:items type="IsAnswerDisplay" id="IsAnswerDisplay" name="attr0"/>
                        </div>
                        <%--<label class="col-sm-2 control-label no-padding-right">所属机构</label>
                        <div class="col-sm-3">
                            <select name="orgId" id="orgId">
                                <c:forEach items="${orgList}" var="org">
                                    <option value="${org.id}">${org.name}</option>
                                </c:forEach>
                            </select>
                        </div>--%>
                        <%--<label class="col-sm-2 control-label no-padding-right">补考试卷</label>
                        <div class="col-sm-3">
                            <v:creatlist type="attr6" id="attr6" name="attr6"/>
                        </div>--%>
                    </div>
                    <%--<div class="form-group">

                        <label class="col-sm-2 control-label no-padding-right">是否显示答案</label>
                        <div class="col-sm-3">
                            <v:items type="IsAnswerDisplay" id="IsAnswerDisplay" name="attr0"/>
                        </div>
                        &lt;%&ndash;<label class="col-sm-2 control-label no-padding-right">考试类型</label>
                        <div class="col-sm-3">
                            <v:items type="examType" id="examType" name="attr7"/>
                        </div>&ndash;%&gt;
                    </div>--%>
                </form>
                <%--<div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right"></label>
                    <div&lt;%&ndash; class="col-sm-1"&ndash;%&gt;>
                       &lt;%&ndash; <button type="button" onclick="openAddFrontUser(1)" class="btn btn-info">
                            下一步
                        </button>&ndash;%&gt;
                        <button type="button" onclick="addExam()" class="btn btn-info">
                            确定
                        </button>
                        <button type="button" onclick="ajaxLoad('ExaminationController/list.htm','考试管理',this)"
                                class="btn btn-default"> 返回
                        </button>
                    </div>
                </div>--%>
            </div>

        </div>
    </div>
</div>