<%@page pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>
<script src="admin/user/user.js"></script>
<div class="widget model_widget">
    <div class="widget-body">
        <div id="horizontal-form">
            <form class="form-horizontal" method="post" id="editUserForm">
                <input type="hidden" name="id" value="${user.id}">
                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right">账号</label>
                    <div class="col-sm-9">
                        <input class="form-control" id="account" name="account" readonly value="${user.account}"
                               placeholder="账号" required>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right">新密码</label>
                    <div class="col-sm-9">
                        <input class="form-control" type="password" id="newPassword"
                               placeholder="新密码">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right">确认新密码</label>
                    <div class="col-sm-9">
                        <input class="form-control" type="password" id="TwoPassword"
                               placeholder="确认新密码">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right">名称</label>
                    <div class="col-sm-9">
                        <input class="form-control" id="name" name="name" value="${user.name}" placeholder="名称"
                               required>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right">邮箱</label>
                    <div class="col-sm-9">
                        <input class="form-control" id="email" name="email" value="${user.email}" placeholder="邮箱">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right">手机号</label>
                    <div class="col-sm-9">
                        <input class="form-control" id="mobile" name="mobile" value="${user.mobile}" placeholder="手机号"
                               required>
                    </div>
                </div>
                <input type="hidden" name="addUser" value="${user.addUser}">
                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right"></label>
                    <div class="col-sm-3">
                        <button type="button" onclick="saveUser()" class="btn btn-info">
                            保存
                        </button>
                        <button type="button" onclick="ajaxLoad('user/list.htm','管理员管理',this)"
                                class="btn btn-default"> 返回
                        </button>
                    </div>
                </div>
            </form>

        </div>
    </div>
</div>