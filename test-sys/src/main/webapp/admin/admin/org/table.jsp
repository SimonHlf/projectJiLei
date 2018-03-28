<%@page pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>
<table class="table table-bordered table-striped table-condensed flip-content">
    <thead class="flip-content bordered-palegreen">
    <tr>
        <th width="44px;">
            <v:checkbox/>
        </th>
        <th>
            名称
        </th>
        <%--<th>
            编码
        </th>--%>
        <th>
            描述
        </th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${list}" var="org">
        <tr>
            <td>
                <v:checkbox value="${org.id}"/>
            </td>
            <td>
                    ${org.name}
            </td>
            <%--<td>
                    ${org.code}
            </td>--%>
            <td>
                    ${org.remark}
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<v:paper page="${page}" url="org/tbody.htm?1=1&orgId=${orgId}&level=${level}"></v:paper>