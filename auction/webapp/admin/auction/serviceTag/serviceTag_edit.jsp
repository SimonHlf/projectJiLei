<%@page pageEncoding="utf-8" %>
<div class="widget model_widget">
    <div class="widget-body">
        <div id="horizontal-form">
            <form class="form-horizontal" method="post" id="editServiceTagForm">
            <input type="hidden" id="id" name="id" value="${serviceTag.id}">
                <div >
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">服务标签名称</label>
                        <div class="col-sm-9">
                            <input class="form-control" id="name" name="name" value="${serviceTag.name}" placeholder="品牌名称" required>
                        </div>
                    </div>
   					<div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">描述</label>
                        <div class="col-sm-9">
                            <input class="form-control" id="description" name="description" value="${serviceTag.description}" placeholder="描述" required>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
