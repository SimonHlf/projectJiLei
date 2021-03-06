<%@page pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<table class="table table-bordered table-striped table-condensed flip-content">
    <thead class="flip-content bordered-palegreen">
    <tr>
        <th width="44px;"><v:checkbox/></th>
        <th>考试名称</th>
        <th>试卷名称</th>
        <th>所属部门</th>
        <th>应考</th>
        <th>实考</th>
        <th>未考</th>
        <th>及格人数</th>
        <th>不及格人数</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${list}" var="therealTest">
        <tr>
            <td><v:checkbox value="${therealTest.id}"/></td>
            <td title="${therealTest.exam_name}">${therealTest.exam_name}</td>
            <td title="${therealTest.creatName}">${therealTest.creatName}</td>
            <td title="${therealTest.orgName}">${therealTest.orgName}</td>
            <td title="${therealTest.TotalNumber}"><a
                    href="javascript:TherealDetails(1,${therealTest.id},2)">${therealTest.TotalNumber}</a></td>
            <td title="${therealTest.ActualTOTAL}"><a
                    href="javascript:TherealDetails(2,${therealTest.id},2)">${therealTest.ActualTOTAL}</a></td>
            <td title="<fmt:formatNumber value="${therealTest.TotalNumber - therealTest.ActualTOTAL.intValue() }"/>">
                <a href="javascript:TherealDetails(3,${therealTest.id},2)">
                    <fmt:formatNumber value="${therealTest.TotalNumber - therealTest.ActualTOTAL.intValue() }"/></a>
            </td>
            <td title="${therealTest.passPeople}"><a
                    href="javascript:TherealDetails(4,${therealTest.id},2)">${therealTest.passPeople}</a></td>
            <td title="${therealTest.failPeople}"><a
                    href="javascript:TherealDetails(5,${therealTest.id},2)">${therealTest.failPeople}</a></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<input type="hidden" id="thereaPage" value="${page.page}">
<v:paper page="${page}" url="statistics/therealTestTbody.htm?1=1&orgId=${orgId}"/>
