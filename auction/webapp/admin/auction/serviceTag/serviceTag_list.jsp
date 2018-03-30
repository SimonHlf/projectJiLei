<%@page pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>
<script src="auction/serviceTag/serviceTag.js"></script>
<div class="btn-group">
    <button type="button" onclick="addServiceTag()" class="btn btn-info"><i class="fa fa-plus"></i> 添加</button>
    <button type="button" onclick="delServiceTag()" class="btn btn-danger"><i class="fa fa-minus"></i> 删除</button>
    <button type="button" onclick="editServiceTag()" class="btn btn-primary"><i class="fa fa-pencil"></i> 修改</button>
</div>
<div class="widget">
    <div class="widget-header bordered-bottom bordered-themeprimary">
        <i class="widget-icon fa fa-tasks themeprimary"></i>
        <span class="widget-caption themeprimary">服务标签列表</span>
    </div>
    <div class="widget-body">
        <div class="flip-scroll">
            <table class="table table-bordered table-striped table-condensed flip-content">
                <thead class="flip-content bordered-palegreen">
                <tr>
                    <th width="44px;"><v:checkbox/></th>
                    <th>服务标签名称</th>
             		<th>描述</th>
                </tr>
                </thead>
                <tbody>
                    <c:forEach items="${list}" var="n">
                        <tr>
                            <td><v:checkbox value="${n.id}"/></td>
                            <td>${n.name}</td>
                            <td>${n.description}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <v:pagination page="${page}" url="serviceTagController/getAll.htm?1=1"></v:pagination>
        </div>
    </div>
</div>