<%@page pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="v" tagdir="/WEB-INF/tags"%>
<script src="shop/attribute/attribute.js"></script>
<script src="shop/attributeValue/attributeValue.js"></script>
<div class="btn-group">
	<button type="button" onclick="addAttribute(${cid})" class="btn btn-info">
		<i class="fa fa-plus"></i> 添加
	</button>
	<button type="button" onclick="delAttribute()" class="btn btn-danger">
		<i class="fa fa-minus"></i> 删除
	</button>
	<button type="button" onclick="editAttribute(${cid})" class="btn btn-primary">
		<i class="fa fa-pencil"></i> 修改
	</button>
	<button type="button" onclick="callBack()"
		class="btn btn-success">
		 返回
	</button>
</div>
<div class="widget">
	<div class="widget-header  with-footer">
		<span class="widget-caption"> <i class="fa fa-list"></i> 属性管理
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
						<th>名字</th>
						<th>状态</th>
						<th>创建时间</th>
						<th>修改时间</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="attribute">
						<tr>
							<td><v:checkbox value="${attribute.id}" /></td>
							<td><v:productcate  type="false"  aid="${attribute.cid}"></v:productcate>  </td>
							<td>${attribute.attrName}</td>
							<td>
								<c:if test="${attribute.status==0}">无效</c:if>
								<c:if test="${attribute.status==1}">有效</c:if>
							</td>
							<td>${attribute.createTime}</td>
							<td>${attribute.updateTime}</td>
							<td>
							<button type="button" onclick="attributeValueManager('${attribute.id}','${cid}')" class="btn  btn-info">属性值管理</button>
							</td>	
						</tr>
					</c:forEach>
				</tbody>
			</table>
                 <v:pagination page="${page}"
							   url="shop/attribute/list.htm?1=1"></v:pagination>
		</div>
	</div>
</div>