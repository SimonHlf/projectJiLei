<%@page pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>
<script
        src="${pageContext.request.contextPath }/admin/news/cutFrom/news.js"></script>
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
    <button type="button" onclick="findByTitle()" class="btn btn-success">
        <i class="fa fa-search"></i> 查询
    </button>
</div>
<div style="margin-top:6px;">
    <form id="searchNewsForm" method="post">
		<div class="row">
			<div class="form-group col-lg-4">
				<div class=" input-group">
					<span class="input-group-addon">按标题查找</span> <input type="text"
						name="title" value="${news.title}" class="form-control"
						placeholder="按标题查找"> <input type="hidden"
						name="id" value="${news.id}" class="form-control">
						
				</div>
			</div>
		</div>
	</form>
</div>
<div class="widget" id="table">
    <div class="widget-header  with-footer">
		<span class="widget-caption"> <i class="fa fa-list"></i> 信息列表
		</span>
    </div>
    <div class="widget-body">
        <div class="flip-scroll">
            <table class="table table-bordered table-striped table-condensed flip-content">
                <thead class="flip-content bordered-palegreen">
                <tr>
                    <th width="44px;"><v:checkbox/></th>
                    <th>标题</th>
                    <th>创建时间</th>
                    <th>修改时间</th>
                    <th>展示状态</th>
						<th>操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${list}" var="news">
                    <tr>
                        <td><v:checkbox value="${news.id}"/></td>
                        <td><a onclick="details(${news.id})">${news.title}</a></td>
                        <td>${news.addTime}</td>
                        <td>${news.updateTime }</td>
                        <td>
							<c:if test="${news.attr3 == '0' }">不展示</c:if>
							<c:if test="${news.attr3 == '1' }">展示</c:if>
							</td>
							<td>
							<c:if test="${news.attr3 == '0' }"><button onclick="show(${news.id})"
											class="btn btn-info">展示</button></c:if>
							<c:if test="${news.attr3 == '1' }"><button onclick="noShow(${news.id})"
											class="btn btn-danger">不展示</button></c:if>
							</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <v:pagination page="${page}" url="news/news/list.htm?1=1&&attr0=${attr0 }"></v:pagination>
        </div>
    </div>
</div>