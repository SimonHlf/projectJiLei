<%@page pageEncoding="utf-8" %>
<div class="widget model_widget">
    <div class="widget-body">
        <div id="horizontal-form">
            <form class="form-horizontal" method="post" id="editBrandForm">
            <input type="hidden" id="id" name="id" value="${brand.id}">
                <div >
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">品牌名称</label>
                        <div class="col-sm-9">
                            <input class="form-control" id="name" name="name" value="${brand.name}" placeholder="品牌名称" required>
                        </div>
                    </div>
    
                </div>
            </form>
        </div>
    </div>
</div>
