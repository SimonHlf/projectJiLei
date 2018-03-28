<%@page pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>
<table class="table relationUser table-bordered table-striped table-condensed flip-content">
    <thead class="flip-content bordered-palegreen">
    <tr>
        <th width="44px;"><v:checkbox /></th>
        <th>账号</th>
        <th>用户名</th>
        <th>所属部门</th>
        <th>创建时间</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${list}" var="user">
        <tr>
            <td>
                <c:choose>
                    <c:when test="${user.rid != 0}">
                        <v:checkbox value="${user.id}" bs="1"/>
                    </c:when>
                    <c:otherwise>
                        <v:checkbox value="${user.id}" bs="0"/>
                    </c:otherwise>
                </c:choose>
            </td>
            <td>${user.account}</td>
            <td>${user.name}</td>
            <td>${user.orgName}</td>
            <td>${user.add_time}</td>
        </tr>
    </c:forEach>

    </tbody>
</table>