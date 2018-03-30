<%@page pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>
<div class="widget model_widget">
    <div class="widget-body">
        <div id="horizontal-form">
            <form class="form-horizontal" method="post" id="editUserForm">
                <input type="hidden" name="id" value="${user.id}">
                  <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right">账号</label>
                    <div class="col-sm-9">
                        <input class="form-control" id="account" name="account" value="${user.account}" placeholder="账号" required>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right">名称</label>
                    <div class="col-sm-9">
                        <input class="form-control" id="name" name="name" value="${user.name}" placeholder="名称" required>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right">编码</label>
                    <div class="col-sm-9">
                        <input class="form-control" id="code" name="code" value="${user.code}" placeholder="编码">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right">手机号</label>
                    <div class="col-sm-9">
                        <input class="form-control" id="mobile" name="mobile" value="${user.mobile}" placeholder="值" required>
                    </div>
                </div>
                <input type="hidden" name="addUser" value="${user.addUser}">
            </form>
        </div>
    </div>
</div>
