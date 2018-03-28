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
        <th>
            图标
        </th>
        <th>
            类型
        </th>
        <th>
            url
        </th>
        <th>
            状态
        </th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${list}" var="menu">
        <tr>
            <td>
                <v:checkbox value="${menu.id}"/>
            </td>
            <td>
                    ${menu.name}
            </td>
            <td>
                    ${menu.icon}
            </td>
            <td>
                    ${menu.type}
            </td>
            <td>
                    ${menu.url}
            </td>
            <td>
                    ${menu.flag}
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<v:pagination page="${page}" url="menu/list.htm?1=1"></v:pagination>