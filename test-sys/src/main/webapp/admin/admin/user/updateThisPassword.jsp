<%@page pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="widget model_widget">
    <div class="">
        <div id="horizontal-form">
            <form class="form-horizontal" method="post" id="updateThisPasswordForm">
                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right">原密码</label>
                    <div class="col-sm-9">
                        <input class="form-control" type="password" id="password" placeholder="原密码" required>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right">新密码</label>
                    <div class="col-sm-9">
                        <input class="form-control" type="password" id="newPassword" placeholder="新密码" required>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right">确认新密码</label>
                    <div class="col-sm-9">
                        <input class="form-control" type="password" id="twonewPassword" placeholder="确认新密码" required>
                    </div>
                </div>

            </form>
        </div>
    </div>
</div>