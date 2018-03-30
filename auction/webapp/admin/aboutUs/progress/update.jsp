<%@page pageEncoding="utf-8" %>
<%@taglib prefix="v" tagdir="/WEB-INF/tags"%>
<script src="aboutUs/progress/progress.js"></script>
<div class="widget model_widget">
        <div id="horizontal-form">
            <form class="form-horizontal" method="post" id="addItemForm">
            	<input type="hidden" name="id" value="${progress.id }">
                <div >
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">时间</label>
                        <div class="col-sm-9">
                            <input class="form-control" type="date" id="time" name="time" value="${progress.time }" placeholder="时间" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">内容</label>
                        <div class="col-sm-9">
                            <textarea class="form-control" id="conment" name="conment" placeholder="内容" required>${progress.conment }</textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">描述</label>
                        <div class="col-sm-9">
                            <input class="form-control" id="describes" maxlength="100" name="describes" value="${progress.describes }" placeholder="描述">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">备注</label>
                        <div class="col-sm-9">
                            <input class="form-control" id="remark" maxlength="100" name="remark" value="${progress.remark }" placeholder="备注">
                        </div>
                    </div>
                    
                </div>
            </form>
        </div>
</div>
