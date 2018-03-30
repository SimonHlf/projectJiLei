<%@page pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>
<div class="widget model_widget">
    <div class="widget-body">
        <div id="horizontal-form">
            <form class="form-horizontal" method="post" id="editCategoryForm">
                <input type="hidden" name="id" value="${category.id}">
                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right">商品名称</label>
                    <div class="col-sm-9">
                        <input class="form-control" id="name" name="name" value="${category.name}" placeholder="名称" required>
                    </div>
                </div>
                <%-- <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right">图标</label>
                    <div class="col-sm-9">
                        <input class="form-control" id="icon" name="icon" value="${category.icon}" placeholder="图标" required>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right">pid</label>
                    <div class="col-sm-9">
                        <input class="form-control" id="pid" name="pid" value="${category.pid}" placeholder="pid" required>
                    </div>
                </div> --%>
            </form>
        </div>
    </div>
</div>
