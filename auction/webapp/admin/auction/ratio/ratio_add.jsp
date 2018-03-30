<%@page pageEncoding="utf-8" %>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>
<div class="widget model_widget">
    <div class="widget-body">
        <div id="horizontal-form">
            <form class="form-horizontal" method="post" id="addRatioForm">
                <div >
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">比例名称</label>
                        <div class="col-sm-9">
                            <input class="form-control" id="name" name="name" placeholder="比例名称" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">比例类型</label>
                        <div class="col-sm-9">
                           <v:items type="ratio" id="type" name="type"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">人民币</label>
                        <div class="col-sm-9">
                            <input class="form-control" id="rmb" name="rmb" placeholder="人民币" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">积分</label>
                        <div class="col-sm-9">
                            <input class="form-control" id="ratio" name="ratio" placeholder="积分" required>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
