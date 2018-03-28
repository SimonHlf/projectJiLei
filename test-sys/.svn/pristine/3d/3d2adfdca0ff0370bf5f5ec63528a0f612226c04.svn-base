<%@page pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>
<script src="admin/role/role.js"></script>
<%--<div class="btn-group">
    <button type="button" onclick="addRole()" class="btn btn-info"><i class="fa fa-plus"></i> 添加</button>
    <button type="button" onclick="delRole()" class="btn btn-danger"><i class="fa fa-minus"></i> 删除</button>
    <button type="button" onclick="editRole()" class="btn btn-primary"><i class="fa fa-pencil"></i> 修改</button>
</div>--%>
<div style="margin-top:6px;">
    <%--<form id="searchRoleForm" method="post">--%>
        <div class="row">
            <div class="form-group col-lg-4" style="width: 230px">
                <div class=" input-group">
                    <%--<span class="input-group-addon">按名字查找</span>--%>
                    <input type="text" name="name" value="${role.name}" class="form-control" placeholder="按名字查找">
                </div>
            </div>
            <button type="button" onclick="searchRole()" class="btn btn-success"><i class="fa fa-search"></i> 查询</button>
            <button type="button" onclick="addRole()" class="btn btn-info"><i class="fa fa-plus"></i> 添加</button>
            <button type="button" onclick="delRole()" class="btn btn-danger"><i class="fa fa-minus"></i> 删除</button>
            <button type="button" onclick="editRole()" class="btn btn-primary"><i class="fa fa-pencil"></i> 修改</button>
        </div>
    <%--</form>--%>
</div>
<div class="widget">
  <%--  <div class="widget-header bordered-bottom bordered-themeprimary">
        <i class="widget-icon fa fa-tasks themeprimary"></i>
        <span class="widget-caption themeprimary">角色列表</span>
    </div>--%>
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
                        编码
                    </th>
                    <th>
                        描述
                    </th>
                    <th>
                       关联菜单操作
                    </th>
                     <th>
                       关联 用户操作
                    </th>
                </tr>
                </thead>
                <tbody>
                    <c:forEach items="${list}" var="role">
                        <tr>
                            <td>
                                <v:checkbox value="${role.id}"/>
                            </td>
                            <td>
                              <a onclick="details(${role.id})">${role.name}</a>
                            </td>
                            <td>
                                ${role.code}
                            </td>
                            <td>
                                ${role.remark}
                            </td>
                            <td>
                                <a href="javascript:linkMenu(${role.id})">关联菜单</a> 
                                <%-- <a href="javascript:linkUser(${role.id})">关联用户</a> --%>
                            </td>
                            <td>
                            	<a href="javascript:linkUser(${role.id})">关联用户</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <v:pagination page="${page}" url="role/list.htm?1=1"></v:pagination>
        </div>
    </div>
</div>