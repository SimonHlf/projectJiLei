<%@page pageEncoding="utf-8" %>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>
<link rel="stylesheet" type="text/css" href="assets/css/bootstrap-fileupload.min.css" />
<script type="text/javascript" src="assets/js/bootstrap-fileupload.min.js"></script>
<div class="widget model_widget">
    <div class="widget-body">
        <div id="horizontal-form">
            <form class="form-horizontal" method="post" id="addLogisticsForm">
            <%-- <input type="hidden" name="orderid" id="orderId" value="${orderId}"> --%>
            <input type="hidden" name="ordernum" id="orderNum" value="${orderNum}">
                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right">运单号</label>
                    <div class="col-sm-9">
                        <input class="form-control" id="tracknum" name="tracknum" placeholder="运单号" required>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right">快递公司编号</label>
                    <div class="col-sm-9">
                        <input class="form-control" id="expressnum" name="expressnum" placeholder="快递公司编号" required >
                    </div>
                </div>
               
				
			</form>
        </div>
    </div>
</div>
