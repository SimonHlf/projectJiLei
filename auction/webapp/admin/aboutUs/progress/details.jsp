<%@page pageEncoding="utf-8" %>
<%@taglib prefix="v" tagdir="/WEB-INF/tags"%>
<script src="aboutUs/progressn/progress.js"></script>
<div class="widget model_widget">
    <div class="widget-body">
        <div id="horizontal-form">
            <form class="form-horizontal" method="post" id="addItemForm">
                <div >
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">时间</label>
                        <div class="col-sm-9">
                            <input class="form-control" value="${progress.time }" placeholder="时间" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">内容</label>
                        <div class="col-sm-9">
                            <textarea class="form-control" placeholder="内容" required>${progress.conment }</textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">描述</label>
                        <div class="col-sm-9">
                            <input class="form-control" value="${progress.describes }" placeholder="描述">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">备注</label>
                        <div class="col-sm-9">
                            <input class="form-control" value="${progress.remark }" placeholder="备注">
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
