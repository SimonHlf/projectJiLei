<%@page pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="v" tagdir="/WEB-INF/tags"%>
<script src="auction/metaModel/metaModel.js"></script>
<table
						class="table table-bordered table-striped table-condensed flip-content">
						<thead class="flip-content bordered-palegreen">
							<tr>
								<th width="44px;"><v:checkbox /></th>
								<th>模块名称</th>
							</tr>
						</thead>
						<tbody id="tbody">
							<c:forEach items="${list}" var="n">
								<tr>
									<td><v:checkbox value="${n.id}" /></td>
									<td>${n.modelname}</td>
 								</tr>
							</c:forEach>
						</tbody>
					</table>
					<v:pagination page="${page}" url="shop/metaModelController/ztree.htm?id=${id}"></v:pagination>