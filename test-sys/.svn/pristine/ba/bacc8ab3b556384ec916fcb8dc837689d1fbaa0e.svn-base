<%@page pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>
<script src="admin/setting/setting.js"></script>
<div class="widget model_widget">
    <div class="widget-body">
        <div id="horizontal-form">
            <form class="form-horizontal" method="post" id="editSettingForms">
                <input type="hidden" name="id" value="${setting.id}">
                <div>
                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right">系统名称</label>
                    <div class="col-sm-9">
                        <input class="form-control" id="name" name="name" value="${setting.name}" placeholder="系统名称" required>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right">简名</label>
                    <div class="col-sm-9">
                        <input class="form-control" id="shortName" name="shortName" value="${setting.shortName}" placeholder="简名" required>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 col-sm-2 control-label">登陆页面背景</label>
                    <div class="col-md-10">
                        <!-- div1 -->
                        <div class="fileupload fileupload-new" data-provides="fileupload">
                            <div class="fileupload-new thumbnail"
                                 style="width: 200px; height: 150px;">
                                <img src="/${setting.attr0}" alt="" />
                            </div>
                            <div class="fileupload-preview fileupload-exists thumbnail"
                                 style="max-width: 200px; max-height: 150px; line-height: 20px;"></div>
                            <div>
								<span class="btn btn-default btn-file">
                                    <span class="fileupload-new"><i class="fa fa-paper-clip"></i>选择图片</span>
									<span class="fileupload-exists"><i class="fa fa-undo"></i>替换</span> <!-- 上传图片 -->
                                    <input type="file" accept="image/gif,image/bmp,image/jpeg,image/jpg,image/png,image/svg" class="default" name="headImage" id="imgs" />
								</span>
                                <a href="#" class="btn btn-danger fileupload-exists" data-dismiss="fileupload">
                                <i class="fa fa-trash"></i> 删除
                                </a>
                            </div>
                            <span id="pictureSpan" style="color:red">提示:登陆页面背景大小在 1920*1080 像素之间</span>
                        </div>
                    </div>
                </div>


                <div class="form-group">
                    <label class="col-sm-2 col-sm-2 control-label">登陆输入框前logo</label>
                    <div class="col-md-10">
                        <!-- div1 -->
                        <div class="fileupload fileupload-new" data-provides="fileupload">
                            <div class="fileupload-new thumbnail"
                                 style="width: 200px; height: 150px;">
                                <img src="/${setting.attr1}" alt="" />
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
                            <span id="pictureSpan" style="color:red">提示:登陆输入框前logo大小在 100*100 像素之间</span>
                        </div>
                    </div>
                </div>

                 <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right">公司名</label>
                    <div class="col-sm-9">
                        <input class="form-control" id="attr2" name="attr2" value="${setting.attr2}" placeholder="公司名" required>
                    </div>
                </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">前台系统名称</label>
                        <div class="col-sm-9">
                            <input class="form-control" id="attr3" name="attr3" value="${setting.attr3}" placeholder="前台系统名称" required>
                        </div>
                    </div>
    
				
                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right">英文简称</label>
                    <div class="col-sm-9">
                        <input class="form-control" id="attr4" name="attr4" value="${setting.attr4}" placeholder="英文简称" required>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right">短语</label>
                    <div class="col-sm-9">
                        <input class="form-control" id="attr5" name="attr5" value="${setting.attr5}" placeholder="短语" required>
                        <span style="color:red">提示:短语用空格或、隔开</span>
                    </div>
                </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">水印开关</label>
                        <div class="col-sm-9">
                            <select name="attr6" id="attr6">
                                <option value="0">关</option>
                                <option value="1">开</option>
                            </select>
                        </div>
                    </div>
                <div class="widget-buttons">
                		<button type="button" onclick="yes()" class="btn btn-info btn-ok">确认修改</button>
                		<!-- <button type="button" onclick="fanhui()" class="btn btn-default"> 返回</button> -->
            	  </div>
			</div>
            </form>
        </div>
    </div>
</div>
<script>
    $(function(){
        var attr6 = '${setting.attr6}';
        $("#attr6 option").each(function(){
            if(attr6 == $(this).val()){
                $(this).attr("selected",true);
            }
        })
    })
</script>