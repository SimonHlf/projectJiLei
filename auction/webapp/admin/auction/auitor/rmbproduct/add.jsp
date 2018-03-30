 <%@page pageEncoding="utf-8"%>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>
<link rel="stylesheet" type="text/css" href="assets/css/bootstrap-fileupload.min.css" />
<script type="text/javascript" src="assets/js/bootstrap-fileupload.min.js"></script>
<script src="auction/auitor/auitor.js"></script>

<div class="widget model_widget">
 	<div class="widget-body">
		<div id="horizontal-form">
			<form class="form-horizontal" method="post" id="addImgForm">
			
				
				<div class="form-group">
					  <label class="col-sm-2 control-label no-padding-right">图片</label>
					<div class="col-sm-9">
					<div class="fileupload fileupload-new" data-provides="fileupload">
							<div class="fileupload-new thumbnail"
								style="width: 200px; height: 150px;">
								<img
									src="http://www.placehold.it/200x150/EFEFEF/AAAAAA&amp;text=no+image"
									alt="" />
							</div>
						<div class="fileupload-preview fileupload-exists thumbnail"
								style="max-width: 200px; max-height: 150px; line-height: 20px;"></div>
							<div>
								<span class="btn btn-default btn-file"> <span
									class="fileupload-new"><i class="fa fa-paper-clip"></i>选择图片</span>
									<span class="fileupload-exists"><i class="fa fa-undo"></i>
										替换</span> 上传图片 <input type="file" class="default"
									name="pictures" id="imgs" />
								</span> <a href="#" class="btn btn-danger fileupload-exists"
									data-dismiss="fileupload"><i class="fa fa-trash"></i>
								删除 </a>
							</div>
							<span id="pictureSpan"></span> 
						</div>
						<div class="tipInfoTxt left1">
							<p>a.&nbsp;尺寸<span style="color:red;">698*538px(宽*高)</span></p>
							<p>b.&nbsp;图片大小<span style="color:red;">不超过1M</span></p>
						</div>
					</div>
				</div>  
		  		<input type="hidden" name="type" value="${type}">
				<input type="hidden" name="productid" value="${pid}">
				<div class="widget-buttons">
                	<button type="button" onclick="saveRmbComment()" class="btn btn-info btn-ok">保存</button>
                	<button type="button" onclick="fanhui()" class="btn btn-default">返回</button>
            	</div>
			</form>
		</div>
	</div>
</div>
