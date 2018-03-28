<%@page pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>
<c:choose>
    <c:when test="${empty list}">
        <br>
        <br>
        <p align="center">暂无信息</p>
        <br>
        <br>
    </c:when>
    <c:otherwise>
        <table class="table table-bordered table-striped table-condensed flip-content">
            <thead class="flip-content bordered-palegreen">
            <tr>
                <th width="44px;"><v:checkbox/></th>
                <th>账号</th>
                <th>名称</th>
                <%--<th>昵称</th>--%>
                <th>手机号</th>
                <th>邮箱</th>
                <th>所属部门</th>
                <th>角色</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${list}" var="user">
                        <tr>
                            <td>
                                <v:checkbox value="${user.id}"/>
                            </td>
                            <td>
                                ${user.account}
                            </td>
                            <td>
                               <a onclick="details(${user.id})"> ${user.name}</a>
                            </td>
                            <%--<td>
                                ${user.nickName}
                            </td>--%>
                            <td>
                                ${user.mobile}
                            </td>
                            <td>
                                ${user.email}
                            </td>
                            <td>${user.orgName}</td>
                            <td>${user.roleName}</td>
                        </tr>
                    </c:forEach>
            </tbody>
        </table>
        <input type="hidden" id="FrontUserPage" value="${page.page}">
        <v:pagination page="${page}" url="user/ztreeMenuTable.htm?1=1&orgId=${orgId}"></v:pagination>
    </c:otherwise>
</c:choose>
