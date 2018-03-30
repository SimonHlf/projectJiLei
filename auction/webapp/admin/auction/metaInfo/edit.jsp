<%@page pageEncoding="utf-8" %>
<script src="assets/js/jquery-2.0.3.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
<script type="text/javascript" src="assets/ueditor/ueditor.config.js"></script>
<script type="text/javascript" src="assets/ueditor/ueditor.all.js"></script>
<script type="text/javascript" charset="utf-8" src="assets/ueditor/lang/zh-cn/zh-cn.js"></script>
<link rel="stylesheet" type="text/css" href="assets/css/bootstrap-fileupload.min.css" />
<script type="text/javascript" src="assets/js/bootstrap-fileupload.min.js"></script>
<div class="widget model_widget">
    <div class="widget-body">
        <div id="horizontal-form">
            <form class="form-horizontal" method="post" id="editMetaInfoForm">
            <input type="hidden" name="id" value="${meta.id}">
                <div >
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">大师姓名</label>
                        <div class="col-sm-9">
                            <input class="form-control" id="name" name="name" placeholder="大师姓名" value="${meta.name}" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">职称</label>
                        <div class="col-sm-9">
                            <input class="form-control" id="positio" name="positio" placeholder="职称" value="${meta.positio}" required>
                        </div>
                    </div>
                    <%-- <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">头像</label>
                        <div class="col-sm-9">
                            <input type="file" id="pictures2" name="pictures" placeholder="头像" required value="${meta.photo}">
                        </div>
                    </div> --%>
                     <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">头像</label>
                        <div class="col-sm-9">
                        	<div id="preview" style="width: 200px; height: 150px;">
                        	
                        	<img alt="图片" src="/${meta.photo}">
                        	
                        	</div>
                        	<style type="text/css">
								#uploadImg{ 
									width:100px;
									height:35px;
									line-height:35px;
									text-align:center;
									background:#427fed;
									font-size:14px;
									color:#fff;
									position:relative;
									cursor:pointer;
									border-radius:4px;
									margin-top:5px;
								}
								#pictures11{
									width:100%;
									height:100%;
									position:absolute;
									left:0;
									top:0;
									cursor:pointer;
									opacity:0;
									filter:alpha(opacity=0);
									z-index:2;
								}
								#preview img{
									width:100%;
									height:100%;
								}
							</style>
                        	<div id="uploadImg">
                        		<span>选择图片</span>
                        		<input type="file" id="pictures11" name="pictures" placeholder="头像" onchange="preview(this)"/>
                        	</div>
                        </div>
                    </div>
                    
                    
                    <div class="form-group">
						<label class="col-sm-2 col-sm-2 control-label">个人简介</label>
						<div class="col-sm-8">
							<textarea class="content" name="brief" id="brief" required>${meta.brief}</textarea>
						</div>
					</div>
					 <div class="form-group">
						<label class="col-sm-2 col-sm-2 control-label">艺术家年表</label>
						<div class="col-sm-8">
							<textarea class="content" name="chronology" id="chronology" required>${meta.chronology}</textarea>
						</div>
					</div>
					 <div class="form-group">
						<label class="col-sm-2 col-sm-2 control-label">获奖情况</label>
						<div class="col-sm-8">
							<textarea class="content" name="award" id="award" required>${meta.award}</textarea>
						</div>
					</div>
					 <div class="form-group">
						<label class="col-sm-2 col-sm-2 control-label">代表作品</label>
						<div class="col-sm-8">
							<textarea class="content" name="representwork" id="representwork" required>${meta.representwork}</textarea>
						</div>
					</div>
                    
                    <script type="text/javascript">
						UE.getEditor('brief',{
					        initialFrameWidth : 650,
					        initialFrameHeight: 400
						});
						UE.getEditor('chronology',{
					        initialFrameWidth : 650,
					        initialFrameHeight: 400
						});
						UE.getEditor('award',{
					        initialFrameWidth : 650,
					        initialFrameHeight: 400
						});
						UE.getEditor('representwork',{
					        initialFrameWidth : 650,
					        initialFrameHeight: 400
						});
						
					</script>
                </div>
            </form>
        </div>
    </div>
</div>
