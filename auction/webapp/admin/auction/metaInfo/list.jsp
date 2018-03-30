<%@page pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>
<script src="auction/metaInfo/metaInfo.js"></script>
<div class="btn-group">
  <button type="button" onclick="addMeta()" class="btn btn-info"><i class="fa fa-plus"></i> 添加</button> 
  <button type="button" onclick="editMeta()" class="btn btn-primary"><i class="fa fa-pencil"></i> 修改</button> 
  <button type="button" onclick="delMeta()" class="btn btn-danger"><i class="fa fa-minus"></i> 删除</button> 
	大师姓名<input id="name" type="text" style="width: 120px; height: 33px" value="${name}">
		<button type="button" onclick="searchMeta()"
			class="btn btn-primary">
			<i class="fa fa-search"></i> 查询
		</button> 

</div>
<div class="widget">
    <div class="widget-header bordered-bottom bordered-themeprimary">
        <i class="widget-icon fa fa-tasks themeprimary"></i>
        <span class="widget-caption themeprimary">文化荟萃大师列表</span>
    </div>
    <div class="widget-body">
        <div class="flip-scroll">
            <table class="table table-bordered table-striped table-condensed flip-content">
                <thead class="flip-content bordered-palegreen">
                <tr>
                    <th width="44px;"><v:checkbox/></th>
                    <th>大师姓名</th>
                    <th>职称</th>
                    <th>头像</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                    <c:forEach items="${list}" var="n">
                        <tr>
                            <td><v:checkbox value="${n.id}"/></td>
                            <td>${n.name}</td>
                            <td>${n.positio}</td>
                            <td><img src="/${n.photo}" width="50px" height="50px"></td>
                            <td>
                            <button type="button" onclick="queryDetail(${n.id},${page1})" class="btn btn-primary">查看详情</button>
                            <button type="button" onclick="relationModel(${n.id},${page1})" class="btn btn-primary">关联模块</button>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <v:pagination page="${page}" url="shop/metaInfoController/list.htm?name=${name}"></v:pagination>
        </div>
    </div>
</div>