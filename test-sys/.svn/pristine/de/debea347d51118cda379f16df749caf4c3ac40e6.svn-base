<%@page pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="examination/examination/examination.js"></script>
<script src="examination/Statistics/statistics.js"></script>
<div class="col-lg-10 col-sm-10 col-xs-10" id="menuBody">
    <table class="table table-bordered table-striped table-condensed flip-content">
        <thead class="flip-content bordered-palegreen">
        <tr>
            <th width="44px;"><v:checkbox/></th>
            <th>考试名称</th>
            <th>所属机构</th>
            <th>试卷名称</th>
            <th>应考人数(人)</th>
            <th>已考人数(人)</th>
            <th>未考人数(人)</th>
            <th>添加考生</th>
            <th>是否显示答案</th>
            <th>是否启用</th>
            <th>详情</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${list}" var="Examination">
            <tr>
                <td><v:checkbox value="${Examination.id}"/></td>
                <td title="${Examination.exam_name}">${Examination.exam_name}</td>
                <td title="${Examination.orgName}">${Examination.orgName}</td>
                <td title="${Examination.creatName}">${Examination.creatName}</td>

                <td title="${Examination.TotalNumber}"><a
                        href="javascript:TherealDetails(1,${Examination.id},1)">${Examination.TotalNumber}</a>
                </td>
                <td title="${Examination.ActualTOTAL}"><a
                        href="javascript:TherealDetails(2,${Examination.id},1)">${Examination.ActualTOTAL}</a>
                </td>
                <td title="<fmt:formatNumber value="${Examination.TotalNumber - Examination.ActualTOTAL.intValue() }"/>">
                    <a href="javascript:TherealDetails(3,${Examination.id},1)"><fmt:formatNumber
                            value="${Examination.TotalNumber - Examination.ActualTOTAL.intValue() }"/></a>
                </td>
                <td>
                    <a href="javascript:openExamOrFrontUser(2,'${Examination.id}','${Examination.org_id}');">添加考生</a>
                </td>
                <td>
                    <c:choose>
                        <c:when test="${Examination.attr0 == 0}">
                            <select onchange="AnswerDisplay(1,${Examination.id})">
                                <option value="0" selected>不显示</option>
                                <option value="1">显示</option>
                            </select>
                        </c:when>
                        <c:otherwise>
                            <select onchange="AnswerDisplay(0,${Examination.id})">
                                <option value="0">不显示</option>
                                <option value="1" selected>显示</option>
                            </select>
                        </c:otherwise>
                    </c:choose>
                </td>
                <td>
                    <c:choose>
                        <c:when test="${Examination.exam_status == 0}">
                            <select onchange="EnableorNotEnable(1,${Examination.id})">
                                <option value="0" selected>不启用</option>
                                <option value="1">启用</option>
                            </select>
                        </c:when>
                        <c:otherwise>
                            <select onchange="EnableorNotEnable(0,${Examination.id})">
                                <option value="0">不启用</option>
                                <option value="1" selected>启用</option>
                            </select>
                        </c:otherwise>
                    </c:choose>
                </td>
                <td><a href="javascript:Examdetails(${Examination.id})">详情</a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <input type="hidden" id="examPage" value="${page.page}">
    <v:pagination page="${page}" url="ExaminationController/list.htm?1=1&examName=${examName}"></v:pagination>
</div>