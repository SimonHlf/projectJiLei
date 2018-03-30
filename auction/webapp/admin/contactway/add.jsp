<%@page pageEncoding="utf-8" %>
<link rel="stylesheet" type="text/css" href="assets/css/bootstrap-fileupload.min.css" />
<script type="text/javascript" src="assets/js/bootstrap-fileupload.min.js"></script>
<script src="contactway/credit.js"></script>
<div class="widget model_widget">
    <div class="widget-body">
        <div id="horizontal-form">
            <form class="form-horizontal" method="post" id="addAdSlotForm">
                <div >
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">类型</label>
                        <div class="col-sm-9">
                            <select id="type" name="type" onchange="types(this.value);">
                            	<option value="0">QQ1</option>
                            	<option value="1">QQ2</option>
                            	<option value="2">微信1</option>
                            	<option value="3">微信2</option>
                            	<option value="4">二维码</option>
                            	<option value="5">二维码用途</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group" id="types">
                        <label class="col-sm-2 control-label no-padding-right">联系号码</label>
                        <div class="col-sm-9">
                            <input class="form-control" maxlength="11" id="contactNuma" name="contactNuma" placeholder="联系号码" required>
                        </div>
                    </div> 
                    
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">状态</label>
                        <div class="col-sm-9">
                            <select id="isOpen" name="isOpen">
                            	<option value="0">未启用</option>
                            	<option value="1">启用</option>
                            </select>
                        </div>
                    </div>  
                        
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">时间</label>
                        <div class="col-sm-9" id="datepicker">
                            <input class="form-control" id="updateTime" type="date" name="updateTime" placeholder="时间" required>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
