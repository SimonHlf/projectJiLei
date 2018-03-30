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
                        <input class="form-control" readOnly id="name" name="name" value="${setting.name}" placeholder="系统名称" required>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right">简名</label>
                    <div class="col-sm-9">
                        <input class="form-control" readOnly id="shortName" name="shortName" value="${setting.shortName}" placeholder="简名" required>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right">域名</label>
                    <div class="col-sm-9">
                        <input class="form-control" readOnly id="domain" name="domain" value="${setting.domain}" placeholder="域名" required>
                    </div>
                </div>
                 <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right">记录编号</label>
                    <div class="col-sm-9">
                        <input class="form-control" readOnly id="recordNumber" name="recordNumber" value="${setting.recordNumber}" placeholder="记录编号" required>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right">是否弹窗</label>
                    <div class="col-sm-9">
                        <v:item type="add_is_dialog" value="${setting.addIsDialog}"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right">是否有组织</label>
                    <div class="col-sm-9">
                        <v:item type="org_is_use" value="${setting.orgIsUse}"/>
                    </div>
                </div>
            </form>
        </div>
         <a class="btn btn-info" onclick="ajaxLoad('setting/list.htm','系统设置')">返回</a>
    </div>
</div>
