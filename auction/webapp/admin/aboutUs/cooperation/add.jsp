<%@page pageEncoding="utf-8" %>
<%@taglib prefix="v" tagdir="/WEB-INF/tags"%>
<script type="text/javascript" src="assets/js/datetime/jedate.js"></script>
<link rel="stylesheet" type="text/css" href="assets/css/jedate.css">
<link rel="stylesheet" type="text/css" href="assets/css/bootstrap-fileupload.min.css" />
<script type="text/javascript" src="assets/js/bootstrap-fileupload.min.js"></script>
<script src="aboutUs/cooperation/cooperation.js"></script>
<div class="widget model_widget">
        <div id="horizontal-form">
            <form class="form-horizontal" method="post" id="addItemForm">
                <div >
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">名称</label>
                        <div class="col-sm-9">
                            <input class="form-control" maxlength="100" id="name" name="name" placeholder="名称" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">链接</label>
                        <div class="col-sm-9">
                            <input class="form-control" maxlength="100" id="url" name="url" placeholder="链接" required>
                        </div>
                        <div class="col-sm-9" style="padding-left: 103px;"><span style="color: red;">网站开头为(https://或者http://)</span></div>
                    </div>
                    <div class="form-group">
                    <label class="col-sm-2 col-sm-2 control-label">图片</label>
                    <div class="col-md-10">
                        <!-- div1 -->
                        <div class="fileupload fileupload-new" data-provides="fileupload">
                            <div class="fileupload-new thumbnail"
                                 style="width: 200px; height: 150px;">
                                <img src="/${company.logo}" alt="" />
                            </div>
                            <div class="fileupload-preview fileupload-exists thumbnail"
                                 style="max-width: 200px; max-height: 150px; line-height: 20px;"></div>
                            <div>
								<span class="btn btn-default btn-file">
                                    <span class="fileupload-new">
                                    <i class="fa fa-paper-clip"></i>选择图片</span>
									<span class="fileupload-exists"><i class="fa fa-undo"></i>替换</span> <!-- 上传图片 -->
                                    <input type="file" accept="image/gif,image/bmp,image/jpeg,image/jpg,image/png,image/svg" class="default" name="headImage" id="imgs" />
								</span>
                                <a href="#" class="btn btn-danger fileupload-exists" data-dismiss="fileupload">
                                    <i class="fa fa-trash"></i>
                                删除
                                </a>
                            </div>
                            <span id="pictureSpan" style="color:red"></span>
                        </div>
                        <div class="tipInfoTxt left2">
							<p>a.&nbsp;尺寸<span style="color:red;">110*55px</span></p>
							<p>b.&nbsp;图片大小<span style="color:red;">不超过1M</span></p>
							<!-- p id="pictureSpan" style="color:red">提示:图片大小不能超过1M,否则不能上传!</p -->
						</div>
                    </div>
                </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">描述</label>
                        <div class="col-sm-9">
                            <input class="form-control" maxlength="100" id="describes" name="describes" placeholder="描述">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">备注</label>
                        <div class="col-sm-9">
                            <input class="form-control" maxlength="100" id="remark" name="remark" placeholder="备注">
                        </div>
                    </div>
                    
                </div>
            </form>
        </div>
</div>
