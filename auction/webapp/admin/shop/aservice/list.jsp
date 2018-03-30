<%@page pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="v" tagdir="/WEB-INF/tags"%>
<script src="shop/aservice/aservice.js"></script>
<div class="btn-group">
	<button type="button" onclick="addService()" class="btn btn-info">
		<i class="fa fa-plus"></i> 添加
	</button>
	<button type="button" onclick="delService()" class="btn btn-danger">
		<i class="fa fa-minus"></i> 删除
	</button>
	<button type="button" onclick="editService()" class="btn btn-primary">
		<i class="fa fa-pencil"></i> 修改
	</button>
</div>
<div class="widget">
	<div class="widget-header bordered-bottom bordered-themeprimary">
        <span class="widget-caption themeprimary">
            <i class="widget-icon fa fa-tasks themeprimary"></i>
           服务说明列表</span>
    </div>
	<div class="widget-body">
		<div class="flip-scroll">
			<table
				class="table table-bordered table-striped table-condensed flip-content">
				<thead class="flip-content bordered-palegreen">
					<tr>
						<th width="44px;"><v:checkbox /></th>
						<th>服务名称</th>
						<th>描述</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="aservice">
						<tr>
							<td><v:checkbox value="${aservice.id}" /></td>
							<td>${aservice.serviceName}</td>
							<td>${aservice.description}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
                 <v:pagination page="${page}"
						url="shop/aservice/list.htm?1=1"></v:pagination>
		</div>
	</div>
</div>