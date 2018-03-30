<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="v" tagdir="/WEB-INF/tags"%>
<script src="news/news/news.js"></script>
<style type="text/css">
.datalist tr:hover, .datalist tr.altrow {
	background-color: #c4e4ff;
}

.mytable {
	table-layout: fixed;
	width: 98% border:0px;
	margin: 0px;
}

.mytable tr td {
	text-overflow: ellipsis;
	-moz-text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
	border: 1px solid;
	text-align: left
}
</style>
<div class="btn-group">
	<button type="button" onclick="addNews()" class="btn btn-info">
		<i class="fa fa-plus"></i> 添加
	</button>
	<button type="button" onclick="delNews()" class="btn btn-danger">
		<i class="fa fa-minus"></i> 删除
	</button>
	<button type="button" onclick="editNews()" class="btn btn-primary">
		<i class="fa fa-pencil"></i> 修改
	</button>
	<button type="button" onclick="selectNews()" class="btn btn-success">
		<i class="fa fa-search"></i> 查询
	</button>
</div>
<div class="widget">
	<div class="widget-header bordered-bottom bordered-themeprimary">
        <span class="widget-caption themeprimary">
            <i class="widget-icon fa fa-tasks themeprimary"></i>
           新闻列表</span>
    </div>
	<div class="widget-body">
		<div class="flip-scroll">
			<!--  table-striped   -->
			<table
				class="mytable table table-bordered table-condensed flip-content datalist toggleClass">
				<thead class="flip-content bordered-palegreen">
					<tr>
						<th width="44px;"><v:checkbox /></th>
						<th>标题</th>
						<th>分类</th>
						<th>内容</th>
						<th>标识</th>
						<th>状态</th>
						<th>是否置顶</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="news">
						<tr ondblclick="tagscheck(this,${news.id});">
							<td><v:checkbox value="${news.id}" /></td>
							<td>${news.title}</td>
							<td>${news.type}</td>
							<td>${news.content }</td>
							<td>${news.label}</td>
							<td>${news.status}</td>
							<td>${news.is_top}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<v:page pages="${page.pageTotal}" curr="${page.page}"
				url="news/news/list.htm?1=1"></v:page>
		</div>
	</div>
</div>
