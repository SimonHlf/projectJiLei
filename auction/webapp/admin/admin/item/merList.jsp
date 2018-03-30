<%@page pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>
<script src="admin/item/item.js"></script>
<div class="btn-group">
  <!--   <button type="button" onclick="addItem()" class="btn btn-info"><i class="fa fa-plus"></i> 添加</button>
    <button type="button" onclick="delItem()" class="btn btn-danger"><i class="fa fa-minus"></i> 删除</button> -->
    <button type="button" onclick="editInfo()" class="btn btn-primary"><i class="fa fa-pencil"></i> 修改</button>
</div>
<div class="widget">
    <div class="widget-header bordered-bottom bordered-themeprimary">
        <i class="widget-icon fa fa-tasks themeprimary"></i>
        <span class="widget-caption themeprimary">门店分类列表</span>
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
                        分类名称
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