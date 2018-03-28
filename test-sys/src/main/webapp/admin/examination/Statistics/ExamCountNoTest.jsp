<%@page pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>
<%-- 未考 --%>
<button type="button" onclick="importShouldExamExcel(${examId},0)" class="btn btn-primary">
    <i class="fa fa-download"></i> 导出 Excel
</button>
<div class="widget-body">
    <div class="flip-scroll">
        <table class="table table-bordered table-striped table-condensed flip-content">
            <thead class="flip-content bordered-palegreen">
            <tr>
                <th>考试名称</th>
                <th>所属机构</th>
                <th>考生名称</th>
                <th>考生工号</th>
                <th>考生手机号</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${list}" var="statis">
                <tr>
                    <td title="${statis.exam_name}">${statis.exam_name}</td>
                    <td title="${statis.orgName}">${statis.orgName}</td>
                    <td title="${statis.nick_name}">${statis.nick_name}</td>
                    <td title="${statis.attr0}">${statis.attr0}</td>
                    <td title="${statis.cell_phone}">${statis.cell_phone}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <v:pagination page="${page}" url="statistics/TherealDetails.htm?cmd=${cmd}&examId=${examId}&mark=${mark}&currPage=${currPage}"/>
        <div>
            <button type="button" onclick="LoadHtmlList(${mark},${currPage})"
                    class="btn btn-default"> 返回
            </button>
        </div>
    </div>
</div>