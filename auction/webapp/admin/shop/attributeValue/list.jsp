<%@page pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="v" tagdir="/WEB-INF/tags"%>
<script src="shop/attributeValue/attributeValue.js"></script>
<div class="btn-group">
	<button type="button" onclick="addAttributeValue(${aid})"
		class="btn btn-info">
		<i class="fa fa-plus"></i> 添加
	</button>
	<button type="button" onclick="delAttributeValue()"
		class="btn btn-danger">
		<i class="fa fa-minus"></i> 删除
	</button>
	<button type="button" onclick="editAttributeValue(${aid})"
		class="btn btn-primary">
		<i class="fa fa-pencil"></i> 修改
	</button>
	<button type="button" onclick="callback(${cid})"
		class="btn btn-info">
		 返回
	</button>
</div>
<div class="widget">
	<div class="widget-header  with-footer">
		<span class="widget-caption"> <i class="fa fa-list"></i> 属性值管理
		</span>
	</div>
	<div class="widget-body">
		<div class="flip-scroll">
			<table
				class="table table-bordered table-striped table-condensed flip-content">
				<thead class="flip-content bordered-palegreen">
					<tr>
						<th width="44px;"><v:checkbox /></th>
						<th>类别</th>
						<th>属性</th>
						<th>属性值名称</th>
						<th>状态</th>
						<th>创建时间</th>
						<th>修改时间</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="attrval">
						<tr>
							<td><v:checkbox value="${attrval.id}" /></td>
							<td>${attrval.cName}</td>
							<td><v:attr aid="${attrval.attrId}" type="false"></v:attr> </td>
							<td>${attrval.valueName}</td>
							<td>
							<c:if test="${attrval.status==0}">无效</c:if>
							<c:if test="${attrval.status==1}">有效</c:if>
							</td>
							<td>${attrval.createTime}</td>
							<td>${attrval.updateTime}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		 	 <v:pagination page="${page}"
						  url="shop/attributeValue/list.htm?1=1"></v:pagination>
		</div>
	</div>
</div>