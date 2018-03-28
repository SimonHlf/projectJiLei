<%@page pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>
<div class="widget model_widget">
    <div class="widget-body">
        <div id="horizontal-form">
            <form class="form-horizontal" method="post" id="editItemForm">
                <input type="hidden" name="id" value="${item.id}">
                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right">分类名称</label>
                    <div class="col-sm-9">
                        <input class="form-control" id="remark" name="remark" value="${item.remark}" placeholder="描述" required>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
