<%@page pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>
<div class="widget model_widget">
    <div class="widget-body">
        <div id="horizontal-form">
            <form class="form-horizontal" method="post" id="editSettingForm">
                <input type="hidden" name="id" value="${setting.id}">
                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right">系统名称</label>
                    <div class="col-sm-9">
                        <input class="form-control" id="name" name="name" value="${setting.name}" placeholder="系统名称" required>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right">简名</label>
                    <div class="col-sm-9">
                        <input class="form-control" id="shortName" name="shortName" value="${setting.shortName}" placeholder="简名" required>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right">域名</label>
                    <div class="col-sm-9">
                        <input class="form-control" id="domain" name="domain" value="${setting.domain}" placeholder="域名" required>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right">是否弹窗</label>
                    <div class="col-sm-9">
                        <v:items type="add_is_dialog" id="add_is_dialog" name="addIsDialog" value="${setting.addIsDialog}"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right">是否有组织</label>
                    <div class="col-sm-9">
                        <v:items type="org_is_use" id="org_is_use" name="orgIsUse" value="${setting.orgIsUse}"/>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
