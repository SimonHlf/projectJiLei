<%@page pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>
<div class="widget model_widget">
    <div class="widget-body">
        <div id="horizontal-form">
            <form class="form-horizontal" method="post" id="orgDetailsForm">
                <input type="hidden" name="id" value="${org.id}">
                <input type="hidden" name="pid" value="${org.pid}">
                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right">名称</label>
                    <div class="col-sm-9">
                        <input class="form-control" readOnly id="name" name="name" value="${org.name}" placeholder="名称" required>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right">描述</label>
                    <div class="col-sm-9">
                        <input class="form-control" readOnly id="remark" name="remark" value="${org.remark}" placeholder="描述" required>
                    </div>
                </div>
            </form>
        </div>
         <a class="btn btn-info" onclick="ajaxLoad('org/list.htm','组织表')">返回</a>
    </div>
</div>
