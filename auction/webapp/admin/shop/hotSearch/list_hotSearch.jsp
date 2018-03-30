<%@page  language="java" pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>

<script src="shop/hotSearch/hotSearch.js"></script>
<script src="assets/layui/lay/modules/laypage.js"></script>

<div class="btn-group">
    <button type="button" onclick="addHotSearch()" class="btn btn-info"><i class="fa fa-plus"></i> 添加</button>
	<button type="button" onclick="delHotSearch()" class="btn btn-danger"><i class="fa fa-minus"></i> 删除</button> 
    <button type="button" onclick="editHotSearch()" class="btn btn-primary"><i class="fa fa-pencil"></i> 修改</button>
</div>
<div class="widget">
    <div class="widget-header bordered-bottom bordered-themeprimary">
        <span class="widget-caption themeprimary">
            <i class="widget-icon fa fa-tasks themeprimary"></i>
           热门搜索列表</span>
    </div>
	<div class="widget-body">
		<div class="flip-scroll">
			<table
				class="table table-bordered table-striped table-condensed flip-content">
				<thead class="flip-content bordered-palegreen">
					<tr>
						<th width="44px;"><v:checkbox /></th>
						<th>搜索词</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="hot">
						<tr>
							<td><v:checkbox value="${hot.id}" /></td>
							<td>
								${hot.name}
							</td>
							
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
		</div>
	</div>
</div>