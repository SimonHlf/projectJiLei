<%@page pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>
<div class="widget model_widget">
    <div class="widget-body">
        <div id="horizontal-form">
            <form class="form-horizontal" method="post" id="editTypeForm">
                <input type="hidden" name="id" value="${newsType.id}">
                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right">名称</label>
                    <div class="col-sm-9">
                        <input class="form-control" id="name" name="name" value="${newsType.name}" placeholder="名称" required>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right">编码</label>
                    <div class="col-sm-9">
                        <input class="form-control" id="code" name="code" value="${newsType.code}" placeholder="编码" required>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right">分类目录</label>
                    <div class="col-sm-9">
                        <input class="form-control" id="dir" name="dir" value="${newsType.dir}" placeholder="分类目录">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right">排序值</label>
                    <div class="col-sm-9">
                        <input class="form-control" id="display" name="display" value="${newsType.display}" placeholder="排序值">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right">描述</label>
                    <div class="col-sm-9">
                        <input class="form-control" id="remark" name="remark" value="${newsType.remark}" placeholder="描述" required>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
