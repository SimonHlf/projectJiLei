<%@page pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="v" tagdir="/WEB-INF/tags"%>
<script
	src="${pageContext.request.contextPath }/admin/news/type/type.js"></script>
<div class="btn-group">
	<button type="button" onclick="addType()" class="btn btn-info">
		<i class="fa fa-plus"></i> 添加
	</button>
	<button type="button" onclick="delType()" class="btn btn-danger">
		<i class="fa fa-minus"></i> 删除
	</button>
	<button type="button" onclick="editType()" class="btn btn-primary">
		<i class="fa fa-pencil"></i> 修改
	</button>
	<button type="button" onclick="findByName()" class="btn btn-success">
		<i class="fa fa-search"></i> 查询
	</button>
</div>
<div style="margin-top:6px;">
	<form action="" id="searchNewsTypeForm">
		<div class="row">
			<div class="form-group col-lg-4">
				<div class=" input-group">
					<span class="input-group-addon">按名字查找</span>
					<input type="text" name="name" value="${newsType.name}" class="form-control" placeholder="按名字查找">
				</div>
			</div>
		</div>
	</form>
</div>
<div class="widget" id="table">
	<div class="widget-header  with-footer">
		<span class="widget-caption"> <i class="fa fa-list"></i> 信息分类
		</span>
	</div>
	<div class="widget-body">
		<div class="flip-scroll">
			<table class="table table-bordered table-striped table-condensed flip-content">
				<thead class="flip-content bordered-palegreen">
					<tr>
						<th width="44px;"><v:checkbox/></th>
						<th>名称</th>
						<th>编码</th>
						<th>图标</th>
						<th>排序值</th>
						<th>描述</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="Type">
						<tr>
							<td><v:checkbox value="${Type.id}" /></td>
							<td><a onclick="details(${Type.id})">${Type.name}</a></td>
							<td>${Type.code}</td>
							<td>${Type.icon}</td>
							<td>${Type.display}</td>
							<td>${Type.remark}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<v:pagination page="${page}" url="news/type/list.htm?1=1"></v:pagination>
		</div>
	</div>
</div>