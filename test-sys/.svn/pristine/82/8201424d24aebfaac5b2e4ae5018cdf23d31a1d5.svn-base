<%@page pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@taglib prefix="v" tagdir="/WEB-INF/tags" %> 
<table
	class="table table-bordered table-striped table-condensed flip-content">
	<thead class="flip-content bordered-palegreen">
		<tr>
			<th width="44px;"><v:checkbox /></th>
			<th>名称</th>
			<th>编码</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${nuList}" var="user">
			<tr>
				<td><v:checkbox value="${user.id}" bs="0"/></td>
				<td>${user.name}</td>
				<td>${user.code}</td>
			</tr>
		</c:forEach>
		<c:forEach items="${yuList}" var="user">
		<tr>
			<td><v:checkbox value="${user.id}" bs="1"/></td>
			<td>${user.name}</td>
			<td>${user.code}</td>
		</tr>
		</c:forEach>
	</tbody>
</table>
<%-- <v:pagination page="${page}" url="sys/menu/list.htm?1=1"></v:pagination> --%>