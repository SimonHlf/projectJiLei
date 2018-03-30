<%@page pageEncoding="utf-8"%>
<%@taglib prefix="v" tagdir="/WEB-INF/tags"%>
<script type="text/javascript" src="assets/js/datetime/jedate.js"></script>
<link rel="stylesheet" type="text/css" href="assets/css/jedate.css">
<link rel="stylesheet" type="text/css" href="assets/css/bootstrap-fileupload.min.css" />
<script type="text/javascript" src="assets/js/bootstrap-fileupload.min.js"></script>
<script src="shop/productCategory/productCategory.js"></script>
<div class="widget model_widget">
	<div class="widget-body">
		<div id="horizontal-form">
			<form class="form-horizontal" method="post" id="addproductCategoryForm" enctype="multipart/form-data">
				<div class="form-group">
					<label class="col-sm-2 control-label no-padding-right">类别名称</label>
					<div class="col-sm-9">
						<input class="form-control" id="shopTypeName" name="shopTypeName"
							placeholder="类别名称" required>
					</div>
				</div>
				
			 <div class="form-group">
                      <label class="col-sm-2 control-label no-padding-right">类别图标</label>
                      <div class="col-sm-9">
                      	<div id="preview" style="width: 200px; height: 150px;">
                      	
                      	<img alt="图片" src="http://www.placehold.it/200x150/EFEFEF/AAAAAA&amp;text=no+image">
                      	
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
                      		<input type="file" id="pictures11" multiple name="pictures" placeholder="类别图标" onchange="preview(this)" required/>
                      	</div>
                      	<!--  <button onclick="hqV()">获取图片value</button> -->
                      </div>
                  </div>
				<div class="form-group">
					<label class="col-sm-2 control-label no-padding-right">类别级别</label>
					<div class="col-sm-9">
						<input class="form-control" id="shopTypeLevel"
							name="shopTypeLevel" placeholder="类别级别" required>
					</div>
				</div>
			   <!-- <div class="form-group">
					<label class="col-sm-2 control-label no-padding-right">上级类别编号</label>
					<div class="col-sm-9">
						<input class="form-control" id="parentId" name="parentId"
							placeholder="上级类别编号">
					</div>
				</div>   -->   

				<div class="form-group">
					<label class="col-sm-2 control-label no-padding-right">备注</label>
					<div class="col-sm-9">
						<input class="form-control" id="remarks" name="remarks"
							placeholder="备注" required>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label no-padding-right">排序</label>
					<div class="col-sm-9">
						<input class="form-control" id="sort" name="sort" placeholder="排序"
							required>
					</div>
				</div>
				 
				<div class="form-group">
					<label class="col-sm-2 control-label no-padding-right">描述</label>
					<div class="col-sm-9">
						<input class="form-control" id="description" name="description"
							placeholder="描述" required>
					</div>
				</div>
				
  			</form>
		</div>
	</div>
</div>
