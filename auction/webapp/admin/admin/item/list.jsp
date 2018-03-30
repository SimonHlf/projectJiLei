<%@page pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>
<script src="admin/item/item.js"></script>
<div class="btn-group">
    <button type="button" onclick="addItem()" class="btn btn-info"><i class="fa fa-plus"></i> 添加</button>
    <button type="button" onclick="delItem()" class="btn btn-danger"><i class="fa fa-minus"></i> 删除</button>
    <button type="button" onclick="editItem()" class="btn btn-primary"><i class="fa fa-pencil"></i> 修改</button>
    <c:if test="${info == '0' }">
    <button type="button" onclick="searchItem()" class="btn btn-success"><i class="fa fa-search"></i> 查询</button>
</c:if>
</div>
<c:if test="${info == '0' }">
<div style="margin-top:6px;">
    <form id="searchItemForm" method="post">
        <div class="row">
            <div class="form-group col-lg-4">
                <div class=" input-group">
                    <span class="input-group-addon">按名字查找</span>
                    <input type="text" name="name" value="${item.name}" class="form-control" placeholder="按名字查找">
                </div>
            </div>
            <div class="form-group col-lg-4">
                <div class="input-group">
                    <span class="input-group-addon">按类型查找</span>
                    <input type="text" name="type" value="${item.type}" class="form-control" placeholder="按类型查找">
                </div>
            </div>
        </div>
    </form>
</div>
</c:if>
<div class="widget">
    <div class="widget-header bordered-bottom bordered-themeprimary">
        <i class="widget-icon fa fa-tasks themeprimary"></i>
        <span class="widget-caption themeprimary">数据字典列表</span>
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
                    <c:if test="${isSuper == '1' }">
                            <th>
                        编码
                    </th>
                    <th>
                        类型
                    </th>
                    <th>
                        值
                    </th>
                    </c:if>
                    <th>
                        描述
                    </th>
                </tr>
                </thead>
                <tbody>
                    <c:forEach items="${list}" var="item">
                        <tr>
                            <td>
                                <v:checkbox value="${item.id}"/>
                            </td>
                            <td>
                               <a onclick="details(${item.id})">${item.name}</a>
                            </td>
                            <c:if test="${isSuper == '1' }">
                               <td>
                                ${item.code}
                            </td>
                            <td>
                                ${item.type}
                            </td>
                            <td>
                                ${item.value}
                            </td>
                            </c:if>
                            <td>
                                ${item.remark}
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <v:pagination page="${page}" url="item/list.htm?1=1"></v:pagination>
    </div>
    </div>
</div>