<%@page pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="v" tagdir="/WEB-INF/tags"%>
<script src="shop/evaluationTag/evaluationTag.js"></script>
<div class="btn-group">
	<button type="button" onclick="addEvaluationTag()" class="btn btn-info">
		<i class="fa fa-plus"></i> 添加
	</button>
	<button type="button" onclick="delEvaluationTag()" class="btn btn-danger">
		<i class="fa fa-minus"></i> 删除
	</button>
	<button type="button" onclick="editEvaluationTag()" class="btn btn-primary">
		<i class="fa fa-pencil"></i> 修改
	</button>
</div>
<div class="widget">
	<div class="widget-header  with-footer">
		<span class="widget-caption"> <i class="fa fa-list"></i> 服务说明列表
		</span>
	</div>
	<div class="widget-body">
		<div class="flip-scroll">
			<table
				class="table table-bordered table-striped table-condensed flip-content">
				<thead class="flip-content bordered-palegreen">
					<tr>
						<th width="44px;"><v:checkbox /></th>
						<th>名字</th>
						<th>添加人</th>
						<th>添加时间</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="evaluationTag">
						<tr>
							<td><v:checkbox value="${evaluationTag.id}" /></td>
							<td>${evaluationTag.tagName}</td>
							<td>${evaluationTag.creater}</td>
							<td>${evaluationTag.createTime}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
                 <v:pagination page="${page}"
							   url="shop/evaluationTag/list.htm?1=1"></v:pagination>
		</div>
	</div>
</div>