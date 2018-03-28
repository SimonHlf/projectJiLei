<%@page pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>
<script type="text/javascript" src="assets/js/datetime/jedate.js"></script>
<link rel="stylesheet" type="text/css" href="assets/css/jedate.css">
<script src="examination/paperCreat/paperCreat.js"></script>
<div class="widget model_widget">
    <div class="widget-body">
        <div id="horizontal-form">
            <form class="form-horizontal" method="post" id="addExaminationForm">
                <div>
                    <c:forEach items="${list }" var="exam">
                        <div class="form-group">
                            <label class="col-sm-2 control-label no-padding-right">考试名称</label>
                            <div class="col-sm-9">
                                <p>${exam.exam_name}</p>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label no-padding-right">试卷名称</label>
                            <div class="col-sm-9">
                                <p>${exam.creatName} &nbsp;&nbsp;
                                    <a href="javascript:yulan(${exam.creat_id},${exam.sets})">试卷预览</a>
                                   <%-- <c:choose>
                                        <c:when test="${exam.sets == 0}">
                                            自动生成试卷暂不支持预览
                                        </c:when>
                                        <c:otherwise>
                                            <a href="javascript:yulan(${exam.creat_id})">试卷预览</a>
                                        </c:otherwise>
                                    </c:choose>--%>
                                </p>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label no-paddin g-right">所属组织</label>
                            <div class="col-sm-9">
                                <p>${exam.orgName}</p>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label no-padding-right">开始考试时间</label>
                            <div class="col-sm-9">
                                <p>${exam.start_time}</p>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label no-padding-right">结束考试时间</label>
                            <div class="col-sm-9">
                                <p>${exam.end_time}</p>
                            </div>
                        </div>
                       <%-- <div class="form-group">
                            <label class="col-sm-2 control-label no-padding-right">考试类型</label>
                            <div class="col-sm-9">
                                <p>
                                  <c:choose>
                                      <c:when test="${exam.attr7 == 0}">
                                        练习
                                      </c:when>
                                      <c:otherwise>
                                        考试
                                      </c:otherwise>
                                  </c:choose>
                                </p>
                            </div>
                        </div>--%>
                        <div class="form-group">
                            <label class="col-sm-2 control-label no-padding-right">考试状态</label>
                            <div class="col-sm-9">
                                <p>
                                    <c:choose>
                                        <c:when test="${exam.exam_status == 0}">
                                            未启用
                                        </c:when>
                                        <c:otherwise>
                                            启用
                                        </c:otherwise>
                                    </c:choose>
                                </p>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label no-padding-right">是否显示答案</label>
                            <div class="col-sm-9">
                                <p>
                                    <c:choose>
                                        <c:when test="${exam.attr0 == 0}">
                                            不显示
                                        </c:when>
                                        <c:otherwise>
                                            显示
                                        </c:otherwise>
                                    </c:choose>
                                </p>
                            </div>
                        </div>

                    </c:forEach>
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right"></label>
                        <div class="col-sm-3">
                            <button type="button" onclick="ajaxLoad('ExaminationController/list.htm?page=${page.page}','考试管理',this)"
                                    class="btn btn-default"> 返回
                            </button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
