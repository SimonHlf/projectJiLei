<%@page pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>
<script src="admin/user/user.js"></script>
<div class="btn-group">
    <button type="button" onclick="addUser()" class="btn btn-info"><i class="fa fa-plus"></i> 添加</button>
    <button type="button" onclick="delUser()" class="btn btn-danger"><i class="fa fa-minus"></i> 删除</button>
    <button type="button" onclick="editUser()" class="btn btn-primary"><i class="fa fa-pencil"></i> 修改</button>
    <button type="button" onclick="searchUser()" class="btn btn-success"><i class="fa fa-search"></i> 查询</button>
</div>
<div style="margin-top:6px;">
    <form id="searchUserForm" method="post">
        <div class="row">
            <div class="form-group col-lg-4">
                <div class=" input-group">
                    <span class="input-group-addon">按名字查找</span>
                    <input type="text" name="name" value="${user.name}" class="form-control" placeholder="按名字查找">
                </div>
            </div>
        </div>
    </form>
</div>
<div class="widget">
    <div class="widget-header bordered-bottom bordered-themeprimary">
        <i class="widget-icon fa fa-tasks themeprimary"></i>
        <span class="widget-caption themeprimary">用户列表 ( 如若要增加平台管理员 ，请将其编码设置为 user ) </span>
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
                        账号
                    </th>
                    <th>
                        名称
                    </th>
                    <th>
                        昵称
                    </th>
                    <th>
                        手机号
                    </th>
                    <th>
                        邮箱
                    </th>
                </tr>
                </thead>
                <tbody>
                    <c:forEach items="${list}" var="user">
                        <tr>
                            <td>
                                <v:checkbox value="${user.id}"/>
                            </td>
                            <td>
                                ${user.account}
                            </td>
                            <td>
                               <a onclick="details(${user.id})"> ${user.name}</a>
                            </td>
                            <td>
                                ${user.nickName}
                            </td>
                            <td>
                                ${user.mobile}
                            </td>
                            <td>
                                ${user.email}
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <v:pagination page="${page}" url="item/list.htm?1=1"></v:pagination>
    </div>
    </div>
</div>