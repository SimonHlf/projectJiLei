<%@page pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="widget model_widget">
    <div class="widget-body">
        <div id="horizontal-form">
            <form class="form-horizontal" method="post" id="addUserForm">
                <div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">账号</label>
                        <div class="col-sm-9">
                            <input class="form-control" id="account" name="account" placeholder="账号" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">密码</label>
                        <div class="col-sm-9">
                            <input class="form-control" type="password" id="password" name="password" placeholder="密码" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">确认密码</label>
                        <div class="col-sm-9">
                            <input class="form-control" type="password" id="TwoPassword" placeholder="确认密码" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">名称</label>
                        <div class="col-sm-9">
                            <input class="form-control" id="name" name="name" placeholder="名称" required>
                        </div>
                    </div>
                   <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">邮箱</label>
                        <div class="col-sm-9">
                            <input class="form-control" id="email" name="email" placeholder="邮箱" required>
                        </div>
                    </div>
                 <!--     <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">值</label>
                        <div class="col-sm-9">
                            <input class="form-control" id="value" name="value" placeholder="值" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">类型</label>
                        <div class="col-sm-9">
                            <input class="form-control" id="type" name="type" placeholder="类型" required>
                        </div>
                    </div> -->
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">手机号</label>
                        <div class="col-sm-9">
                            <input class="form-control" id="mobile" name="mobile" placeholder="手机号">
                        </div>
                    </div>
                    <%--<div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">描述</label>
                        <div class="col-sm-9">
                            <input class="form-control" id="remark" name="remark" placeholder="描述">
                        </div>
                    </div>--%>
                   <%-- <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">所属组织</label>
                        <div class="col-sm-9">
                            <select name="updateUser" id="updateUser">
                                <option value="0">无组织</option>
                                <c:forEach items="${orgList}" var="org">
                                    <option value="${org.id}">${org.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>--%>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right"></label>
                    <div class="col-sm-3">
                        <button type="button" onclick="QueryAddUser()" class="btn btn-info">
                            添加
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
