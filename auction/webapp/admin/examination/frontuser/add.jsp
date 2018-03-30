<%@page pageEncoding="utf-8" %>
<script src="../weChat/js/jquery.min.js"></script>
<div class="widget model_widget">
    <div class="widget-body">
        <div id="horizontal-form">
            <form class="form-horizontal" method="post" enctype="multipart/form-data" id="addDisRateForm">
                <div >
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">用户昵称</label>
                        <div class="col-sm-9">
                            <input class="form-control" id="nickName" name="nickName" placeholder="用户昵称" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">手机号</label>
                        <div class="col-sm-9">
                            <input class="form-control" id="cellPhone" name="cellPhone" placeholder="手机号" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">性别</label>
                        <div class="col-sm-9">
                            <select class="form-control" id="sex" name="sex">
                            	<option value="0">男</option>
                            	<option value="1">女</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">出生日期</label>
                        <div class="col-sm-9">
                            <input class="form-control" id="birthday" type="date" name="birthday" placeholder="出生日期">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">签名</label>
                        <div class="col-sm-9">
                            <input class="form-control" id="theSignature" name="theSignature" placeholder="签名">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">头像</label>
                        <div class="col-sm-9">
		                	<input type="file" class="form-control" name="headPortrait"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">锁定状态</label>
                        <div class="col-sm-9">
                            <select class="form-control" name="locked">
                            	<option value="0">未锁定</option>
                            	<option value="1">已锁定</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">注册时间</label>
                        <div class="col-sm-9">
                            <input class="form-control" id="regTime" type="date" name="regTime" placeholder="注册时间">
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
