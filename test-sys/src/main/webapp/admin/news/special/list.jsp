<%@page pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>
<script src="${pageContext.request.contextPath }/admin/news/special/special.js"></script>
<div class="btn-group">
    <button type="button" onclick="addSpecial()" class="btn btn-info"><i class="fa fa-plus"></i> 添加</button>
    <button type="button" onclick="delSpecial()" class="btn btn-danger"><i class="fa fa-minus"></i> 删除</button>
    <button type="button" onclick="editSpecial()" class="btn btn-primary"><i class="fa fa-pencil"></i> 修改</button>
   <button type="button" onclick="openSearch('searchdiv')"
		class="btn btn-success">
		<i class="fa fa-search"></i> 筛选条件
	</button>
	<button type="button" onclick="findByName()" class="btn btn-success">
		<i class="fa fa-search"></i> 查询
	</button>
</div>
<div class="search-div" id="searchdiv">
	<form action="" class="form-horizontal">
		<div class="row search-row">
			<div>
				<label class="col-sm-2 control-label no-padding-right">名字</label>
				<div class="col-sm-4">
					<input class="form-control" id="name" name="name" required>
				</div>
			</div>
		</div>
	</form>
</div>
<div class="widget" id="table">
    <div class="widget-header  with-footer">
        <span class="widget-caption">
            <i class="fa fa-list"></i>
            新闻专题</span>
    </div>
    <div class="widget-body">
        <div class="flip-scroll">
            <table class="table table-bordered table-striped table-condensed flip-content">
                <thead class="flip-content bordered-palegreen">
                <tr>
                    <th width="44px;">
                        <v:checkbox/>
                    </th>
                    <th>
                        名称
                    </th>
                    <th>
                        描述
                    </th>
                </tr>
                </thead>
                <tbody>
                    <c:forEach items="${list}" var="special">
                        <tr>
                            <td>
                                <v:checkbox value="${special.id}"/>
                            </td>
                            <td>
                                ${special.name}
                            </td>
                            <td>
                                ${special.remark}
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <v:pagination page="${page}" url="news/special/list.htm?1=1"></v:pagination>
    </div>
    </div>
</div>