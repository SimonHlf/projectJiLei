<%@page pageEncoding="utf-8" %>
<%@taglib prefix="v" tagdir="/WEB-INF/tags"%>
<script src="aboutUs/cooperation/cooperation.js"></script>
<div class="widget model_widget">
    <div class="widget-body">
        <div id="horizontal-form">
            <form class="form-horizontal" method="post" id="addItemForm">
                <div >
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">名称</label>
                        <div class="col-sm-9">
                            <input class="form-control" disabled="disabled" value="${company.name }" >
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">链接</label>
                        <div class="col-sm-9">
                            <input class="form-control" disabled="disabled" value="${company.url }" >
                        </div>
                    </div>
                    <div class="form-group">
                    <label class="col-sm-2 col-sm-2 control-label">图片</label>
                    <div class="col-md-10">
                        <!-- div1 -->
                        <img src="/${company.image}" width="50px" height="50px">
                    </div>
                </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">描述</label>
                        <div class="col-sm-9">
                            <input class="form-control" disabled="disabled" value="${company.describes }" >
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">备注</label>
                        <div class="col-sm-9">
                            <input class="form-control" disabled="disabled" value="${company.remark }" >
                        </div>
                    </div>
                    <div class="widget-buttons">
                		<button type="button" onclick="fanhui()" class="btn btn-info btn-ok">返回</button>
            	  	</div>
                </div>
            </form>
        </div>
    </div>
</div>
