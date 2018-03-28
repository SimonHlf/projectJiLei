<%@page pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>
<table class="table table-bordered table-striped table-condensed flip-content">
    <thead class="flip-content bordered-palegreen">
    <tr>
        <th width="44px;"><v:checkbox/></th>
      	<th>分类名称</th>
        <th>所属机构</th>
        <th>创建时间</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${quesTypeList}" var="QuesType">
                    <tr>
                        <td><v:checkbox value="${QuesType.id}"/></td>
                        <td>${QuesType.name}</td>
                        <td>${QuesType.orgName}</td>
                        <td>${QuesType.creat_time}</td>
                    </tr>
    </c:forEach>
    </tbody>
</table>
<v:paper page="${page}" url="QuesTypeController/getByFenYe.htm?1=1&pid=${pid}"></v:paper>