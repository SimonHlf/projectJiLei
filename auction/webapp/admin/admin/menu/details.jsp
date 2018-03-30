<%@page pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>
<div class="widget model_widget">
    <div class="widget-body">
        <div id="horizontal-form">
            <form class="form-horizontal" method="post" id="menuDetailsForm">
                <input type="hidden" name="id" value="${menu.id}">
                <input type="hidden" name="pid" value="${menu.pid}">
                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right">名称</label>
                    <div class="col-sm-9">
                        <input class="form-control" readOnly id="name" name="name" value="${menu.name}" placeholder="名称" required>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right">图标</label>
                    <div class="col-sm-9">
                        <input class="form-control" readOnly id="icon" name="icon" value="${menu.icon}" placeholder="图标" required>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right">类型</label>
                    <div class="col-sm-9">
                        <input class="form-control" readOnly id="type" name="type" value="${menu.type}" placeholder="类型">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right">URL</label>
                    <div class="col-sm-9">
                        <input class="form-control" readOnly id="url" name="url" value="${menu.url}" placeholder="URL" required>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right">标识</label>
                    <div class="col-sm-9">
                        <v:item type="menu_flag" value="${menu.flag}"/> 
                    </div>
                </div>
            </form>
        </div>
        <div>
        <a class="btn btn-info" onclick="ajaxLoad('menu/list.htm','新闻列表')">返回</a>
        </div>
    </div>
</div>
