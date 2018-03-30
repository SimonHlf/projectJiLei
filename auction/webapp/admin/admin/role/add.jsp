<%@page pageEncoding="utf-8" %>
<div class="widget model_widget">
    <div class="widget-body">
        <div id="horizontal-form">
            <form class="form-horizontal" method="post" id="addRoleForm">
                <div >
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">名称</label>
                        <div class="col-sm-9">
                            <input class="form-control" id="name" name="name" placeholder="名称" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">编码</label>
                        <div class="col-sm-9">
                            <input class="form-control" id="code" name="code" placeholder="编码" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">描述</label>
                        <div class="col-sm-9">
                            <input class="form-control" id="remark" name="remark" placeholder="描述">
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
