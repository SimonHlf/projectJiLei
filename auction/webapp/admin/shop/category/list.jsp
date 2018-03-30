<%@page pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="v" tagdir="/WEB-INF/tags"%>
<script src="shop/category/category.js"></script>
<div class="btn-group">
	<button type="button" onclick="addCategory()" class="btn btn-info">
		<i class="fa fa-plus"></i> 添加
	</button>
	<button type="button" onclick="delCategory()" class="btn btn-danger">
		<i class="fa fa-minus"></i> 删除
	</button>
	<button type="button" onclick="editCategory()" class="btn btn-primary">
		<i class="fa fa-pencil"></i> 修改
	</button>
	<button type="button" onclick="searchCategory()"
		class="btn btn-success">
		<i class="fa fa-search"></i> 查询
	</button>
</div>
<div style="margin-top: 6px;">
	<form id="searchCateGoryForm" method="post">
		<div class="row">
			<div class="form-group col-lg-4">
				<div class=" input-group">
					<span class="input-group-addon">按名字查找</span> <input type="text"
						name="name" value="${category.name}" class="form-control"
						placeholder="按名字查找">
				</div>
			</div>
		</div>
	</form>
</div>
<div class="widget">
	<div class="widget-header bordered-bottom bordered-themeprimary">
		<i class="widget-icon fa fa-tasks themeprimary"></i> <span
			class="widget-caption themeprimary">商品分类列表</span>
	</div>
	<div class="widget-body">
		<div class="flip-scroll">
			<table
				class="table table-bordered table-striped table-condensed flip-content">
				<thead class="flip-content bordered-palegreen">
					<tr>
						<th width="44px;"><v:checkbox /></th>
						<th>名称</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="category">
						<tr>
							<td><v:checkbox value="${category.id}" /></td>
							<td>${category.name}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<v:pagination page="${page}" url="sfb/category/list.htm?1=1"></v:pagination>
		</div>
	</div>
</div>