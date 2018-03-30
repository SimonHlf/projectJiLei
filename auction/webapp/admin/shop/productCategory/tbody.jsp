<%@page pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="v" tagdir="/WEB-INF/tags"%>
<script src="shop/attribute/attribute.js"></script>
<table
	class="table table-bordered table-striped table-condensed flip-content">
	<thead class="flip-content bordered-palegreen">
		<tr>
			<th width="44px;"><v:checkbox /></th>
			
			<th>类别名称</th>
			<th>类别图标</th>
			<th>备注</th>
			<th>排序</th>
			<th>描述</th>
			<th>操作</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${list}" var="productCategory">
			<tr>
				<td><v:checkbox value="${productCategory.id}" /></td>
				
				<td>${productCategory.shopTypeName}</td>
				<td><img src="/${productCategory.shopTypeLogo}" width="30px" height="30px"></td>
				<td>${productCategory.remarks}</td>
				<td>${productCategory.sort}</td>

				<td>${productCategory.description}</td>
				<td>
					<c:if test="${productCategory.parentId!=0}">
		            <button type="button" onclick="attributeManager(${productCategory.id})"
					class="btn  btn-info">属性管理</button>
					</c:if>
					<c:if test="${productCategory.parentId==0}">
		            	无
					</c:if>
	            </td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<%-- <v:page pages="${page.pageTotal}" curr="${page.page}"
	url="shop/productCategory/ztree.htm?id=${id}"></v:page> --%>
	<v:pagination page="${page}"
						url="shop/productCategory/ztree.htm?id=${id}"></v:pagination>