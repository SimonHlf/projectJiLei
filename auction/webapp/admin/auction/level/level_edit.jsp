<%@page pageEncoding="utf-8" %>
<div class="widget model_widget">
    <div class="widget-body">
        <div id="horizontal-form">
            <form class="form-horizontal" method="post" id="editLevelForm">
            <input type="hidden" id="id" name="id" value="${level.id}">
                <div >
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">等级名称</label>
                        <div class="col-sm-9">
                            <input class="form-control" id="levelName" name="levelName" value="${level.levelName}" placeholder="等级名称" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">积分比例</label>
                        <div class="col-sm-9">
                            <input class="form-control" id="ratio" name="ratio" value="${level.ratio}" placeholder="积分比例" required>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
